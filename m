From: Federico Vaga <federico.vaga@cern.ch>
Subject: Device Description for FPGA Components on x86 system
Date: Wed, 27 Mar 2019 18:17:18 +0100
Message-ID: <1629227.alSmCsHHUc@pcbe13614>
Reply-To: <federico.vaga@cern.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-fpga@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-x86_64@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

I'm looking for guidance

What I have:
* Intel x86_64 computer
* PCIe card with FPGA on it

What I want to achieve:
* load an FPGA bitstream on the card
* load a device-tree like description for the FPGA devices contained in the 
bitstream

This is achievable on ARM with DeviceTree, overlay-dt, fpga-mgr; but I'm 
puzzled about the x86_64 use-case. I'm not able to find recent and clear 
information.

Does anyone know if this is doable? Perhaps with ACPI SSDTs overlay? Or with 
the DT?

thanks 
