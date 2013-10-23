From: Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: move wl12xx pins to the proper pinmux for pandaboard
Date: Wed, 23 Oct 2013 10:33:51 +0200
Message-ID: <526789EF.7000507@baylibre.com>
References: <525852A4.6090500@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <525852A4.6090500-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Konovalov <andrey.konovalov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rnayak-l0cyMroinI0@public.gmane.org, luca-XPOmlcxoEMv1KXRcyAk9cg@public.gmane.org, p.pisati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrey,

On 11/10/2013 21:33, Andrey Konovalov wrote:
> Commit 851320e (ARM: dts: Fix muxing and regulator for wl12xx on the
> SDIO bus for pandaboard) put the wl12xx pins into omap4_pmx_wkup. Thi=
s
> is not correct, and results in the following messages at the boot tim=
e:
>
>   pinctrl-single 4a31e040.pinmux: mux offset out of range: 0x38 (0x38=
)
>   pinctrl-single 4a31e040.pinmux: could not add functions for
> pinmux_wl12xx_pins 56x
>
> Actually these pins belong to omap4_pmx_core.
>
> Signed-off-by: Andrey Konovalov <andrey.konovalov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

That patch does not apply on any on my branches. Could you rebase it
on top of my for_3.13/dts branch.

Thanks,
Benoit

--=20
Beno=EEt Cousson
BayLibre
Embedded Linux Technology Lab
www.baylibre.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
