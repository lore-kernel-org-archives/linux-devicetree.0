From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/4] phy: phy-stih407-usb: Add usb picoPHY driver found on stih407 SoC family
Date: Tue, 09 Sep 2014 14:05:51 +0200
Message-ID: <2931258.khlMVogpQg@wuerfel>
References: <1410253218-18318-1-git-send-email-peter.griffin@linaro.org> <1410253218-18318-2-git-send-email-peter.griffin@linaro.org> <1706244.K6iQdujHby@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1706244.K6iQdujHby@amdc1032>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, peppe.cavallaro-qxv4g6HH51o@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 09 September 2014 13:52:54 Bartlomiej Zolnierkiewicz wrote:
> I believe that this should use
> 
>         select GENERIC_PHY
> 
> instead (just like all other PHY drivers except PHY_MIPHY365X which
> also should be fixed to use select).

Right. It would also be good to change 'depends on ARCH_STI'
into 'depends on ARCH_STI || COMPILE_TEST', but only if it
actually compiles on x86.

Note that currently both providers and users of the PHY API
use 'select GENERIC_PHY', which probably not what we want:
only providers (like this one) should 'select' it, while
drivers using this interface could either 'depends on
GENERIC_PHY' or leave out the Kconfig dependency entirely.

Adding 'depends on' for drivers using the interface might
be cleaner, but can result in dependency loops.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
