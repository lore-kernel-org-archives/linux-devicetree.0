From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: ux500: fix clock for GPIO blocks 6 and 7
Date: Fri, 18 Oct 2013 12:07:23 +0100
Message-ID: <20131018110723.GY19112@lee--X1>
References: <1382087112-31665-1-git-send-email-linus.walleij@linaro.org>
 <20131018110557.GW19112@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131018110557.GW19112@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 18 Oct 2013, Lee Jones wrote:

> On Fri, 18 Oct 2013, Linus Walleij wrote:
>=20
> > The clock assignment in the device tree for GPIO blocks 6
> > and 7 was incorrect, indicating this was managed by bit 1 on
> > PRCC 2 while it was in fact bit 11 on PRCC 2.
>=20
> Nice catch.
>=20
> It's also wrong in the driver:

Sorry, forgot this: Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
