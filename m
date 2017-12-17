From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 8/9] ARM: dts: imx7-colibri: add MCP2515 CAN controller
Date: Sun, 17 Dec 2017 19:52:50 -0200
Message-ID: <CAOMZO5CPeY3dwRsTaw9Z-sfgvsYKceU1SaaY_pw=nis=Q8OFrg@mail.gmail.com>
References: <20171217203723.15896-1-stefan@agner.ch> <20171217203723.15896-8-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171217203723.15896-8-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 17, 2017 at 6:37 PM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
> The Colibri Evaluation Carrier Board provides a MCP2515 CAN
> controller connected via SPI. Note that the i.MX 7 provides
> an internal CAN controller which is much better suited for CAN
> operations. Using the MCP2515 with a Colibri iMX7 module is
> mainly useful to test the SPI interface.
>
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
