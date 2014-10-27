From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: socfpga: fpga bridges bindings docs
Date: Mon, 27 Oct 2014 17:45:03 +0200
Message-ID: <1C42AF5D-4776-4B09-BDF4-24F001439F46@konsulko.com>
References: <1414108267-22058-1-git-send-email-atull@opensource.altera.com> <1414108267-22058-3-git-send-email-atull@opensource.altera.com> <CCE2D027-AA89-41C4-B9AA-2B92AA62129B@konsulko.com> <20141027150147.GX18557@sirena.org.uk> <31BBCD26-65E2-431A-9ADF-95D7EDC7E34E@konsulko.com> <20141027153205.GW10262@pengutronix.de>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141027153205.GW10262@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, atull@opensource.altera.com, jgunthorpe@obsidianresearch.com, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, michal.simek@xilinx.com, rdunlap@infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, Pavel Machek <pavel@denx.de>, philip@balister.org, rubini@gnudd.com, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, Felipe Balbi <balbi@ti.com>, m.chehab@samsung.com, davidb@codeaurora.org, Rob Landley <rob@landley.net>, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, Linus Walleij <linus.walleij@linaro.org>, mgerlach@opensource.altera.com, Alan Tull <delicious.quinoa@gmail.com>, dinguyen@opensource.
List-Id: devicetree@vger.kernel.org

Hi Stefan,

> On Oct 27, 2014, at 17:32 , Steffen Trumtrar <s.trumtrar@pengutronix.=
de> wrote:
>=20
> On Mon, Oct 27, 2014 at 05:05:29PM +0200, Pantelis Antoniou wrote:
>> Hi Mark,
>>=20
>>> On Oct 27, 2014, at 17:01 , Mark Brown <broonie@kernel.org> wrote:
>>>=20
>>> On Mon, Oct 27, 2014 at 01:48:02PM +0200, Pantelis Antoniou wrote:
>>>>> On Oct 24, 2014, at 02:51 , atull@opensource.altera.com wrote:
>>>=20
>>>>> + - init-val         : 0 if driver should disable bridge at start=
up
>>>>> +                      1 if driver should enable bridge at startu=
p
>>>>> +                      driver leaves bridge in current state if p=
roperty not
>>>>> +		      specified.
>>>=20
>>>> Isn=E2=80=99t init-val a boolean property? It=E2=80=99s not named =
very well.
>>>=20
>>> It's not boolean, it's tristate - turn on, turn off or don't touch.
>>>=20
>>=20
>> I see. Even then =E2=80=98init-val=E2=80=99 is cryptic. I=E2=80=99d =
prefer two booleans,
>> enable-at-startup; disable-at-startup.
>>=20
>>>> Along with the label, is kinda hard to defend as configuration in =
DT.
>>>=20
>>> Yeah...  presumably this decision would fall out of the users?
>>=20
>> Well, it=E2=80=99s the user that should make the decision, but the d=
river should
>> pick it up. This works but it=E2=80=99s not very nice.
>>=20
>=20
> Hm, convince me why this AXI bus is so special, that I even need an
> "init-val" property? Other buses don't have that.
> Why don't I add a property "init-val" to my SPI buses, so I can enabl=
e
> it in the DT and still have it in reset, just because....
>=20
> The bridges on the SoCFPGA are buses, from the HPS to the FPGA. If I =
have
> written firmware to the FPGA and I have subnodes on that bus, I have =
to
> get it out of reset and probe everything. Normal procedure, no ?!
>=20

Well, it=E2=80=99s not my speciality, but my understanding is that FPGA=
s take (considerable)
time to be programmed. If someone has already configured the =E2=80=98b=
us=E2=80=99 it is considered
a win to not reload the bitstream. I.e. if you boot with the bootloader=
 having loaded
the bitstream already, you don=E2=80=99t want to do it again.

I=E2=80=99m afraid there=E2=80=99s no such analogue with standard hardw=
are busses like SPI, where
the bus setup time is instantaneous.

>=20
> Regards,
> Steffen
>=20

Regards

=E2=80=94 Pantelis

> --=20
> Pengutronix e.K.                           |                         =
    |
> Industrial Linux Solutions                 | http://www.pengutronix.d=
e/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0=
    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5=
555 |
