From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] ARM: at91: at91sam9x5: sets NPCS0 (PA14) back to GPIO
Date: Fri, 25 Jul 2014 10:36:45 +0200
Message-ID: <20140725103645.7fbf5b63@bbrezillon>
References: <1405074175-22444-1-git-send-email-voice.shen@atmel.com>
	<53D10C50.50305@aksignal.cz>
	<20140724162645.4e19c26c@bbrezillon>
	<53D12103.3020103@aksignal.cz>
	<20140724175848.44f5da10@bbrezillon>
	<53D1F5D0.1080006@aksignal.cz>
	<20140725083053.GD9532@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140725083053.GD9532@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: =?UTF-8?B?SmnFmcOt?= Prchal <jiri.prchal@aksignal.cz>, devicetree@vger.kernel.org, nicolas.ferre@atmel.com, linux-arm-kernel@lists.infradead.org, Bo Shen <voice.shen@atmel.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

On Fri, 25 Jul 2014 10:30:54 +0200
Alexandre Belloni <alexandre.belloni@free-electrons.com> wrote:

> Hi,
>=20
> On 25/07/2014 at 08:14:40 +0200, Ji=C5=99=C3=AD Prchal wrote :
> > I'm using custom board. My spi node:
> > 			spi0: spi@f0000000 {
>=20
> You should override the pinctrl here as you are using gpios for the c=
s.
> 				pinctrl-0 =3D <&pinctrl_spi0_custom>;

I guess you meant:
			pinctrl-0 <&pinctrl_spi0 &pinctrl_spi0_custom>;

I suggested the same thing, however I'm pretty sure this is not the
source of the problem. As I said, gpio_request already mux the
associated pin to GPIO function.

Best Regards,

Boris


--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
