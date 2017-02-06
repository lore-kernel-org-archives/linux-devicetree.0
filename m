From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 08/16] atmel-isi: document device tree bindings
Date: Mon, 6 Feb 2017 15:31:07 -0600
Message-ID: <CAL_Jsq+NANxTFROAnKh_C4RDwzRQQSFv0UNQ+poGPAXxNT1-Mw@mail.gmail.com>
References: <20170130140628.18088-1-hverkuil@xs4all.nl> <20170130140628.18088-9-hverkuil@xs4all.nl>
 <20170201165059.2qw3gnuyornvfl46@rob-hp-laptop> <00bc695f-d412-7796-93a9-8d67a8f66370@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <00bc695f-d412-7796-93a9-8d67a8f66370-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 6, 2017 at 6:20 AM, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org> wrote:
> On 02/01/2017 05:50 PM, Rob Herring wrote:
>> On Mon, Jan 30, 2017 at 03:06:20PM +0100, Hans Verkuil wrote:
>>> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>>>
>>> Document the device tree bindings for this driver.

>>> +isi: isi@f0034000 {
>>> +    compatible = "atmel,at91sam9g45-isi";
>>> +    reg = <0xf0034000 0x4000>;
>>> +    interrupts = <37 IRQ_TYPE_LEVEL_HIGH 5>;
>>> +    pinctrl-names = "default";
>>> +    pinctrl-0 = <&pinctrl_isi_data_0_7>;
>>> +    clocks = <&isi_clk>;
>>> +    clock-names = "isi_clk";
>>> +    status = "ok";
>>> +    port {
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +            isi_0: endpoint {
>>> +                    reg = <0>;
>>
>> Drop reg.
>
> Is that because that is the default?

Essentially, yes. You only need reg if you have more than one of something.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
