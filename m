From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH 0/4] New Qualcomm PMIC pin controller drivers
Date: Wed, 09 Jul 2014 14:13:00 +0300
Message-ID: <1404904380.16296.17.camel@iivanov-dev>
References: <1404745893-6379-1-git-send-email-iivanov@mm-sol.com>
	 <CACRpkdYcoA-nifxojO5tZUy6dL6P2PTSGW0mVLUfqG20rOg-Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYcoA-nifxojO5tZUy6dL6P2PTSGW0mVLUfqG20rOg-Nw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <Bjorn.Andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,=20

On Wed, 2014-07-09 at 11:43 +0200, Linus Walleij wrote:
> On Mon, Jul 7, 2014 at 5:11 PM, Ivan T. Ivanov <iivanov@mm-sol.com> w=
rote:
>=20
> > This set of patches adds pin control drivers for Multi-purpose
> > pin (MPP) and General-purpose pin (GPIO) controllers found
> > in Qualcomm PMIC chips.
> >
> > MPP's are enhanced GPIO's with analog circuits, which support
> > following functions in addition to digital input/output: analog
> > input/output and current sinks.
> >
> > PMIC PM8941 have 8 MPP's and 36 GPIO's. PMIC PM8841 have 4 MPP's.
> >
> > Ivan T. Ivanov (4):
> >   pinctrl: qpnp: Qualcomm PMIC pin controller driver
> >   pinctrl: qcom: Add documentation for pinctrl-qpnp binding
> >   pinctrl: qcom: Add PM8941 and PM8941 pinctrl drivers
> >   ARM: dts: qcom: Add PM8941 and PM8841 pinctrl nodes
>=20
> Oh, I just spent some 45 minutes reviewing an 8xxx pinctrl driver fro=
m
> Bj=C3=B6rn Andersson
> that *seems* to be doing exactly the same thing.
>=20
> Now I have two drivers from people outside Qualcomm :-)
>=20
> Some of my review comments on Bj=C3=B6rn's driver (like using SI unit=
s with the pin
> config) are actually adressed in this patch set. The idea to split in=
 subdrivers
> per-ASIC may be good? I don't really know.
>=20
> Can you two guys *PLEASE* join efforts and combine your drivers into =
one?

Not sure. Bj=C3=B6rn patches cover older PMIC chips, if not mistaken, m=
ine
cover PMIC's used with APQ8074 and onward [1]. Main difference is
the bus which connects them to SoC, interrupts handling, runtime
pin type detection and register map.=20

Regards,
Ivan

[1] pm8019, pm8110, pm8226, pm8841, pm8916, pm8941, pm8994, pma8084,=20
    pmd9635, pmd9635, pmi8962, pmi8994.
