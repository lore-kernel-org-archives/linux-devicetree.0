From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] ARM: dts: imx53-tx53: Fix 'ethernet-phy@0' node with
 unit name and no reg property
Date: Thu, 26 Oct 2017 12:29:11 -0200
Message-ID: <CAOMZO5DunnnMQ7yXr-OnJd51qGE39UheUDvSuvBmpomt2W2UDA@mail.gmail.com>
References: <1508946042-17671-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508946042-17671-1-git-send-email-marco.franchi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Marco Antonio Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marco,

On Wed, Oct 25, 2017 at 1:40 PM, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org> wrote:

>                         fec: ethernet@63fec000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;

This does not look corret.

You should these lines under 'mdio':

mdio {
     #address-cells = <1>;
     #size-cells = <0>;
   .....

Take a look at arch/arm/boot/dts/imx6ul-14x14-evk.dts for an example.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
