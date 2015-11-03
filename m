From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND 00/16] Support TI LMU devices
Date: Tue, 3 Nov 2015 08:33:44 +0000
Message-ID: <20151103083344.GA3503@x1>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <20151102085924.GP4058@x1>
 <56385998.5080006@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56385998.5080006@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Kim, Milo" <milo.kim@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 03 Nov 2015, Kim, Milo wrote:

> Hi Lee,
>=20
> On 11/2/2015 5:59 PM, Lee Jones wrote:
> >>  drivers/video/backlight/Kconfig                    |  62 ++
> >>>  drivers/video/backlight/Makefile                   |   7 +
> >>>  drivers/video/backlight/lm3532_bl.c                | 183 +++++
> >>>  drivers/video/backlight/lm3631_bl.c                | 129 ++++
> >>>  drivers/video/backlight/lm3632_bl.c                | 125 ++++
> >>>  drivers/video/backlight/lm3633_bl.c                | 210 ++++++
> >>>  drivers/video/backlight/lm3695_bl.c                |  91 +++
> >>>  drivers/video/backlight/lm3697_bl.c                | 187 +++++
> >>>  drivers/video/backlight/ti-lmu-backlight.c         | 429 +++++++=
+++++
> >>>  drivers/video/backlight/ti-lmu-backlight.h         | 152 +++++
> >How different are all of these drivers?
> >
> >Can you create one driver that supports them all instead?
> >
>=20
> Thanks for your suggestion.
>=20
> 'ti-lmu-backlight' is the common part of lmxxxx_bl drivers. And each
> lmxxx_bl has its own operation functions by using ti_lmu_bl_ops.
> I've tried to make consolidated driver but it contained too much
> device specific code in one file. So I prefer simple drivers
> structure - 'common part' and 'device specific operations'.
> It would be appreciated if you could introduce better idea.

I wish to avoid having to apply the patches to conduct my own analysis
of the files, as I am severely restricted on time.  Can you tell me how
much duplicated code there is between the files?  How many lines would
be saved by supporting all of the lm* drivers in a single file?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
