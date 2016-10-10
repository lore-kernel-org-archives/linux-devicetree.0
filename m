From: "linshunquan (A)" <linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH] mfd: Add HiSilicon Flash Memory Controller(FMC) driver
Date: Mon, 10 Oct 2016 11:19:16 +0800
Message-ID: <6108fbb9-e82b-f56e-cf41-18d8859fbdfd@hisilicon.com>
References: <1473130643-12310-1-git-send-email-linshunquan1@hisilicon.com>
 <20160913145607.GA11998@rob-hp-laptop>
 <6b522be0-dcec-a84b-f161-69b8805bef62@hisilicon.com>
 <CAL_Jsq+8qPYfiA_bojPP2vm6PGPr9B=ntct=OyhoJTervMZMuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+8qPYfiA_bojPP2vm6PGPr9B=ntct=OyhoJTervMZMuA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "howell.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <howell.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "jalen.hsu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <jalen.hsu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, lvkuanliang 00222834 <lvkuanliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "kevin.lixu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <kevin.lixu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, quqi-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2016/9/15 5:56, Rob Herring wrote:
> On Wed, Sep 14, 2016 at 4:12 AM, linshunquan (A)
> <linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org> wrote:
>>
>>
>> On 2016/9/13 22:56, Rob Herring wrote:
>>> On Tue, Sep 06, 2016 at 10:57:22AM +0800, linshunquan 00354166 wrote:
>>>> From: Shunquan Lin <linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>>>>
>>>> This patch adds driver support for HiSilicon Flash Memory
>>>> Controller(FMC). HiSilicon FMC is a multi-functions device which
>>>> supports SPI Nor flash controller, SPI nand Flash controller and
>>>> parallel nand flash controller.
>>>>
>>>> Signed-off-by: Shunquan Lin <linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>>>> +    - spi-nor:
>>>> +    Required properties:
>>>> +            - compatible : "hisilicon,fmc-spi-nor"
>>>> +    see "Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt
>>>> +
>>>> +    - spi-nand:
>>>> +    Required properties:
>>>> +            - compatible : "hisilicon,fmc-spi-nand"
>>>> +            - reg : The chipselect for spi-nand devices
>>>> +            - address-cells : Should be 1.
>>>> +            - size-cells : Should be 0.
>>>> +
>>>> +    - nand:
>>>> +    Required properties:
>>>> +            - compatible : "hisilicon,fmc-nand"
>>>> +            - reg : The chipselect for nand devices
>>>> +            - address-cells : Should be 1.
>>>> +            - size-cells : Should be 0.
>>>> +
>>>> +Example:
>>>> +fmc: spi-nor-controller@10000000 {
>>>> +             compatible = "hisilicon,hisi-fmc";
>>>> +             reg = <0x10000000 0x1000>, <0x14000000 0x1000000>;
>>>> +             reg-names = "control", "memory";
>>>> +             clocks = <&crg FMC_CLK>;
>>>> +             #address-cells = <1>;
>>>> +             #size-cells = <0>;
>>>> +
>>>> +             hisfc:spi-nor@0 {
>>>> +                               compatible = "hisilicon,fmc-spi-nor";
>>>
>>> Is this an actual h/w sub-block? If not remove this node and make the
>>> spi-nor the immediate child.
>>>
>>
>> Hi Herring,
>> Thanks for your reply. Firstly I must correct a mistake here:
>>          fmc: spi-nor-controller@10000000 {
>>                  compatible = "hisilicon,hisi-fmc";
>>                 ...
>>   correct to:
>>          fmc: flash-memory-controller@10000000 {
>>                  compatible = "hisilicon,hisi-fmc";
>>                 ...
>>
>> Spi-nor is a sub block of HiSilicon Flash Memory Controller(FMC), HiSilicon FMC
>> is a multi-functions device, besides it also supports SPI Nand and Parallel Nand.
> 
> I understand that, but then were are the registers for the sub-blocks?
> If there is only a single set of chipselects for all devices (i.e. 0
> to N) and no separate register blocks for the sub-blocks, then you
> don't need this intermediate node.
> 

Hi Rob，
I'm sorry it's taken me so long to get back to you.

To the HiSilicon FMC, different devices have different chipselect, and you are right,
the register blocks are no separate, but spi nor, spi nand and nand may require
different initial configuration of default sublock clocks and clock frequencies, so
I think this node is necessary.

Here is a sample about the soc Hi3519:

in arch/arm/boot/dts/hi3519.dtsi defined:

fmc: flash-memory-controller@10000000 {
    compatible = "hisilicon,hisi-fmc";
    reg = <0x10000000 0x1000>, <0x14000000 0x1000000>;
    reg-names = "control", "memory";
    clocks = <&crg HI3519_FMC_CLK>;
    #address-cells = <1>;
    #size-cells = <0>;

    hisfc:spi-nor {
        compatible = "hisilicon,hisi-sfc";
        assigned-clocks = <&crg HI3519_FMC_CLK>;
        assigned-clock-rates = <24000000>;
        #address-cells = <1>;
        #size-cells = <0>;
    };

    hisnfc:spi-nand {
        compatible = "hisilicon,fmc-spi-nand";
        assigned-clocks = <&crg HI3519_FMC_CLK>;
        assigned-clock-rates = <3000000>;
        #address-cells = <1>;
        #size-cells = <0>;
    };
};

in arch/arm/boot/dts/hi3519-demb.dts, which include hi3519.disi, defined:

&hisfc {
    hi_sfc@0 {
        compatible = "jedec,spi-nor";
        reg = <0>;
        spi-max-frequency = <160000000>;
        m25p,fast-read;
    };
};

&hisnfc {
    hinand@0 {
        compatible = "jedec,spi-nand";
        reg = <0>;
        spi-max-frequency = <200000000>;
    };
};

Maybe I have not well understood on DTS, I hope I can get some suggestions from Rob.

Best regards
/Shunquan Lin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
