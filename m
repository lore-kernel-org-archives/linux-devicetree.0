From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC usb-next v5 1/3] dt-bindings: usb: add the documentation for
 USB root-hub
Date: Thu, 19 Oct 2017 11:54:29 +0200
Message-ID: <d154baad-45c6-2665-6515-b151609e4605@baylibre.com>
References: <20171008211713.18696-1-martin.blumenstingl@googlemail.com>
 <20171008211713.18696-2-martin.blumenstingl@googlemail.com>
 <CAK8P3a2607YnNRRmAJJyTNJTTJmJvx-ZJm3QNAq84noPLy+F+A@mail.gmail.com>
 <CAFBinCCc+Fj6wwGk+OLNQTHEYU8xBPe7OGHVSQ82kMew3xUsww@mail.gmail.com>
 <CAK8P3a2C+8w5_8uZF2qHvq7Cp=AH6DDx5Y=mGJFCCz2pTLvPPg@mail.gmail.com>
 <CAFBinCC7disratgMmmaSJMfywb-bPF32L-1BarSsX6zTChHEJg@mail.gmail.com>
 <CAK8P3a31GLjQDUUdyTeaAX_fELV5_UkNQfbj+ssHrGa7Ek2NcA@mail.gmail.com>
 <CAFBinCCmk3bSa4-OY7Mu0sPEhVv6=dQbSO94P=YMqk_hc+53Pg@mail.gmail.com>
 <CAK8P3a0hFF-gMa4UWMXh-28=scF-8cnzPv-Sa11PzyvgMYAkQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a0hFF-gMa4UWMXh-28=scF-8cnzPv-Sa11PzyvgMYAkQw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, gregkh <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "open list:ARM/Amlogic Meson SoC support" <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18/10/2017 11:05, Arnd Bergmann wrote:
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
> 
> To rephrase what I'm interested in, can you check that with your
> patch series, we correctly associate a device node in DT with the
> struct device in the kernel both with and without the optional
> roothub node in the dtb?
> 
> Since you used a dtb that already listed an endpoint device below
> an xhci, that would answer my earlier question of whether it worked
> before your patch series, and you tested that it still works with your
> patches applied and the roothub node added in the dtb.  Now we
> just need to make sure we don't break existing dtb files that don't
> have the roothub node but do have endpoint device nodes.
> 
>        Arnd
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 

Hi Arnd,

I tested in the same conditions :
- On Odroid-C2 using DWC2, but not using the roothub functionnality
- patch v6 applied
- node for on-board hub
- printk in usb core

And it works :
[    8.767964] usb 1-1: of_node /soc/usb@c9100000/hub@1 parent /soc/usb@c9100000
[    8.955901] usb 1-1: new high-speed USB device number 2 using dwc2
[    9.165641] hub 1-1:1.0: USB hub found
[    9.165939] hub 1-1:1.0: 4 ports detected

Neil
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
