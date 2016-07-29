From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] clk: bcm: Add driver for Northstar ILP clock
Date: Fri, 29 Jul 2016 23:24:50 +0200
Message-ID: <CACna6rxiPx_7R1AwwvV40Wi6j+X=gUw1ChJY8R=oiXVNK1cDgw@mail.gmail.com>
References: <1469797120-29298-1-git-send-email-zajec5@gmail.com> <20160729131513.GB13080@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160729131513.GB13080@leverpostej>
Sender: linux-clk-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 29 July 2016 at 15:15, Mark Rutland <mark.rutland@arm.com> wrote:
> On Fri, Jul 29, 2016 at 02:58:32PM +0200, Rafa=C5=82 Mi=C5=82ecki wro=
te:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>
>> This clock is present on cheaper Northstar devices like BCM53573 or
>> BCM47189 using Corex-A7. This driver uses PMU (Power Management Unit=
)
>> to calculate clock rate and allows using it in a generic (clk_*) way=
=2E
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>> ---
>>  .../devicetree/bindings/clock/brcm,ns-ilp.txt      |  28 ++++
>>  drivers/clk/bcm/Makefile                           |   1 +
>>  drivers/clk/bcm/clk-ns-ilp.c                       | 146 ++++++++++=
+++++++++++
>>  3 files changed, 175 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,ns-=
ilp.txt
>>  create mode 100644 drivers/clk/bcm/clk-ns-ilp.c
>>
>> diff --git a/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt=
 b/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
>> new file mode 100644
>> index 0000000..c4df38e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
>> @@ -0,0 +1,28 @@
>> +Broadcom Northstar ILP clock
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> +
>> +This binding uses the common clock binding:
>> +    Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +
>> +This binding is used for ILP clock on Broadcom Northstar devices us=
ing
>> +Corex-A7 CPU. ILP clock depends on ALP one and has to be calculated=
 on
>> +runtime.
>> +
>> +Required properties:
>> +- compatible: "brcm,ns-ilp"
>> +- reg: iomem address range of PMU (Power Management Unit)
>> +- reg-names: "pmu", the only needed & supported reg right now
>
> From the commit message and binding description, it sounds like there
> should be a binding for the PMU, and that should cover the clocks
> required/exported by the PMU.

This is a bit of problem, because PMU handles a lot of different stuff
and is used by various drivers. Some examples of what you can do
with/find on a PMU:
1) Power management
2) Watchdog
3) Timer
4) XTAL
5) PLLs
6) Control registers for some ARM debugging (whatever it is), UART, JTA=
G, more

PMU is used by different drivers, e.g.:
1) Ethernet driver
2) Wireless driver
3) NAND controller driver

I don't have access to Broadcom's datasheets so unfortunately I can't
provide all details.


>> +- clocks: should reference an ALP clock
>> +- clock-names: "alp", the only needed & supported clock right now
>> +- #clock-cells: should be <0>
>
> How many clocks does the PMU output, including the ILP clock?

Well, ALP clock (AKA XTAL clock) is definitely part of PMU. It's a
fixed rate clock with rate specific to the chip.

I think ILP is also part of PMU (again: I don't have datasheets) as
PMU has this ALP_PER_4ILP register.

=46rom Broadcom's SDK I can say they also have "ARM debug unit" on some
chipsets. It requires enabling "ARM debug clk" to operate which is
handled by PMU as well.

--=20
Rafa=C5=82
