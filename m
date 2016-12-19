From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun8i: add opp-v2 table for A33
Date: Mon, 19 Dec 2016 16:53:23 +0800
Message-ID: <CAGb2v65YWntCrFHtSbxhtTWkt+UwkW3xoY-ae26MpH+-ULLXSQ@mail.gmail.com>
References: <20161215182754.33921-1-icenowy@aosc.xyz> <20161219084652.kiqdkiewu5tujlyd@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBG6A33BAKGQEKRUZ43A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161219084652.kiqdkiewu5tujlyd@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 19, 2016 at 4:46 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Fri, Dec 16, 2016 at 02:27:54AM +0800, Icenowy Zheng wrote:
>> An operating point table is needed for the cpu frequency adjusting to
>> work.
>>
>> The operating point table is converted from the common value in
>> extracted script.fex from many A33 board/tablets.
>>
>> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
>> ---
>> Changes since v1:
>> - Fix format problem (blank lines).
>> - Removed the 1.344GHz operating point, as it's overvoltage and overclocked.
>>
>> This patch depends on the following patchset:
>>
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2016-December/473962.html
>>
>> It's the v2 of the [PATCH 4/6] in this patchset.
>>
>> I think this operating point table may also apply to A23, as there's no
>> difference except the points over 1.2GHz between A23 and A33's stock dvfs table.
>>
>> But as A23 CCU may not have the necessary fixes, I won't add the table to A23
>> now.
>>
>> Chen-Yu, could you test the CCU fixes I described in the patchset above on A23,
>> then test this operating points table?
>>
>> If it's necessary, you can send out the CCU fixes and add one more patch that
>> moves this opp-v2 table to sun8i-a23-a33.dtsi .
>>
>>  arch/arm/boot/dts/sun8i-a33.dtsi | 35 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
>> index 504996cbee29..0f5b2af72981 100644
>> --- a/arch/arm/boot/dts/sun8i-a33.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-a33.dtsi
>> @@ -46,7 +46,42 @@
>>  #include <dt-bindings/dma/sun4i-a10.h>
>>
>>  / {
>> +     cpu0_opp_table: opp_table0 {
>> +             compatible = "operating-points-v2";
>> +             opp-shared;
>> +
>> +             opp@648000000 {
>> +                     opp-hz = /bits/ 64 <648000000>;
>> +                     opp-microvolt = <1040000>;
>> +                     clock-latency-ns = <244144>; /* 8 32k periods */
>> +             };
>> +
>> +             opp@816000000 {
>> +                     opp-hz = /bits/ 64 <816000000>;
>> +                     opp-microvolt = <1100000>;
>> +                     clock-latency-ns = <244144>; /* 8 32k periods */
>> +             };
>> +
>> +             opp@1008000000 {
>> +                     opp-hz = /bits/ 64 <1008000000>;
>> +                     opp-microvolt = <1200000>;
>> +                     clock-latency-ns = <244144>; /* 8 32k periods */
>> +             };
>> +
>> +             opp@1200000000 {
>> +                     opp-hz = /bits/ 64 <1200000000>;
>> +                     opp-microvolt = <1320000>;
>> +                     clock-latency-ns = <244144>; /* 8 32k periods */
>> +             };
>> +     };
>> +
>>       cpus {
>> +             cpu0: cpu@0 {
>
> There's no need to duplicate the label here. I removed it and applied.

I think using the label to directly reference cpu0 would be better,
instead of duplicating the cpu@0 block.

ChenYu
