From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 05/11] ARM: dts: imx6dl: Remove unneeded label and
 unit address
Date: Fri, 01 Dec 2017 14:04:33 +0100
Message-ID: <1512133473.5918.13.camel@pengutronix.de>
References: <1511981684-13433-1-git-send-email-festevam@gmail.com>
         <1511981684-13433-5-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511981684-13433-5-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2017-11-29 at 16:54 -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> 
> Remove unneeded label and unit address in order to fix the following
> build warnings with W=1:
> 
> arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (unit_address_vs_reg): Node /soc/aips-bus@2000000/iomuxc-gpr@20e0000/ipu1_csi0_mux@34 has a unit name, but no reg property
> arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (unit_address_vs_reg): Node /soc/aips-bus@2000000/iomuxc-gpr@20e0000/ipu1_csi1_mux@34 has a unit name, but no
> 
> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Reviewed-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

regards
Philipp
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
