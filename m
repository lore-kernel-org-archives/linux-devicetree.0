From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND 00/16] Support TI LMU devices
Date: Wed, 25 Nov 2015 09:05:46 +0000
Message-ID: <20151125090546.GN12874@x1>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <20151102085924.GP4058@x1>
 <56385998.5080006@ti.com>
 <20151103083344.GA3503@x1>
 <5655767A.8030003@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5655767A.8030003@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Kim, Milo" <milo.kim@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 25 Nov 2015, Kim, Milo wrote:

> On 11/3/2015 5:33 PM, Lee Jones wrote:
> >On Tue, 03 Nov 2015, Kim, Milo wrote:
> >
> >>Hi Lee,
> >>
> >>On 11/2/2015 5:59 PM, Lee Jones wrote:
> >>>>  drivers/video/backlight/Kconfig                    |  62 ++
> >>>>>  drivers/video/backlight/Makefile                   |   7 +
> >>>>>  drivers/video/backlight/lm3532_bl.c                | 183 +++++
> >>>>>  drivers/video/backlight/lm3631_bl.c                | 129 ++++
> >>>>>  drivers/video/backlight/lm3632_bl.c                | 125 ++++
> >>>>>  drivers/video/backlight/lm3633_bl.c                | 210 +++++=
+
> >>>>>  drivers/video/backlight/lm3695_bl.c                |  91 +++
> >>>>>  drivers/video/backlight/lm3697_bl.c                | 187 +++++
> >>>>>  drivers/video/backlight/ti-lmu-backlight.c         | 429 +++++=
+++++++
> >>>>>  drivers/video/backlight/ti-lmu-backlight.h         | 152 +++++
> >>>How different are all of these drivers?
> >>>
> >>>Can you create one driver that supports them all instead?
> >>>
> >>
> >>Thanks for your suggestion.
> >>
> >>'ti-lmu-backlight' is the common part of lmxxxx_bl drivers. And eac=
h
> >>lmxxx_bl has its own operation functions by using ti_lmu_bl_ops.
> >>I've tried to make consolidated driver but it contained too much
> >>device specific code in one file. So I prefer simple drivers
> >>structure - 'common part' and 'device specific operations'.
> >>It would be appreciated if you could introduce better idea.
> >
> >I wish to avoid having to apply the patches to conduct my own analys=
is
> >of the files, as I am severely restricted on time.  Can you tell me =
how
> >much duplicated code there is between the files?  How many lines wou=
ld
> >be saved by supporting all of the lm* drivers in a single file?
> >
>=20
> Now, consolidated driver is ready. It improves not only lines of
> code but also code size. Patch v2 will be sent soon.
>=20
> Lines of code
> -------------
> 194 lines are saved in consolidated driver.
>=20
> Patch v1: 1420 (8 files*)
> Patch v2: 1226 (3 files**)
>=20
> *	ti-lmu-backlight.c (429)
> 	ti-lmu-backlight.h (152)
> 	lm3532_bl.c (183)
> 	lm3631_bl.c (129)
> 	lm3632_bl.c (125)
> 	lm3633_bl.c (210)
> 	lm3695_bl.c (95)
> 	lm3697_bl.c (97)
>=20
> **	ti-lmu-backlight-core.c (649)
> 	ti-lmu-backlight-data.c (287)
> 	ti-lmu-backlight.h (290)
>=20
> Size
> ----
> The text segment is decreased by removing duplicate instructions.
>=20
> Patch v1
>    text	   data	    bss	    dec	    hex	filename
>   12202	    720	     40	  12962	   32a2	drivers/video/backlight/built=
-in.o
>=20
> Patch v2
>    text	   data	    bss	    dec	    hex	filename
>    6883	    712	     41	   7636	   1dd4	drivers/video/backlight/built=
-in.o
>=20
> Test environment
> ----------------
> - Kernel version: 4.4.0-rc2 (linux-next)
> - backlight/built-in.o includes backlight core and ti-lmu-backlight
> drivers. No other backlight drivers included.
>=20
> Change details will be described in the patch-set.

Excellent news.  Thanks for carrying out this work.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
