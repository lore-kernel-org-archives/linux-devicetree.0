From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: Pinmux bindings proposal
Date: Wed, 18 Jan 2012 22:30:28 +0800
Message-ID: <CAAQ0ZWTtYz3Lg7=Xz29m07j_k8yA95hn6cyk92SAJ4iGJRT_gw@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF17801D202F@HQMAIL01.nvidia.com>
	<20120116182808.GG4223@ponder.secretlab.ca>
	<20120118141329.GA22818@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120118141329.GA22818@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "cjb@laptop.org" <cjb@laptop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Dong Aisheng <dongas86@gmail.com>
List-Id: devicetree@vger.kernel.org

On 18 January 2012 22:13, Tony Lindgren <tony@atomide.com> wrote:
> Hi,
>
> * Grant Likely <grant.likely@secretlab.ca> [120116 09:55]:
>> On Fri, Jan 13, 2012 at 12:39:42PM -0800, Stephen Warren wrote:
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinmux =3D
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <"default" &pmx_sd=
hci_active>
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <"suspend" &pmx_sd=
hci_suspend>;
>> >
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 1:n example: */
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinmux =3D
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <"default" &pmx_sd=
hci_mux_a>
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <"default" &pmx_sd=
hci_pincfg_a>
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <"suspend" &pmx_sd=
hci_mux_a>
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <"suspend" &pmx_sd=
hci_pincfg_a_suspend>;
>>
>>
>> Yeah, don't do this. =A0Mixing phandle, string and cell values in a
>> property gets messy and could become troublesome to parse. =A0I've
>> backed away from it in the clk binding.
>
> Yup, that's because the string is embedded directly into the mixed
> mode array and will likely make the following data unaligned. That
> means it's extremely flakey to parse, and will lead into horrible
> errors if you have typos in the .dts file.. Tried that and gave up
> on it.
>
> I think I've found a way to avoid using names at all, assuming we set
> each pin as a phandle for the drivers to use :)
>
The problem with doing that is we will have to represent each pin as a
node in device tree.  For imx6q case, we have 197 pins.  Doing so will
bloat the device tree.

--=20
Regards,
Shawn
