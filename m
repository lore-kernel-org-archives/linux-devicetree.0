From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH net-next v2 15/15] arm64: dts: allwinner: a64: add SRAM
 controller device tree node
Date: Wed, 2 May 2018 17:53:21 +0800
Message-ID: <CAGb2v67pvL58Pes1ZFDZtPu_nL2+m6dgf_XOOymG9nVAkXVpEw@mail.gmail.com>
References: <20180501161227.2110-1-wens@csie.org> <20180501161227.2110-16-wens@csie.org>
 <20180502095118.rqnfwy576xh6ercm@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180502095118.rqnfwy576xh6ercm@flea>
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Corentin Labbe <clabbe.montjoie@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 2, 2018 at 5:51 PM, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> Hi,
>
> On Wed, May 02, 2018 at 12:12:27AM +0800, Chen-Yu Tsai wrote:
>> From: Icenowy Zheng <icenowy@aosc.io>
>>
>> Allwinner A64 has a SRAM controller, and in the device tree currently
>> we have a syscon node to enable EMAC driver to access the EMAC clock
>> register. As SRAM controller driver can now export regmap for this
>> register, replace the syscon node to the SRAM controller device node,
>> and let EMAC driver to acquire its EMAC clock regmap.
>>
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>> ---
>>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 23 +++++++++++++++----
>>  1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> index 1b2ef28c42bd..1c37659d9d41 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> @@ -168,10 +168,25 @@
>>               #size-cells = <1>;
>>               ranges;
>>
>> -             syscon: syscon@1c00000 {
>> -                     compatible = "allwinner,sun50i-a64-system-controller",
>> -                             "syscon";
>> +             sram_controller: sram-controller@1c00000 {
>> +                     compatible = "allwinner,sun50i-a64-sram-controller";
>
> I don't think there's anything preventing us from keeping the
> -system-controller compatible. It's what was in the DT before, and
> it's how it's called in the datasheet.

I actually meant to ask you about this. The -system-controller compatible
matches the datasheet better. Maybe we should just switch to that one?

ChenYu

> Otherwise, the whole serie looks good to me:
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Maxime
>
> --
> Maxime Ripard, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
