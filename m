From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 06/13] ASoC: ux500_pcm: Extend ux500 MSP binding for
 enumeration
Date: Wed, 6 Nov 2013 11:22:48 +0000
Message-ID: <20131106112248.GE30901@lee--X1>
References: <1383732985-18928-1-git-send-email-lee.jones@linaro.org>
 <1383732985-18928-7-git-send-email-lee.jones@linaro.org>
 <20131106104658.GE11602@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131106104658.GE11602@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 06 Nov 2013, Mark Brown wrote:

> On Wed, Nov 06, 2013 at 10:16:18AM +0000, Lee Jones wrote:
>=20
> > +++ b/Documentation/devicetree/bindings/sound/ux500-msp.txt
> > @@ -3,6 +3,7 @@
> >  Required properties:
> >   - compatible       :"stericsson,ux500-msp-i2s"
> >   - reg              : Physical base address and length of the devi=
ce's registers.
> > + - id               : MSP ID - used during component registration
>=20
> I have no idea what this means or how one would pick the number?  It
> looks like something purely internal to the driver...

Hmm... yes I guess you're right. I think a match table would be more
appropriate.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
