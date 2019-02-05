Return-Path: <SRS0=tFzT=QM=gmail.com=akinobu.mita@kernel.org>
MIME-Version: 1.0
References: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com> <20190204090521.5ngcycuvccvfrpqb@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190204090521.5ngcycuvccvfrpqb@valkosipuli.retiisi.org.uk>
From: Akinobu Mita <akinobu.mita@gmail.com>
Date: Tue, 5 Feb 2019 22:39:56 +0900
Message-ID: <CAC5umyhhfxFiPnS6Kj-m-VgcEt8p6BOSBF=T_TdozNHCCkbPSw@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] media: mt9m001: switch soc_mt9m001 to a standard
 subdev sensor driver
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

2019=E5=B9=B42=E6=9C=884=E6=97=A5(=E6=9C=88) 18:06 Sakari Ailus <sakari.ail=
us@iki.fi>:
>
> Hi Mita-san,
>
> On Tue, Jan 08, 2019 at 11:51:37PM +0900, Akinobu Mita wrote:
> > This patchset converts soc_camera mt9m001 driver to a standard subdev
> > sensor driver.
> >
> > * v2
> > - Update binding doc suggested by Rob Herring.
> > - Fix MODULE_LICENSE() masmatch.
> > - Sort headers alphabetically.
> > - Add new label for error handling in s_stream() callback.
> > - Replace pm_runtime_get_noresume() + pm_runtime_put_sync() with a
> >   single pm_runtime_idle() call in probe() function.
> > - Change the argument of mt9m001_power_o{n,ff} to struct device, and
> >   use them for runtime PM callbacks directly.
> > - Remove redundant Kconfig dependency
> > - Preserve subdev flags set by v4l2_i2c_subdev_init().
> > - Set initial try format with default configuration instead of
> >   current one.
>
> While this set improved the original mt9m001 driver a lot, it did not add=
 a
> MAINTAINERS entry for it. The same applies to the mt9m111 driver.
>
> Could you provide the MAINTAINERS entries for the two drivers, please?

As long as I have those two sensors, I can review and test the patches.
So I would like to add the following MAINTAINERS entries.

MT9M001 CAMERA SENSOR
M:      Sakari Ailus <sakari.ailus@linux.intel.com>
R:      Akinobu Mita <akinobu.mita@gmail.com>
L:      linux-media@vger.kernel.org
T:      git git://linuxtv.org/media_tree.git
S:      Maintained
F:      Documentation/devicetree/bindings/media/i2c/mt9m001.txt
F:      drivers/media/i2c/mt9m001.c

MT9M111 CAMERA SENSOR
M:      Sakari Ailus <sakari.ailus@linux.intel.com>
R:      Akinobu Mita <akinobu.mita@gmail.com>
L:      linux-media@vger.kernel.org
T:      git git://linuxtv.org/media_tree.git
S:      Maintained
F:      Documentation/devicetree/bindings/media/i2c/mt9m111.txt
F:      drivers/media/i2c/mt9m111.c
