From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dts: imx6ul iomuxc syscon is compatible to imx6q
Date: Mon, 29 Aug 2016 23:20:06 +0800
Message-ID: <20160829152006.GZ30790@tiger>
References: <1472480743-8405-1-git-send-email-Anson.Huang@nxp.com>
 <20160829143447.GV30790@tiger>
 <AM3PR04MB1315C6AE3AC95A1150DB04D7F5E10@AM3PR04MB1315.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AM3PR04MB1315C6AE3AC95A1150DB04D7F5E10-f56W/S9L6NR9w2ZlgAudoc9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yongcai Huang <anson.huang-3arQi8VN3Tc@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org" <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 29, 2016 at 02:44:47PM +0000, Yongcai Huang wrote:
> This patch is to set the GINT bit for all low power mode transition.
> 
> Do we decide to go with PSCI for all i.MX6 SoCs? Currently i.MX6UL's suspend is
> already supported with non-PCSI method, only i.MX7D uses PSCI, right? If we decide
> to implement all power management feature with PSCI, then yes, all these changes
> can be put into PSCI. But since current suspend/cpuidle function are already supported
> using old method, this bit must be set to avoid system goes into low power mode
> unexpected.

My apology.  I messed up it with i.MX7D.  Patch applied, thanks.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
