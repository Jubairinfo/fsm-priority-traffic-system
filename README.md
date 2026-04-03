# fsm-priority-traffic-system
A Verilog-based traffic light controller featuring Finite State Machine (FSM) logic with pedestrian and emergency vehicle priority overrides.
# Multi-Priority Traffic Light Controller (Verilog)

## 📌 Project Overview
A Finite State Machine (FSM) based traffic control system designed in Verilog. This project moves beyond a simple timer-based light by incorporating **Real-Time Priority Overrides**.

### Key Features:
- **Pedestrian Override:** Fast-tracks the transition to Yellow/Red when a pedestrian button is pressed.
- **Emergency Vehicle Priority:** Immediately resets the system to Green to clear traffic for emergency vehicles.
- **FSM Architecture:** Implemented using a 3-always block style for optimized synthesis.

## 🛠️ Tools Used
- **Language:** Verilog HDL
- **Simulator:** Icarus Verilog (iverilog)
- **Waveform Viewer:** GTKWave
- **Environment:** Google Colab (Linux-based simulation)

## 📊 Simulation Results
The waveform shows that when `emergency_input` is triggered, the internal `timer` is immediately bypassed, holding the `light` at Green (`001`).
## 🚀 How to Run
I’ve documented the full setup and reproduction steps in this README, ensuring the simulation is accessible to anyone via Google Colab. 

1. Click the **Open in Colab** badge.
2. Run the installation cell (`!apt-get install iverilog`).
3. Execute the simulation to generate the `emergency.vcd` file.
