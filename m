From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 1/2] GPIO: Add driver for Zynq GPIO controller
Date: Mon, 7 Apr 2014 12:00:05 -0700
Message-ID: <7da0486b-bbdd-445b-8a6d-b5bcb311d908@TX2EHSMHS036.ehs.local>
References: <1395933906-2268-1-git-send-email-harinik@xilinx.com>
 <CAPDyKFo4R9izP=jcoU+jqd74Nbeh+-5A1T8c_=EL4cmzja_29A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPDyKFo4R9izP=jcoU+jqd74Nbeh+-5A1T8c_=EL4cmzja_29A@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Harini Katakam <harinik@xilinx.com>, Mark Rutland <mark.rutland@arm.com>, gnurou@gmail.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-doc@vger.kernel.org, michal.simek@xilinx.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, michals@xilinx.com, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-03-31 at 11:23AM +0200, Ulf Hansson wrote:
> On 27 March 2014 16:25, Harini Katakam <harinik@xilinx.com> wrote:
[...]
> > +static int __maybe_unused zynq_gpio_runtime_suspend(struct device =
*dev)
> > +{
> > +       struct platform_device *pdev =3D to_platform_device(dev);
> > +       struct zynq_gpio *gpio =3D platform_get_drvdata(pdev);
> > +
> > +       clk_disable(gpio->clk);
>=20
> You should be able can use clk_disable_unprepare() here.
>=20
> > +
> > +       return 0;
> > +}
> > +
> > +static int __maybe_unused zynq_gpio_runtime_resume(struct device *=
dev)
> > +{
> > +       struct platform_device *pdev =3D to_platform_device(dev);
> > +       struct zynq_gpio *gpio =3D platform_get_drvdata(pdev);
> > +
> > +       return clk_enable(gpio->clk);
>=20
> You should be able can use clk_prepare_enable() here.

Is there some common practice regarding this? As I understand it, we
want to ensure the clock to be gated during suspend, which should happe=
n
with clk_disable(). Why would we also unprepare the clock? We are highl=
y
likely to use it again once we resume.

	Thanks,
	S=C3=B6ren


