From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: socfpga: fpga bridges bindings docs
Date: Mon, 27 Oct 2014 19:21:22 +0200
Message-ID: <09D1D469-01B8-44BD-BC18-EB879297BB85@konsulko.com>
References: <1414108267-22058-1-git-send-email-atull@opensource.altera.com> <1414108267-22058-3-git-send-email-atull@opensource.altera.com> <CCE2D027-AA89-41C4-B9AA-2B92AA62129B@konsulko.com> <20141027150147.GX18557@sirena.org.uk> <31BBCD26-65E2-431A-9ADF-95D7EDC7E34E@konsulko.com> <20141027153205.GW10262@pengutronix.de> <1C42AF5D-4776-4B09-BDF4-24F001439F46@konsulko.com> <20141027171731.GY18557@sirena.org.uk>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141027171731.GY18557@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, atull@opensource.altera.com, jgunthorpe@obsidianresearch.com, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, michal.simek@xilinx.com, rdunlap@infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, Pavel Machek <pavel@denx.de>, philip@balister.org, rubini@gnudd.com, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, Felipe Balbi <balbi@ti.com>, m.chehab@samsung.com, davidb@codeaurora.org, Rob Landley <rob@landley.net>, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, Linus Walleij <linus.walleij@linaro.org>, mgerlach@opensource.altera.com, Alan Tull <delicious.quinoa@gmail.com>, dinguye
List-Id: devicetree@vger.kernel.org

Hi Mark,

> On Oct 27, 2014, at 19:17 , Mark Brown <broonie@kernel.org> wrote:
>=20
> On Mon, Oct 27, 2014 at 05:45:03PM +0200, Pantelis Antoniou wrote:
>=20
> Please fix your mail client to word wrap at less than 80 columns.
>=20
>> Well, it=E2=80=99s not my speciality, but my understanding is that F=
PGAs take (considerable)
>> time to be programmed. If someone has already configured the =E2=80=98=
bus=E2=80=99 it is considered
>> a win to not reload the bitstream. I.e. if you boot with the bootloa=
der having loaded
>> the bitstream already, you don=E2=80=99t want to do it again.
>=20
> That's not what your property is saying, though - if it were just abo=
ut
> handover between the bootloader and the kernel that'd be one thing bu=
t
> it's also got this additional possibility to instruct the kernel that
> the device must be either disabled or explicitly programmed.  Having =
a
> property that just says "this FPGA is programmed" covers the handover
> case but this property does more than that.

It=E2=80=99s not my property. This is not my driver. The property is ba=
dly-named
as it is IMHO.

Why don=E2=80=99t we let Alan chime in?

Regards

=E2=80=94 Pantelis

