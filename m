From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND][PATCH 6/6] arm64: Add DTS support for FSL's LS2088A SoC
Date: Mon, 14 Nov 2016 14:33:48 +0800
Message-ID: <20161114063346.GH3310@dragon>
References: <1478597664-14799-1-git-send-email-abhimanyu.saini@nxp.com>
 <1478597664-14799-7-git-send-email-abhimanyu.saini@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1478597664-14799-7-git-send-email-abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, scott.wood-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Priyanka Jain <priyanka.jain-3arQi8VN3Tc@public.gmane.org>, Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 08, 2016 at 03:04:24PM +0530, Abhimanyu Saini wrote:
> This patch adds the device tree support for FSL LS2088A SoC based on
> ARMv8 architecture.
> 
> Following levels of DTSI/DTS files have been created for the LS2088A
> SoC family:
> 
>      - fsl-ls2088a.dtsi:
>             DTS-Include file for FSL LS2088A SoC.
> 
>      - fsl-ls2088a-qds.dts:
>             DTS file for FSL LS2088A QDS board.
> 
>      - fsl-ls2088a-rdb.dts:
>             DTS file for FSL LS2088A RDB board.

I compared the following files.

 fsl-ls2088a.dtsi vs. fsl-ls2080a.dtsi
 fsl-ls2088a-qds.dtsi vs. fsl-ls2080a-qds.dtsi
 fsl-ls2088a-rdb.dtsi vs. fsl-ls2080a-rdb.dtsi

They are basically identical except a couple of small changes.  Can we
do something to have these SoCs share the dts files at some level to
avoid maintaining duplicated files?

Shawn 

> Signed-off-by: Priyanka Jain <priyanka.jain-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm64/boot/dts/freescale/Makefile            |   2 +
>  arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dts | 211 +++++++
>  arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dts | 166 +++++
>  arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi    | 703 ++++++++++++++++++++++
>  4 files changed, 1082 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
