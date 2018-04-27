Return-Path: <robherring2@gmail.com>
Date: Fri, 27 Apr 2018 13:54:58 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] Documentation: mmc: add description for
 power-delay-ms
Message-ID: <20180427185458.6o5tlfic75gy2vqr@rob-hp-laptop>
References: <1524471030-3527-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524471030-3527-1-git-send-email-shawn.lin@rock-chips.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Apr 23, 2018 at 04:10:29PM +0800, Shawn Lin wrote:
> power-delay-ms woule be used to substitute the hard-coded 10ms
> delay waiting for power supply to be stable, specificed by individual
> platform/board. Default to 10ms as before, if no available.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/mmc/mmc.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc.txt b/Documentation/devicetree/bindings/mmc/mmc.txt
> index 467cd7b..8db2ba0 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/mmc.txt
> @@ -56,6 +56,8 @@ Optional properties:
>  - fixed-emmc-driver-type: for non-removable eMMC, enforce this driver type.
>    The value <n> is the driver type as specified in the eMMC specification
>    (table 206 in spec version 5.1).
> +- power-delay-ms: Tunable delay waiting for I/O signalling and card power supply
> +  to be stable. Default to 10ms if no available.

How long do you need? Would changing the default to say 20ms work and 
still be short enough others don't care?

Can we use the same property as the mmc pwrseq binding defines: 
post-power-on-delay-ms

Rob
