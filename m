From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] soc: qcom: add an EBI2 device tree bindings
Date: Thu, 18 Aug 2016 10:14:20 +0200
Message-ID: <CACRpkdZ=HU6j3=Ye4dm=tFU=KmG54bq06KDfxPViWUouOA=jOA@mail.gmail.com>
References: <1470691445-27571-1-git-send-email-linus.walleij@linaro.org>
 <1470691445-27571-2-git-send-email-linus.walleij@linaro.org> <2988918.zNxvaGl6en@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2988918.zNxvaGl6en@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 8, 2016 at 11:32 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

> On Monday, August 8, 2016 11:24:02 PM CEST Linus Walleij wrote:
>> +
>> +Required subnode properties:
>> +- chipselect: <N> where N is the chipselect configured in this node
>> +- address-cells: should be <1>
>> +- size-cells: should be <1>
>> +- ranges: bool should be present
>>
>
> I think this should use a proper ranges property that translates
> the address space of the external bus into the parent bus.
>
> Just use #address-cells=<2> and make the first cell the cs number,
> as the other similar drivers do, and get rid of the chipselect
> property.

Rob Herring also wrote:

>> +Required subnode properties:
>> +- chipselect: <N> where N is the chipselect configured in this node
>
> Follow the other external buses that put the CS# in the reg property.

Also the same comment from Mark Rutland on IRC.

The following discussion is only about the CS-in-reg property problem.
The ranges issue is not fixed but that is an orthogonal thing I'm working
on.

There is a problem. Look at this cut-down example where I just have
the "qcom,xmem-recovery-cycles" set up for the CS2 chip select:

ebi2@1a100000 {
       compatible = "qcom,msm8660-ebi2";
       #address-cells = <1>;
       #size-cells = <1>;
       (...)
       cs2@1b800000 {
               chipselect = <2>;
               #address-cells = <1>;
               #size-cells = <1>;
               qcom,xmem-recovery-cycles = <5>;
               foo-ebi2@1b800000 {
                       compatible = "foo";
                       reg = <0x1b800000 0x100>;
                       (...)
               };
               bar-ebi2@1b800000 {
                       compatible = "bar";
                       reg = <0x1ba00000 0x100>;
                       (...)
               };
       };
};

So two devices "foo" and "bar" on the EBI2 bus, in the old
scheme.

So I need to encode the CS in the first cell of the reg for
foo-ebi2, and get rid of chipselect = <2> fine:

ebi2@1a100000 {
       compatible = "qcom,msm8660-ebi2";
       #address-cells = <1>;
       #size-cells = <1>;
       (...)
       cs2@1b800000 {
               #address-cells = <2>;
               #size-cells = <1>;
               qcom,xmem-recovery-cycles = <5>;
               foo-ebi2@1b800000 {
                       compatible = "foo";
                       reg = <2 0x1b800000 0x100>;
                       (...)
               };
               bar-ebi2@1ba00000 {
                       compatible = "bar";
                       reg = <2 0x1ba00000 0x100>;
                       (...)
               };
       };
};

This is not looking good at all. First: the configuration settings for
the chipselect (i.e. all devices below it, both "foo" and "bar" are
just floating in space. When parsing the tree how should you know
what chipselect to set up the stuff on? Shall I check the child nodes
first value in the reg property and then make a majority vote on what
chipselect they apply to or what? That doesn't make sense.

So I assume doing away with the chipselect node altogether would
be prefered. But then: where do I put stuff like "qcom,xmem-recovery-cycles"
that apply to the whole chipselect, not just a single subdevice on that
chipselect? I certainly cannot encode it in the reg since it needs
to be the same for all devices and it's not about addressing.

The only thing I can reasonably come up with would be this:

ebi2@1a100000 {
       compatible = "qcom,msm8660-ebi2";
       #address-cells = <2>;
       #size-cells = <1>;
       qcom,xmem-recovery-cycles = <0>, <0>, <5>, <0>, <0>, <0>;

       (...)
       foo-ebi2@1b800000 {
              compatible = "foo";
               reg = <2 0x1b800000 0x100>;
               (...)
       };
       bar-ebi2@1ba00000 {
               compatible = "bar";
               reg = <2 0x1ba00000 0x100>;
               (...)
       };
};

So the chip select settings are shoehorned into an array in the top
node that is then indexed to find the settings for cs0, cs1 etc.

There will be 6 such arrays for the different per-cs settings.

Is this what you want? I kind of thought the hierarchical model
was nice since each device was below its chipselect node, but
I understand that it breaks the pattern of other similar bus drivers.

So are you fine with the array solution?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
