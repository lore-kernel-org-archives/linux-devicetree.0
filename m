From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 0/2] ARM: mach-moxart: add MOXA ART SoC support
Date: Wed, 18 Dec 2013 09:26:10 -0800
Message-ID: <0e3d482f-0b7c-4654-bb75-d6aa3e209fd7@CH1EHSMHS008.ehs.local>
References: <1387371526-15309-1-git-send-email-jonas.jensen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1387371526-15309-1-git-send-email-jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jonas,

On Wed, Dec 18, 2013 at 01:58:44PM +0100, Jonas Jensen wrote:
> Thanks for the replies!
>=20
> This should tick the boxes on feedback except for one detail
> on the fixed rate clock:
>=20
> Moving fixed-clock "ref12" from .dtsi to .dts proved problematic
> for other clocks, this is why ref12 is still in SoC.
>=20
> My assertion is that "fixed-clock" clocks are probed later when
> placed in .dts (see diff and boot log below).
> of_clk_get() from clk_pll in .dtsi fails, i.e. fixed-clock ref12
> is not added as a provider in time before clk_pll loads.

I haven't looked into the details, but is of_clk_get_parent_name() an
alternative? That function does purely rely on DT data to obtain a name
of a clock which may enable to register your PLL? Then probing oder
wouldn't matter anymore.

	S=C3=B6ren


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
