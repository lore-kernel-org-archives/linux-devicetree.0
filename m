From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: hisilicon: add dts files for
 hi3798cv200-poplar board
Date: Tue, 21 Feb 2017 08:39:30 -0600
Message-ID: <CAL_JsqLVdrEiYyg-RVx7iz9toAtecnMdFLbbXCxjTc=b9=m01w@mail.gmail.com>
References: <1486624027-15156-1-git-send-email-xuejiancheng@hisilicon.com>
 <20170215232649.rmvdel2cyxyzuord@rob-hp-laptop> <166c4e19-f1df-e3bc-59c3-4c952f8a1cf5@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <166c4e19-f1df-e3bc-59c3-4c952f8a1cf5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, hermit.wangheming-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 20, 2017 at 3:55 AM, Jiancheng Xue
<xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org> wrote:
> Hi Rob,
>
> On 2017/2/16 7:26, Rob Herring wrote:
>> On Thu, Feb 09, 2017 at 03:07:07PM +0800, Jiancheng Xue wrote:
>>> Add basic dts files for hi3798cv200-poplar board. Poplar is the
>>> first development board compliant with the 96Boards Enterprise
>>> Edition TV Platform specification. The board features the
>>> Hi3798CV200 with an integrated quad-core 64-bit ARM Cortex A53
>>> processor and high performance Mali T720 GPU.

[...]

>>> +    soc {
>>
>> soc@0
>>
>>> +            compatible = "simple-bus";
>>> +            #address-cells = <1>;
>>> +            #size-cells = <1>;
>>> +            ranges = <0x0 0x00000000 0x0 0xffffffff>;
>>
>> Looks like everything is within 0xf8000000-0xfa000000. Can this range be
>> further restrained?
>>
> Actually, some modules of the SoC will be added in later. This range could be restrained
> to "0xf0000000-0xffffffff". If so, should soc node be named soc@f0000000?

Yes.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
