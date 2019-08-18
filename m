From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding
 documentation
Date: Sun, 18 Aug 2019 11:51:39 +0200
Message-ID: <c8551d99-7296-c621-1b56-017910f28400@rempel-privat.de>
References: <20190724022310.28010-1-gch981213@gmail.com>
 <20190724022310.28010-5-gch981213@gmail.com> <20190813155143.GA19830@bogus>
 <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
 <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net>
 <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
 <6b6ee744-61d3-8848-19e7-0a301fe4d1b3@rempel-privat.de>
 <CAJsYDVLLPa07wUg2EoeJww9XSJYgX_kBu-oGiv7n+zejUc877w@mail.gmail.com>
 <fb39803d-d303-f259-d78d-9f8b1fc7dde3@rempel-privat.de>
 <CAJsYDVK9Yj02WxNFo7iEP3aJn+j5MqzCtLrmgsz=4zWnfQ4VOw@mail.gmail.com>
 <6426d4d2-9961-83f2-d3bc-5834ff36b40d@rempel-privat.de>
 <CAJsYDVKW9-7ityUn83NXcQYmqJi_t-VSV8F0c+BA14_w+poPkA@mail.gmail.com>
 <CAJsYDVJnQyOXHKWztoE72KKnMinJL+1AZGy_CvTT6oOs5m5U2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJsYDVJnQyOXHKWztoE72KKnMinJL+1AZGy_CvTT6oOs5m5U2w@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Rob Herring <robh@kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, John Crispin <john@phrozen.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>, Paul Fertser <fercerpav@gmail.com>
List-Id: devicetree@vger.kernel.org

Am 18.08.19 um 10:44 schrieb Chuanhong Guo:
> On Sun, Aug 18, 2019 at 4:26 PM Chuanhong Guo <gch981213@gmail.com> wrot=
e:
>>
>> Hi!
>>
>> On Sun, Aug 18, 2019 at 3:59 PM Oleksij Rempel <linux@rempel-privat.de>=
 wrote:
>>>
>>> Am 18.08.19 um 09:19 schrieb Chuanhong Guo:
>>>> Hi!
>>>>
>>>> On Sun, Aug 18, 2019 at 2:10 PM Oleksij Rempel <linux@rempel-privat.d=
e> wrote:
>>>>>
>>>>>>> We have at least 2 know registers:
>>>>>>> SYSC_REG_CPLL_CLKCFG0 - it provides some information about boostra=
pped
>>>>>>> refclock. PLL and dividers used for CPU and some sort of BUS (AHB?=
).
>>>>>>> SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable clocks =
for
>>>>>>> all or some ip cores.
>>>>>>> What is probably missing is a set of dividers for
>>>>>>> each ip core. From your words it is not document.
>>>>>>
>>>>>> The specific missing part I was referring to, is parent clocks for
>>>>>> every gates. I'm not going to assume this with current openwrt devi=
ce
>>>>>> tree because some peripherals doesn't have a clock binding at all o=
r
>>>>>> have a dummy one there.
>>>>>
>>>>> Ok, then I do not understand what is the motivation to upstream
>>>>> something what is not nearly ready for use.
>>>>
>>>> Why isn't it "ready for use" then?
>>>> A complete mt7621-pll driver will contain two parts:
>>>> 1. A clock provider which outputs several clocks
>>>> 2. A clock gate with parent clocks properly configured
>>>>
>>>> Two clocks provided here are just two clocks that can't be controlled
>>>> in kernel no matter where it goes (arch/mips/ralink or drivers/clk).
>>>> Having a working CPU clock provider is better than defining a fixed
>>>> clock in dts because CPU clock can be controlled by bootloader.
>>>> (BTW description for CPU PLL register is also missing in datasheet.)
>>>> Clock gate is an unrelated part and there is no information to
>>>> properly implement it unless MTK decided to release a clock plan
>>>> somehow.
>>>
>>> With other words, your complete system is running with unknown clock
>>> rates.
>>
>> And without this patchset the complete system is running with unknown
>> clock and, even worse, we make assumptions about what clock bootloader
>> uses, hardcoded it in dts and hope it is the correct value.
>>
>>> The source clock in the clock three can be configured differently
>>> by bootloader but you don't know how it is done how and it is not
>>> documented.
>>
>> Actually, I don't know about this and I didn't wrote the original
>> clock calculation code. I just ported it from downstream OpenWrt
>> kernel. Here's a piece of code from Mediatek's SDK kernel:
>>
>> case 0:
>>         reg =3D (*(volatile u32 *)(RALINK_SYSCTL_BASE + 0x44));
>>         cpu_fdiv =3D ((reg >> 8) & 0x1F);
>>         cpu_ffrac =3D (reg & 0x1F);
>> mips_cpu_feq =3D (500 * cpu_ffrac / cpu_fdiv) * 1000 * 1000;
>> break;
>> case 1: //CPU PLL
>>         reg =3D (*(volatile u32 *)(RALINK_MEMCTRL_BASE + 0x648));
>>         fbdiv =3D ((reg >> 4) & 0x7F) + 1;
>>         reg =3D (*(volatile u32 *)(RALINK_SYSCTL_BASE + 0x10));
>>         reg =3D (reg >> 6) & 0x7;
>>         if(reg >=3D 6) { //25Mhz Xtal
>>             mips_cpu_feq =3D 25 * fbdiv * 1000 * 1000;
>>         } else if(reg >=3D3) { //40Mhz Xtal
>>             mips_cpu_feq =3D 20 * fbdiv * 1000 * 1000;
>>         } else { // 20Mhz Xtal
>>             /* TODO */
>>         }
>>         break;
>>
>>
>>
>>>
>>>>> This code is currently on prototyping phase
>>>>
>>>> Code for clock calculation is done, not "prototyping".
>>>>
>>>>> It means, we cannot expect that this driver will be fixed any time s=
oon.
>>>>
>>>> I think clock gating is a separated feature instead of a broken part
>>>> that has to be fixed.
>>>
>>> Ok, i would agree with it. But from what you said, this feature will b=
e
>>> never implemented.
>>>
>>> So, I repeat my question. What is the point to upstream code for a
>>> system, which has not enough information to get proper clock rate even
>>> for uart? or is uart running with cpu or bus clock rate?
>>
>> uart runs of a fixed 50MHz clock according to another piece of code
>> from MTK SDK:
>> (a pastebin version here for better readability. This specific
>> question has nothing to do with patch reviewing and doesn't need to be
>> preserved in mail forever.)
>> https://paste.ubuntu.com/p/fYmtDFW9nh/

