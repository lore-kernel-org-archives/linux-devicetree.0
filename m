From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/9] ARM: dts: imx7-colibri: make sure multiplexed pins
 are not active
Date: Sat, 16 Dec 2017 12:01:51 -0200
Message-ID: <CAOMZO5AD6bDEMStEWY8hRG_8gh0RAD_66zboTsKd-cFkPtiLKg@mail.gmail.com>
References: <20171206153005.6144-1-stefan@agner.ch> <20171206153005.6144-2-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171206153005.6144-2-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 6, 2017 at 1:29 PM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
> The Colibri pins PWM<A> and <D> are multiplexed on the module, make
> sure the secondary SoC pin is not active.
>
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

I haven't really understood the commit message, but this is probably
because I don't have access to the schematics.

Anyway:

Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
