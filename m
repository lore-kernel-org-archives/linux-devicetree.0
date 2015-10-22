From: Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: Generic DT binding for IPIs
Date: Thu, 22 Oct 2015 11:44:16 +0100
Message-ID: <5628BE00.4020106@imgtec.com>
References: <561E2BE6.2090807@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561E2BE6.2090807-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Is there anything more I can do to get more attention about this? I 
think Marc's suggestion is more generic and future proof, if I send RFC 
patches for that would this be better?

Thanks,
Qais

On 10/14/2015 11:18 AM, Qais Yousef wrote:
> Hi,
>
> This is an attempt to revive a discussion on the right list this time 
> with all the correct people hopefully on CC.
>
> While trying to upstream a driver, Thomas and Marc Zyngier pointed out 
> the need for a generic IPI support in the kernel to allow driver to 
> reserve and send ones. Hopefully my latest RFC patch will help to 
> clarify what's being done.
>
>     https://lkml.org/lkml/2015/10/13/227
>
> We need a generic DT binding support to accompany that to allow a 
> driver to reserve an IPI using this new mechanism.
>
> MarcZ had the following suggestion:
>
>     https://lkml.org/lkml/2015/8/24/628
>
> Which in summary is
>
>     mydevice@f0000000 {
>         interrupt-source = <&intc INT_SPEC 2 &inttarg1 &inttarg1>;
>     };
>
>     inttarg1: mydevice@f1000000 {
>         interrupt-sink = <&intc HWAFFINITY1>;
>     };
>
>     inttarg2: cpu@1 {
>         interrupt-sink = <&intc HWAFFINITY2>;
>     };
>
>
> interrupt-sink requests to reserve an IPI that it will receive at 
> HWAFFINITY cpumask. interrupt-source will not do any reservation. It 
> will simply connect an IPI reserved by interrupt-sink to the device 
> that will be responsible for generating that IPI. This description 
> should allow connecting any 2 devices.
> Correct me Marc if I got it wrong please.
>
> I suggested a simplification by assuming that IPIs will only be 
> between host OS and a coprocessor which would gives us this form which 
> I think is easier to deal with
>
>     coprocessor {
>              interrupt-source = <&intc INT_SPEC COP_HWAFFINITY>;
>              interrupt-sink = <&intc INT_SPEC CPU_HWAFFINITY>;
>     }
>
>
> interrupt-source here reserves an IPI to be sent from host OS to 
> coprocessor at COP_HWAFFINITY. interrupt-sink will reserve an IPI to 
> be received by host OS at CPU_HWAFFINITY. Less generic but I don't 
> know how important it is for host OS to setup IPIs between 2 external 
> coprocessors and whether it should really be doing that.
>
> What do the DT experts think? Any preference or a better suggestion?
>
> I tried to keep this short and simple, please let me know if you need 
> more info or if there's anything that needs more clarification.
>
> Thanks,
> Qais

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