ok.

lets see more code:
drivers/staging/mt7621-mmc/sd.c
/* clock source for host: global */
#if defined(CONFIG_SOC_MT7620)
static u32 hclks[] =3D {48000000}; /* +/- by chhung */
#elif defined(CONFIG_SOC_MT7621)
static u32 hclks[] =3D {50000000}; /* +/- by chhung */
#endif

hm.. 50Mhz again. Feels like APB clock.

./drivers/staging/mt7621-dts/mt7621.dtsi
        cpuclock: cpuclock@0 {
                #clock-cells =3D <0>;
                compatible =3D "fixed-clock";

                /* FIXME: there should be way to detect this */
                clock-frequency =3D <880000000>;
        };

Your driver is trying to cover cpuclock

        sysclock: sysclock@0 {
                #clock-cells =3D <0>;
                compatible =3D "fixed-clock";

                /* This is normally 1/4 of cpuclock */
                clock-frequency =3D <220000000>;
        };

and most probably system clock alias "bus clock", most probably AHB.

                i2c: i2c@900 {
                        compatible =3D "mediatek,mt7621-i2c";
                        clocks =3D <&sysclock>;

looks like i2c is using AHB clock.

                uartlite: uartlite@c00 {
                        compatible =3D "ns16550a";

                        clocks =3D <&sysclock>;
                        clock-frequency =3D <50000000>;

and uart is suing APB clock

                spi0: spi@b00 {
                        compatible =3D "ralink,mt7621-spi";
                        clocks =3D <&sysclock>;

SPI -> APB

        xhci: xhci@1E1C0000 {
                compatible =3D "mediatek,mt8173-xhci";
                clocks =3D <&sysclock>;
                clock-names =3D "sys_ck";
XHCI -> AHB


        ethernet: ethernet@1e100000 {
                compatible =3D "mediatek,mt7621-eth";
                clocks =3D <&sysclock>;
                clock-names =3D "ethif";

Ethernet -> AHB
So, all device are using two groups of clocks. System clock with seems
to depend on CPU clock.
Or 50MHz clock. Which is for some unknow reason always 50MHz.

Here we have already upstream code:
arch/mips/ralink/mt7620.c
        xtal_rate =3D mt7620_get_xtal_rate();

#define RFMT(label)     label ":%lu.%03luMHz "
#define RINT(x)         ((x) / 1000000)
#define RFRAC(x)        (((x) / 1000) % 1000)

        if (is_mt76x8()) {
                if (xtal_rate =3D=3D MHZ(40))
                        cpu_rate =3D MHZ(580);
                else
                        cpu_rate =3D MHZ(575);
                dram_rate =3D sys_rate =3D cpu_rate / 3;
                periph_rate =3D MHZ(40);
                pcmi2s_rate =3D MHZ(480);

                ralink_clk_add("10000d00.uartlite", periph_rate);
                ralink_clk_add("10000e00.uartlite", periph_rate);


which is doing same as I requested before. Well, preferred in
drivers/clk/ manner.

>> I could ask the same question:
>> What is the point of upstreaming an incomplete MT7621 support in the
>> first place? Current MT7621 support in upstream kernel works only for
>> mt7621a not mt7621s and it runs of unknown clocks. These kind of code
>> should stay in downstream projects like OpenWrt forever isn't it?

I need to admit. I really like the idea of pushing all downstream
OpenWrt code mainline. And respect every one who is doing it.

Other question, do this platfrom SoC really worth it? Vendor seems do
not care about it. This product belong to

> And in fact you've upstreamed a broken ag71xx driver anyway.

I don't think this example is nearly comparable. We have enough
documentation to provide working driver. For mainlining was removed
everything what do not belong there:
- direct reading and writing to system wide clock registers. This should
be done over clk framework.
- switch support. It should be done in dsa framework, not inside of
ethernet driver.
- ethertool support was removed to reduce review overhead and can be add
later if need.
- debugfs support was removed removed to reduce review overhead and can
be add later if need.
- phy or board specific quirks was removed as well. This has nothing
todo with ethernet driver and belong to other frameworks or drivers.


> This debate goes nowhere. I've clarified the situation and made my
> point. Of course I can't read through the ancient and heavily hacked
> vendor kernel to figure out a clock plan myself.

Ok, I provided you some productive technical hints how it should be
done. I don't think mt7620 has better documentation then mt7621 and even
in this case it was possible to make more or less good driver.

=2D-
Regards,
Oleksij
