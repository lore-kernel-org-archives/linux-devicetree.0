From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 2/3] mfd: qcom-rpm: Driver for the Qualcomm RPM
Date: Fri, 22 Aug 2014 08:50:41 +0100
Message-ID: <20140822075041.GT4266@lee--X1>
References: <1407796988-25872-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1407796988-25872-3-git-send-email-bjorn.andersson@sonymobile.com>
 <20140821132204.GH4266@lee--X1>
 <20140822012748.GB12494@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140822012748.GB12494@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Andy Gross <agross@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@linaro.org>, Kumar Gala <galak@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 21 Aug 2014, Bjorn Andersson wrote:
> On Thu 21 Aug 06:22 PDT 2014, Lee Jones wrote:
> > > +struct qcom_rpm *dev_get_qcom_rpm(struct device *dev)
> > > +{
> > > +	return dev_get_drvdata(dev);
> > > +}
> > > +EXPORT_SYMBOL(dev_get_qcom_rpm);
> >=20
> > No need for this at all.  Use dev_get_drvdata() direct instead.
> >=20
>=20
> I see that others have put this as static inline in the header file, =
so I will
> follow that. I don't want to expose this directly in the implementati=
on of the
> clients.
>=20
> Let me know if you object.

I do (unless you convince me otherwise).  Why is this a good idea and
why 'exposing' this directly is a bad one?  At the moment this looks
to me like abstraction for the sake of abstraction.

> > > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +	rpm->status_regs =3D devm_ioremap_resource(&pdev->dev, res);
> > > +	rpm->ctrl_regs =3D rpm->status_regs + 0x400;
> > > +	rpm->req_regs =3D rpm->status_regs + 0x600;
> > > +	if (IS_ERR(rpm->status_regs))
> > > +		return PTR_ERR(rpm->status_regs);
> >=20
> > You should probably do this _before_ using it above.
>=20
> There's no difference in behaviour, but it just feels cleaner than:
>=20
> res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> rpm->status_regs =3D devm_ioremap_resource(&pdev->dev, res);
> if (IS_ERR(rpm->status_regs))
> 	return PTR_ERR(rpm->status_regs);
> rpm->ctrl_regs =3D rpm->status_regs + 0x400;
> rpm->req_regs =3D rpm->status_regs + 0x600;
>=20
> If you don't like it, I'll change it.

There is a difference.  In the current implementation you're doing math
with a possible error code and assigning rubbish to rpm->ctrl_regs and
rpm->req_regs.

[...]

> > > +MODULE_DESCRIPTION("Qualcomm Resource Power Manager driver");
> > > +MODULE_LICENSE("GPL v2");
> >=20
> > No one authored this driver?
> >=20
>=20
> Thought that was optional, will update.

It's also helpful.  Can you place an Author: line in the header(s) too.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
