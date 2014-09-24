From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 1/3] mfd: devicetree: bindings: Add Qualcomm RPM DT
 binding
Date: Wed, 24 Sep 2014 17:21:12 +0100
Message-ID: <20140924162112.GB7113@lee--X1>
References: <1411428329-23172-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1411428329-23172-2-git-send-email-bjorn.andersson@sonymobile.com>
 <20140924082228.GF17801@lee--X1>
 <20140924155319.GA28481@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140924155319.GA28481@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Andy Gross <agross@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@linaro.org>, Kumar Gala <galak@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 24 Sep 2014, Bjorn Andersson wrote:

> On Wed 24 Sep 01:22 PDT 2014, Lee Jones wrote:
>=20
> > On Mon, 22 Sep 2014, Bjorn Andersson wrote:
> >=20
> > > Add binding for the Qualcomm Resource Power Manager (RPM) found i=
n 8660,
> > > 8960 and 8064 based devices. The binding currently describes the =
rpm
> > > itself and the regulator subnodes.
> > >=20
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> > > ---
> > >  Documentation/devicetree/bindings/mfd/qcom-rpm.txt |  246 ++++++=
++++++++++++++
> >=20
> > Please adhere to: Documentation/devicetree/bindings/submitting-patc=
hes.txt
> >=20
>=20
> I assume you mean this part:
>=20
>   1) The Documentation/ portion of the patch should be a separate pat=
ch.
>=20
> But I doubt this document was written with include/dt-bindings in min=
d, because
> in my eyes they are part of "device tree bindings".

Actually, this is an oversight on my part.  If I would have seen that
this patch only touched the bindings and include/dt-bindings I
probably wouldn't have said anything.

This patch still needs a DT Ack though.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
