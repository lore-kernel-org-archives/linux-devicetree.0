From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/5] mfd: add bcm590xx pmu driver
Date: Tue, 11 Mar 2014 22:45:17 +0000
Message-ID: <20140311224517.GA5672@lee--X1>
References: <1394552775-31264-1-git-send-email-mporter@linaro.org>
 <1394552775-31264-3-git-send-email-mporter@linaro.org>
 <20140311160837.GP21216@lee--X1>
 <20140311221938.GO25092@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140311221938.GO25092@beef>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Porter <mporter@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Christian Daudt <bcm@fixthebug.org>, Devicetree List <devicetree@vger.kernel.org>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> > > Add a driver for the BCM590xx PMU multi-function devices. The dri=
ver
> > > initially supports regmap initialization and instantiation of the
> > > voltage regulator device function of the PMU.
> > >=20
> > > Signed-off-by: Matt Porter <mporter@linaro.org>
> > > Reviewed-by: Tim Kryger <tim.kryger@linaro.org>
> > > Reviewed-by: Markus Mayer <markus.mayer@linaro.org>
> > > ---
> > >  drivers/mfd/Kconfig          |  8 ++++
> > >  drivers/mfd/Makefile         |  1 +
> > >  drivers/mfd/bcm590xx.c       | 93 ++++++++++++++++++++++++++++++=
++++++++++++++
> > >  include/linux/mfd/bcm590xx.h | 31 +++++++++++++++
> > >  4 files changed, 133 insertions(+)
> > >  create mode 100644 drivers/mfd/bcm590xx.c
> > >  create mode 100644 include/linux/mfd/bcm590xx.h
> >=20
> > I have a tiny nit that 'ret' doesn't need to be initialised before
> > use in probe(), but apart from that...
> >=20
> > Looks pretty sensible:
> >   Acked-by: Lee Jones <lee.jones@linaro.org>
>=20
> Ok, thanks. When I get back in front of my desktop I'll send a v4 of
> just this patch to address that nit. Mark already applied the regulat=
or
> driver from this series, will you be taking this through your tree? F=
or
> that matter, I wonder if the binding would also go through your tree
> with this driver.

At least the MFD portion and the DT binding doc will go through the
MFD tree.

Are there any inter-patch dependencies in the set? If so, we should
know about them so we can coordinate a sensible solution.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
