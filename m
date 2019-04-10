From: Federico Vaga <federico.vaga@cern.ch>
Subject: Re: Device Description for FPGA Components on x86 system
Date: Wed, 10 Apr 2019 12:01:33 +0200
Message-ID: <6563205.xRkLC0driV@pcbe13614>
References: <1629227.alSmCsHHUc@pcbe13614>
Reply-To: <federico.vaga@cern.ch>, <federico.vaga@cern.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1629227.alSmCsHHUc@pcbe13614>
Sender: linux-kernel-owner@vger.kernel.org
To: federico.vaga@cern.chFederico Vaga <federico.vaga@cern.ch>
Cc: linux-kernel@vger.kernel.org, linux-fpga@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-x86_64@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

sorry to push for an answer but I do not want to take the risk of designing 
something useless. I do not know how should I interpret a no-answer.

If the solution really does not exist today, then I would like to collect 
opinions/arguments/requirements on the topic so that I can write something 
useful not only for CERN but for the entire community.

Thank you

On Wednesday, March 27, 2019 6:17:18 PM CEST Federico Vaga wrote:
> Hello,
> 
> I'm looking for guidance
> 
> What I have:
> * Intel x86_64 computer
> * PCIe card with FPGA on it
> 
> What I want to achieve:
> * load an FPGA bitstream on the card
> * load a device-tree like description for the FPGA devices contained in the
> bitstream
> 
> This is achievable on ARM with DeviceTree, overlay-dt, fpga-mgr; but I'm
> puzzled about the x86_64 use-case. I'm not able to find recent and clear
> information.
> 
> Does anyone know if this is doable? Perhaps with ACPI SSDTs overlay? Or with
> the DT?
> 
> thanks
