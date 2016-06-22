From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 2/8] mfd: ac100: Add device tree bindings
 for X-Powers AC100 codec/RTC combo IC
Date: Wed, 22 Jun 2016 12:16:03 +0800
Message-ID: <CAGb2v64TYTi0_thF7Z8cdBE9dkbPUq9xAhmhegqH8efVx1oCFw@mail.gmail.com>
References: <1466391138-12862-1-git-send-email-wens@csie.org>
 <1466391138-12862-3-git-send-email-wens@csie.org> <20160621131443.GA29350@rob-hp-laptop>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCMILY6JWQBBBG5CVC5QKGQENDCAGEA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160621131443.GA29350@rob-hp-laptop>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 21, 2016 at 9:14 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Jun 20, 2016 at 10:52:12AM +0800, Chen-Yu Tsai wrote:
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>> Changes since v2:
>>
>>   - Fix interrupt line for ac100_codec in provided example.
>>
>> ---
>>  Documentation/devicetree/bindings/mfd/ac100.txt | 42 +++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/ac100.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/ac100.txt b/Documentation/devicetree/bindings/mfd/ac100.txt
>> new file mode 100644
>> index 000000000000..a793954bb952
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/ac100.txt
>> @@ -0,0 +1,42 @@
>> +X-Powers AC100 Codec/RTC IC device tree bindings
>> +
>> +AC100 is a audio codec and RTC subsystem combo IC. The 2 parts are
>> +separated, including power supplies and interrupt lines, but share
>> +a common register address space and host interface.
>> +
>> +Required properties:
>> +- compatible: "x-powers,ac100"
>> +- reg: The I2C slave address or RSB hardware address for the chip
>> +- sub-nodes:
>> +  - codec
>> +    - compatible: "x-powers,ac100-codec"
>> +    - interrupt-parent: The parent interrupt controller
>> +    - interrupts: SoC NMI / GPIO interrupt connected to the IRQ_AUDIO pin
>> +  - rtc
>> +    - compatible: "x-powers,ac100-rtc"
>> +    - interrupt-parent: The parent interrupt controller
>> +    - interrupts: SoC NMI / GPIO interrupt connected to the IRQ_RTC pin
>> +    - #clock-cells: shall be 1
>> +    - clock-output-names: "cko1_rtc", "cko2_rtc", "cko3_rtc"
>> +    - see clock/clock-bindings.txt for common clock bindings
>> +
>> +Example:
>> +
>> +ac100: codec@e89 {
>> +     compatible = "x-powers,ac100";
>> +     reg = <0xe89>;
>> +
>> +     ac100_codec {
>
> Use generic node names and no underscores:
>
> codec {

Right. I intended to add them as labels, not change the node names.

Thanks
ChenYu

>
>> +             compatible = "x-powers,ac100-codec";
>> +             interrupt-parent = <&r_pio>;
>> +             interrupts = <0 9 IRQ_TYPE_LEVEL_LOW>; /* PL9 */
>> +     };
>> +
>> +     ac100_rtc {
>
> rtc {
>
>> +             compatible = "x-powers,ac100-rtc";
>> +             interrupt-parent = <&nmi_intc>;
>> +             interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>> +             #clock-cells = <1>;
>> +             clock-output-names = "cko1_rtc", "cko2_rtc", "cko3_rtc";
>> +     };
>> +};
>> --
>> 2.8.1
>>

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
