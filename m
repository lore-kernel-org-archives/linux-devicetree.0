From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 0/2] Rename dt header and move clock binding
Date: Mon, 18 Mar 2019 13:42:05 +0100
Message-ID: <a23b7c49-d6fb-5e11-7770-c860e8c9b8f9@xilinx.com>
References: <1551300670-6949-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551300670-6949-1-git-send-email-jollys@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <jolly.shah@xilinx.com>, robh+dt@kernel.org
Cc: michal.simek@xilinx.com, rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

On 27. 02. 19 21:51, Jolly Shah wrote:
> This patchset renames clock dt include file to align with other incldues.
> Other patch moves clock binding to a separate file under clock directory to
> align with other firmware child binding documenetation.
> 
> Jolly Shah (1):
>   include: dt-binding: clock: Rename zynqmp header file
> 
> Rajan Vaja (1):
>   dt-bindings: xilinx: Separate clock binding from firmware doc
> 
>  .../devicetree/bindings/clock/xlnx,zynqmp-clk.txt  |  63 +++++++++++
>  .../firmware/xilinx/xlnx,zynqmp-firmware.txt       |  54 +--------
>  include/dt-bindings/clock/xlnx,zynqmp-clk.h        | 116 -------------------
>  include/dt-bindings/clock/xlnx-zynqmp-clk.h        | 126 +++++++++++++++++++++
>  4 files changed, 190 insertions(+), 169 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
>  delete mode 100644 include/dt-bindings/clock/xlnx,zynqmp-clk.h
>  create mode 100644 include/dt-bindings/clock/xlnx-zynqmp-clk.h
> 

I have applied this. Please let me know if you see any issue with it.

Thanks,
Michal
