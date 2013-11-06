From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 06/13] ASoC: ux500_pcm: Extend ux500 MSP binding for
 enumeration
Date: Wed, 6 Nov 2013 12:07:58 +0000
Message-ID: <20131106120758.GG30901@lee--X1>
References: <1383732985-18928-1-git-send-email-lee.jones@linaro.org>
 <1383732985-18928-7-git-send-email-lee.jones@linaro.org>
 <20131106104658.GE11602@sirena.org.uk>
 <CACRpkdZgi9Egvm585Y9tJpmj0YX-oJBDg-C7pCu91Pf5ALMGLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZgi9Egvm585Y9tJpmj0YX-oJBDg-C7pCu91Pf5ALMGLg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 06 Nov 2013, Linus Walleij wrote:

> On Wed, Nov 6, 2013 at 11:46 AM, Mark Brown <broonie@kernel.org> wrot=
e:
> > On Wed, Nov 06, 2013 at 10:16:18AM +0000, Lee Jones wrote:
>=20
> >> + - id               : MSP ID - used during component registration
> >
> > I have no idea what this means or how one would pick the number?  I=
t
> > looks like something purely internal to the driver...
>=20
> Actually it's quite common when we have several HW blocks of the
> same thing to add something like an id. For example for different
> GPIO banks.
>=20
> But in this case I guess it may make more sense to flag one MSP
> for RX and one for TX or something?
>=20
> There are also two more such MSPs for streaming audio to the
> Bluetooth audio portions.

Right, we have 4 of them:

MSP0: Tx and Rx
MSP1: Tx
MSP2: Tx and Rx
MSP3: Rx

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
