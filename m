From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: socfpga: fpga bridges bindings docs
Date: Mon, 27 Oct 2014 17:05:29 +0200
Message-ID: <31BBCD26-65E2-431A-9ADF-95D7EDC7E34E@konsulko.com>
References: <1414108267-22058-1-git-send-email-atull@opensource.altera.com> <1414108267-22058-3-git-send-email-atull@opensource.altera.com> <CCE2D027-AA89-41C4-B9AA-2B92AA62129B@konsulko.com> <20141027150147.GX18557@sirena.org.uk>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141027150147.GX18557@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: atull@opensource.altera.com, jgunthorpe@obsidianresearch.com, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, michal.simek@xilinx.com, rdunlap@infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, Pavel Machek <pavel@denx.de>, philip@balister.org, rubini@gnudd.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, Felipe Balbi <balbi@ti.com>, m.chehab@samsung.com, davidb@codeaurora.org, Rob Landley <rob@landley.net>, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, Linus Walleij <linus.walleij@linaro.org>, mgerlach@opensource.altera.com, Alan Tull <delicious.quinoa@gmail.com>, dinguye
List-Id: devicetree@vger.kernel.org

Hi Mark,

> On Oct 27, 2014, at 17:01 , Mark Brown <broonie@kernel.org> wrote:
>=20
> On Mon, Oct 27, 2014 at 01:48:02PM +0200, Pantelis Antoniou wrote:
>>> On Oct 24, 2014, at 02:51 , atull@opensource.altera.com wrote:
>=20
>>> + - init-val         : 0 if driver should disable bridge at startup
>>> +                      1 if driver should enable bridge at startup
>>> +                      driver leaves bridge in current state if pro=
perty not
>>> +		      specified.
>=20
>> Isn=E2=80=99t init-val a boolean property? It=E2=80=99s not named ve=
ry well.
>=20
> It's not boolean, it's tristate - turn on, turn off or don't touch.
>=20

I see. Even then =E2=80=98init-val=E2=80=99 is cryptic. I=E2=80=99d pre=
fer two booleans,
enable-at-startup; disable-at-startup.

>> Along with the label, is kinda hard to defend as configuration in DT=
=2E
>=20
> Yeah...  presumably this decision would fall out of the users?

Well, it=E2=80=99s the user that should make the decision, but the driv=
er should
pick it up. This works but it=E2=80=99s not very nice.

Regards

=E2=80=94 Pantelis
