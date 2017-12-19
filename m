From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] ARM: dts: imx6: Add support for phyBOARD-Mira i.MX
 6Quad/Dual RDK
Date: Tue, 19 Dec 2017 15:12:43 -0200
Message-ID: <CAOMZO5BKiQ8MC-LEmWwEYcEXKqLNgcfwc=bki9a3OROyN1P+Fg@mail.gmail.com>
References: <1513698588-13325-1-git-send-email-s.riedmueller@phytec.de> <1513698588-13325-4-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513698588-13325-4-git-send-email-s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Riedmueller <s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christian Hemp <c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, Stefan Christ <s.christ-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 19, 2017 at 1:49 PM, Stefan Riedmueller
<s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org> wrote:

> +/ {
> +       model = "PHYTEC phyBOARD-Mira Quad Carrier-Board with eMMC";
> +       compatible = "phytec,imx6q-pbac06-emmc", "phytec,imx6q-pbac06",
> +                    "phytec,imx6qdl-pcm058", "fsl,imx6q";
> +
> +       aliases {
> +               ipu1 = &ipu2;
> +       };

This alias is not needed as it is part of imx6q.dtsi.

> +/ {
> +       model = "PHYTEC phyBOARD-Mira Quad Carrier-Board with NAND";
> +       compatible = "phytec,imx6q-pbac06-nand", "phytec,imx6q-pbac06",
> +                    "phytec,imx6qdl-pcm058", "fsl,imx6q";
> +
> +       aliases {
> +               ipu1 = &ipu2;
> +       };

Ditto.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
