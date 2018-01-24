From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [linux-sunxi][PATCH 5/5] arm64: allwinner: a64: Add DAI nodes
Date: Wed, 24 Jan 2018 12:39:31 +0100
Message-ID: <CAEKpxBk8NXJn4KxEGXx7UddqpUMC65kdEgx1phZDWyUd3ER_3Q@mail.gmail.com>
References: <20180124103943.2062-1-codekipper@gmail.com> <20180124103943.2062-6-codekipper@gmail.com>
 <20180124110222.cdglyg5m7644xiem@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180124110222.cdglyg5m7644xiem-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 24 January 2018 at 12:02, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi,
>
> On Wed, Jan 24, 2018 at 11:39:43AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Add the DAI blocks to the device tree. I2S0 and I2S1 are for
>> connecting to an external codec.
>>
>> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> index f060a58f374c..f3354f8c2026 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> @@ -419,6 +419,32 @@
>>                       status = "disabled";
>>               };
>>
>> +             i2s0: i2s@1c22000 {
>> +                     #sound-dai-cells = <0>;
>> +                     compatible = "allwinner,sun8i-h3-i2s";
>
> Same remark than for the spdif, please add a soc-specific compatible.

Is that really necessary?..for example on the a20 the functionality of
the i2s is the same as the a10 so it is down as
"allwinner,sun4i-a10-i2s", likewise here it's the same as the changes
required for the H3. I was planning on using the compatible
"allwinner,sun50i-a64-i2s" for the audio codec as there are some
quirks that need to be addressed.

Thanks,
CK
>
> Thanks!
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
