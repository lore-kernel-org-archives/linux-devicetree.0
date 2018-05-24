Return-Path: <SRS0=wnI8=IL=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <CAL_JsqJv-gZ4Ya6KCOtvQhzBPdLcqkU7c+kdH_TdPW9qvhtmxQ@mail.gmail.com>
References: <1526990469-20739-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526990469-20739-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180522171302.GA21363@rob-hp-laptop> <OSBPR01MB229367114CFC1AC30C0430E4D86B0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <CAL_JsqJv-gZ4Ya6KCOtvQhzBPdLcqkU7c+kdH_TdPW9qvhtmxQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 May 2018 10:17:41 +0200
Message-ID: <CAMuHMdWzORSs1_HeObaK0A1sYb_O8XTORA4EEk_riTKMWhWWAQ@mail.gmail.com>
Subject: Re: [PATCH/RFC v4 2/4] usb: gadget: udc: renesas_usb3: Add register
 of usb role switch
Content-Type: text/plain; charset="UTF-8"
To: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

On Wed, May 23, 2018 at 5:00 PM, Rob Herring <robh@kernel.org> wrote:
> On Wed, May 23, 2018 at 1:52 AM, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
>>> From: Rob Herring, Sent: Wednesday, May 23, 2018 2:13 AM
>>> On Tue, May 22, 2018 at 09:01:07PM +0900, Yoshihiro Shimoda wrote:
>>> > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
>>> > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
>>> > @@ -19,6 +19,9 @@ Required properties:
>>> >  Optional properties:
>>> >    - phys: phandle + phy specifier pair
>>> >    - phy-names: must be "usb"
>>> > +  - The connection to a usb3.0 host node needs by using OF graph bindings for
>>> > +    usb role switch.
>>> > +   - port@0 = USB3.0 host port.
>>>
>>> On the host side, this might conflict with the USB connector binding.
>>>
>>> I would either make sure this can work with the connector binding by
>>> having 2 endpoints on the HS or SS port or just use the 'companion'
>>> property defined in usb-generic.txt.
>>
>> I don't understand the first one now... This means the renesas_usb3 should follow
>> USB connector binding and have 2 endpoints for the usb role switch to avoid
>> the conflict like below?
>>  - port1@0: Super Speed (SS), present in SS capable connectors (from usb-connector.txt).
>>  - port1@1: USB3.0 host port.
>
> I'm confused, SS and USB3.0 are the same essentially. It would be:
>
> port@1/endpoint@0: SS host port
> port@1/endpoint@1: SS device port
>
>> About the 'companion' in usb-generic.txt, the property intends to be used for EHCI or host side
>> like the commit log [1]. If there is accept to use 'companion' for this patch, I think it will
>> be simple to achieve this role switch feature. However, in last month, I submitted a similar patch [2]
>> that has "renesas,host" property, but I got reply from Andy [3] and Heikki [4]. So, I'm
>> trying to improve the device connection framework [5] now.
>
> I think this case is rare enough that we don't need a general solution
> using OF graph, so I'm fine with a simple, single property to link the
> 2 nodes. Either reusing "companion" or "renesas,host" is fine by me.

I'd go for the standard "companion" over "renesas,host"[*].

[*] Doh, we have another one ("renesas,bonding"), invented when I wasn't
    aware of the existence of "companion" yet...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
