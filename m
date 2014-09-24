From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 0/3] Qualcomm Resource Power Manager driver
Date: Wed, 24 Sep 2014 09:11:55 +0100
Message-ID: <20140924081155.GE17801@lee--X1>
References: <1411428329-23172-1-git-send-email-bjorn.andersson@sonymobile.com>
 <54212CA0.4030700@linaro.org>
 <20140924042737.GQ10179@sonymobile.com>
 <20140924075535.GD17801@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140924075535.GD17801@lee--X1>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Andy Gross <agross@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@linaro.org>, Kumar Gala <galak@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Wed, 24 Sep 2014, Lee Jones wrote:

> On Tue, 23 Sep 2014, Bjorn Andersson wrote:
>=20
> > On Tue 23 Sep 01:17 PDT 2014, Srinivas Kandagatla wrote:
> >=20
> > > Hi Bjorn,
> > >=20
> > > Thankyou for the new patchset.
> > >=20
> > > I got few device-tree patches for apq8064 usb, sata, phy and hdmi=
 which=20
> > > depend on rpm header file. It will be nice to get this functional=
ity=20
> > > into 3.18.
> > >=20
> >=20
> > We should be able to send out the dts patches separate of these.
> >=20
> > > Do you think we should take these patches via arm-soc tree?
> > >=20
> >=20
> > Both Lee and Mark indicated that they will pull the parts individua=
lly. However
> > both of the patches depend on the header file created in patch 1, s=
omeone needs
> > to take both for it to work out?
>=20
> Once reviewed I can take the whole set with Mark's Ack.

Okay, I should have looked at discussion we had on the previous
version prior to responding.  If your Kconfig configuration is as
tight as you say it is, we can take the patches through our respective
trees.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
