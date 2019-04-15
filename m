From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v5 1/3] firmware: xilinx: Add fpga API's
Date: Mon, 15 Apr 2019 10:34:12 +0200
Message-ID: <24f666c6-50e7-36d9-62a9-73efb9d66dda@xilinx.com>
References: <20190415071748.32275-1-nava.manne@xilinx.com>
 <20190415071748.32275-2-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415071748.32275-2-nava.manne@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nava kishore Manne <nava.manne@xilinx.com>, atull@kernel.org, mdf@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, rajanv@xilinx.com, jollys@xilinx.com, linux-fpga@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, chinnikishore369@gmail.com
List-Id: devicetree@vger.kernel.org

On 15. 04. 19 9:17, Nava kishore Manne wrote:
> This Patch Adds fpga API's to support the Bitstream loading
> by using firmware interface.
> 
> Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> Reviewed-by: Moritz Fischer <mdf@kernel.org>
> ---
> Changes for v5:
> 		-Modified API's doc as suggested by Moritz.
> 
>  drivers/firmware/xilinx/zynqmp.c     | 45 ++++++++++++++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h | 12 ++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index 98f936125643..f355ad42917c 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -537,6 +537,49 @@ static int zynqmp_pm_reset_get_status(const enum zynqmp_pm_reset reset,
>  	return ret;
>  }
>  
> +/*

This should be /**

I have fixed it myself and applied the whole series to zynqmp/soc branch
and this will go via arm-soc tree.

Thanks,
Michal
