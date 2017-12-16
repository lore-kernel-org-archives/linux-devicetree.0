From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/9] ARM: dts: imx7-colibri: move and rename USB Host
 power regulator
Date: Sat, 16 Dec 2017 12:00:20 -0200
Message-ID: <CAOMZO5Ak+F7KMvYYDfGrWx-LzPMQGYpfyes7Nz=mgZKSQ_ZV_g@mail.gmail.com>
References: <20171206153005.6144-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171206153005.6144-1-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 6, 2017 at 1:29 PM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
> The Colibri default which enables USB Host power is not necessarily
> tied to the OTG2 controller, some carrier board use the pin to
> control USB power for both controllers. Hence name the pinctrl
> group more generic.
>
> Also move the regulator to the generic eval-v3 device tree since
> the regulator is always on the carrier board. In the Colibri iMX7S
> case the regulator is just not used.  This allows to reuse the
> regulator in a upcoming SKU Colibri iMX7D 1GB with eMMC.
>
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
