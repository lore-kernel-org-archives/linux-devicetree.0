From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 6/9] ARM: dts: add support for I2SE Duckbill 2 boards
Date: Mon, 10 Apr 2017 16:24:02 +0800
Message-ID: <20170410082400.GA1872@dragon>
References: <1486626169-20022-1-git-send-email-michael.heimpold@i2se.com>
 <1486626169-20022-7-git-send-email-michael.heimpold@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486626169-20022-7-git-send-email-michael.heimpold-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Heimpold <michael.heimpold-eS4NqCHxEME@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan.wahren-eS4NqCHxEME@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 09, 2017 at 08:42:46AM +0100, Michael Heimpold wrote:
> From: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
> 
> This machine is an USB pen drive sized development board,
> based on NXP's i.MX28 CPU. In contrast to the previous
> model "Duckbill", the "Duckbill 2" series has internal
> eMMC storage.
> 
> Signed-off-by: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
> Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile             |   1 +
>  arch/arm/boot/dts/imx28-duckbill-2.dts | 183 +++++++++++++++++++++++++++++++++
>  arch/arm/mach-mxs/mach-mxs.c           |   3 +-

I'm preparing pull request for 4.12 merge window, and found this.
C file change shouldn't be mixed in DTS patch, so I dropped it.  Please
submit C code change in a separate patch.

Shawn

>  3 files changed, 186 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/imx28-duckbill-2.dts
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
