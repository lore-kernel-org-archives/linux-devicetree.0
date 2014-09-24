From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 0/3] Qualcomm Resource Power Manager driver
Date: Wed, 24 Sep 2014 08:55:35 +0100
Message-ID: <20140924075535.GD17801@lee--X1>
References: <1411428329-23172-1-git-send-email-bjorn.andersson@sonymobile.com>
 <54212CA0.4030700@linaro.org>
 <20140924042737.GQ10179@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140924042737.GQ10179@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Andy Gross <agross@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@linaro.org>, Kumar Gala <galak@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Tue, 23 Sep 2014, Bjorn Andersson wrote:

> On Tue 23 Sep 01:17 PDT 2014, Srinivas Kandagatla wrote:
>=20
> > Hi Bjorn,
> >=20
> > Thankyou for the new patchset.
> >=20
> > I got few device-tree patches for apq8064 usb, sata, phy and hdmi w=
hich=20
> > depend on rpm header file. It will be nice to get this functionalit=
y=20
> > into 3.18.
> >=20
>=20
> We should be able to send out the dts patches separate of these.
>=20
> > Do you think we should take these patches via arm-soc tree?
> >=20
>=20
> Both Lee and Mark indicated that they will pull the parts individuall=
y. However
> both of the patches depend on the header file created in patch 1, som=
eone needs
> to take both for it to work out?

Once reviewed I can take the whole set with Mark's Ack.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
