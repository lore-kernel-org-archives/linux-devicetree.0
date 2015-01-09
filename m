From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niso-UNjuZkX4dYU@public.gmane.org>
Subject: Re: [PATCH 0/4] sh-pfc: Add emev2 pinmux support
Date: Fri, 9 Jan 2015 11:22:06 +0100
Message-ID: <20150109102206.GB30143@bigcity.berto.se>
References: <1418414497-23741-1-git-send-email-niso@kth.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418414497-23741-1-git-send-email-niso-UNjuZkX4dYU@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Linus and Laurent,

I know we are coming out of the holiday season so here is a humble ping
on this patchset.

* Niklas S=F6derlund <niso-UNjuZkX4dYU@public.gmane.org> [2014-12-12 21:01:33 +0100]:

> Greetings,
>
> This patchset introduces pinmux support for the EMMA Mobile EV2 board=
 to
> the sh-pfc pin-controller driver. Devicetree bindings for gpio and th=
e
> populated serial connector are also defined in 3/4 and 4/4.
>
> Comments are welcome!
>
> Regards
> // Niklas
>
> Niklas S=F6derlund (4):
>   sh-pfc: add macro to define pinmux without function
>   sh-pfc: Add emev2 pinmux support
>   ARM: shmobile: emev2: Add PFC information to emev2.dtsi
>   ARM: shmobile: emev2-kzm9d: Add PFC information for uart1
>
>  .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
>  arch/arm/boot/dts/emev2-kzm9d.dts                  |   13 +
>  arch/arm/boot/dts/emev2.dtsi                       |   11 +
>  drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
>  drivers/pinctrl/sh-pfc/Makefile                    |    1 +
>  drivers/pinctrl/sh-pfc/core.c                      |    9 +
>  drivers/pinctrl/sh-pfc/core.h                      |    1 +
>  drivers/pinctrl/sh-pfc/pfc-emev2.c                 | 1915 ++++++++++=
++++++++++
>  drivers/pinctrl/sh-pfc/sh_pfc.h                    |    2 +
>  9 files changed, 1958 insertions(+)
>  create mode 100644 drivers/pinctrl/sh-pfc/pfc-emev2.c
>
> --
> 2.1.3
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
