From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [RFC 02/11] dt-bindings: power: amlogic, meson-gx-pwrc: Add SM1 bindings
Date: Mon, 19 Aug 2019 17:05:56 -0700
Message-ID: <7h1rxgvgyj.fsf@baylibre.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com> <20190701104705.18271-3-narmstrong@baylibre.com> <CAFBinCAT1JaK6ksD9OzCK_wEEWJdaZL2vLzGeCzVVbz9V67btQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCAT1JaK6ksD9OzCK_wEEWJdaZL2vLzGeCzVVbz9V67btQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: jbrunet@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Neil,
>
> On Mon, Jul 1, 2019 at 12:48 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> [...]
>> +General Purpose Power Controller
>> +--------------------------------
>>
>> +The Amlogic SM1 SoCs embeds a General Purpose Power Controller used
>> +to control the power domain for, at least, the USB PHYs and PCIe
>> +peripherals.
> AFAIK each binding document should only describe one IP block.
> this one seems to be new / different
>
> should it get it's own file?
> also should it be a .yaml binding?

I don't think this is a new IP block.  Comparing across the various
(64-bit) SoCs, it seems to be very similar across all SoCs.

>> +
>> +Device Tree Bindings:
>> +---------------------
>> +
>> +Required properties:
>> +- compatible: should be one of the following :
>> +       - "amlogic,meson-sm1-pwrc" for the Meson SM1 SoCs
>> +- #power-domain-cells: should be 0
>> +- amlogic,hhi-sysctrl: phandle to the HHI sysctrl node
>> +
>> +Parent node should have the following properties :
>> +- compatible: "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd"
>> +- reg: base address and size of the AO system control register space.
>> +
>> +
>> +Example:
>> +-------
>> +
>> +ao_sysctrl: sys-ctrl@0 {
>> +       compatible = "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd";
>> +       reg =  <0x0 0x0 0x0 0x100>;
>> +
>> +       pwrc: power-controller {
>> +               compatible = "amlogic,meson-sm1-pwrc";
>> +               #power-domain-cells = <1>;
>> +               amlogic,hhi-sysctrl = <&hhi>;
>> +       };
>> +};
>
> I'm not sure that we want to mix HHI and AO power domains in one driver again

We're not mixing here. These are all EE domains.  They just have some
control registers in the AO memory region.

> back in March I asked a few questions about modelling the power
> domains and Kevin explained that we can implement them hierarchical:
> [0]
> unfortunately I didn't have the time to work on this - however, now
> that we implement a new driver: should we follow this hierarchical
> approach?

The more I look at this, I don't think we have a commpelling need to
model them hierarchically.  The main reason being is that of the 3
top-level domains I listed[0], we can only managing the EE domains in the
kernel.  It doesn't make sense to model/manage AO domains because, well,
they are always-on (AO).  The CPU domains are managed my the PSCI
firmware, and we don't/won't have any control over that.

For that reason, I think it makes the most sense to have a generic
driver that handles all the EE domains.

IMO, the SM1 driver that Neil wrote in patch 4 of this series is 80%
there.  If we generalize that little more, it can be quite easily used
for all the EE domains.

Kevin

[0] http://lists.infradead.org/pipermail/linux-amlogic/2019-March/010512.html
