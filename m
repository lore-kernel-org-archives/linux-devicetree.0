Return-Path: <SRS0=cncA=GU=verge.net.au=horms@kernel.org>
Date: Fri, 30 Mar 2018 15:49:47 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH/RFT v2 0/3] thermal: add support for r8a77995
Message-ID: <20180330134946.pa3565f2cbtucgja@verge.net.au>
References: <1522379583-4503-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1522379583-4503-1-git-send-email-ykaneko0929@gmail.com>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Mar 30, 2018 at 12:13:00PM +0900, Yoshihiro Kaneko wrote:
> This series adds thermal support for r8a77995.
> R-Car D3 (r8a77995) have a thermal sensor module which is similar to Gen2.
> Therefore this series adds r8a77995 support to rcar_thermal driver not
> rcar_gen3_thermal driver.
> 
> This series is based on the next branch of Zhang Rui's linux tree.

I have very lightly tested this as follows after enabling
CONFIG_RCAR_THERMAL in the kernel .config.

# cat /sys/devices/virtual/thermal/thermal_zone0/temp
40000
