From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3][v2] arm64: freescale: ls2080a: Split devicetree for
 code resuability
Date: Fri, 30 Dec 2016 19:26:38 +0800
Message-ID: <20161230112635.GQ6177@dragon>
References: <1480325824-14649-1-git-send-email-abhimanyu.saini@nxp.com>
 <1480325824-14649-3-git-send-email-abhimanyu.saini@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480325824-14649-3-git-send-email-abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, scott.wood-3arQi8VN3Tc@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Priyanka Jain <priyanka.jain-3arQi8VN3Tc@public.gmane.org>, Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 28, 2016 at 03:07:03PM +0530, Abhimanyu Saini wrote:
> LS2088A and LS2080A are similar SoCs with a few differences like
> ARM cores etc.
> 
> Reorganize the LS2080A device tree to move the common nodes to:
> 	- fsl-ls2080a-ls2088a.dtsi
> 	- fsl-ls2080a-ls2088a-rdb.dts
> 	- fsl-ls2080a-ls2088a-qds.dts

I do not quite like the naming of these files.  Will the following one
be better?

 - fsl-ls208xa.dtsi
 - fsl-ls208xa-rdb.dtsi
 - fsl-ls208xa-qds.dtsi

Also if a DTS file is only to be included by another one, not to
generate a DTB, we name it .dtsi rather than .dts.

Shawn

> 
> Signed-off-by: Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Priyanka Jain <priyanka.jain-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>
> ---
>  .../boot/dts/freescale/fsl-ls2080a-ls2088a-qds.dts | 196 ++++++
>  .../boot/dts/freescale/fsl-ls2080a-ls2088a-rdb.dts | 152 +++++
>  .../boot/dts/freescale/fsl-ls2080a-ls2088a.dtsi    | 727 +++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts  | 154 +----
>  arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dts  | 110 +---
>  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     | 706 +-------------------
>  6 files changed, 1100 insertions(+), 945 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2080a-ls2088a-qds.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2080a-ls2088a-rdb.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2080a-ls2088a.dtsi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
