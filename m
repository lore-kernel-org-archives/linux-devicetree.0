From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFC usb-next v5 1/3] dt-bindings: usb: add the documentation for
 USB root-hub
Date: Thu, 19 Oct 2017 23:25:48 +0200
Message-ID: <CAFBinCAtsxu2gFXABhq5r0_DMJwsLGkLYjgWaEXMg=CVEjiv7w@mail.gmail.com>
References: <20171008211713.18696-1-martin.blumenstingl@googlemail.com>
 <20171008211713.18696-2-martin.blumenstingl@googlemail.com>
 <CAK8P3a2607YnNRRmAJJyTNJTTJmJvx-ZJm3QNAq84noPLy+F+A@mail.gmail.com>
 <CAFBinCCc+Fj6wwGk+OLNQTHEYU8xBPe7OGHVSQ82kMew3xUsww@mail.gmail.com>
 <CAK8P3a2C+8w5_8uZF2qHvq7Cp=AH6DDx5Y=mGJFCCz2pTLvPPg@mail.gmail.com>
 <CAFBinCC7disratgMmmaSJMfywb-bPF32L-1BarSsX6zTChHEJg@mail.gmail.com>
 <CAK8P3a31GLjQDUUdyTeaAX_fELV5_UkNQfbj+ssHrGa7Ek2NcA@mail.gmail.com>
 <CAFBinCCmk3bSa4-OY7Mu0sPEhVv6=dQbSO94P=YMqk_hc+53Pg@mail.gmail.com> <CAK8P3a0hFF-gMa4UWMXh-28=scF-8cnzPv-Sa11PzyvgMYAkQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a0hFF-gMa4UWMXh-28=scF-8cnzPv-Sa11PzyvgMYAkQw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:ARM/Amlogic Meson SoC support" <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Wed, Oct 18, 2017 at 11:05 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tue, Oct 17, 2017 at 11:19 PM, Martin Blumenstingl
> <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>>> Ok, very good!
>>>
>>>> is there anything else you want me to test?
>>>
>>> What about the same dtb when run on a kernel without your
>>> patch series? Does that work as well, or are your patches
>>> required to make it work?
>>
>> this is the only device I have which uses devicetree and a xHCI
>> controller. I can test it with a dwc2 based device though if you want
>
> Does dwc2 also use separate nodes for the roothub? From your
> description it sounds like it would not be affected by your patch.
currently it doesn't use separate notes for the roothub - however,
with this patch it could (although I haven't explicitly tested this)

> To rephrase what I'm interested in, can you check that with your
> patch series, we correctly associate a device node in DT with the
> struct device in the kernel both with and without the optional
> roothub node in the dtb?
I can do the same tests that Neil did with SoCs that use a dwc2
controller (Amlogic Meson8m2 and Meson8b).
the only SoC I have which uses a dwc3 controller is an Amlogic Meson
GXL - however this won't see any devices (apart from the root-hub)
without this patch

> Since you used a dtb that already listed an endpoint device below
> an xhci, that would answer my earlier question of whether it worked
> before your patch series, and you tested that it still works with your
> patches applied and the roothub node added in the dtb.  Now we
> just need to make sure we don't break existing dtb files that don't
> have the roothub node but do have endpoint device nodes.
the endpoint you're seeing is the root-hub - you can see the full .dts here: [0]

maybe my patch description or documentation is not clear - could you
please explain what makes you think that specifying the root-hub
didn't work before (so I can update the comments where needed)?
to sum up what this series does: find the node with reg = <0>; (= the
root-hub) and get all PHY instances from the child-nodes
this should not change any existing behavior except if someone had a
node with reg = <0>; below any USB controller node (which was
undocumented behavior before my patches)


Regards,
Martin


[0] https://github.com/xdarklight/linux/blob/meson-gxl-usb-v6/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi#L55
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
