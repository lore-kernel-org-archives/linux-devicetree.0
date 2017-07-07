From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/8] usb: bdc: Add Device Tree binding document for
 Broadcom BDC driver
Date: Fri, 7 Jul 2017 15:15:29 -0500
Message-ID: <CAL_JsqJ5Osbs83dSbWht=e-aDo4fxBT2c97MtrFrvcyz3Q+57A@mail.gmail.com>
References: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
 <1498587806-24781-3-git-send-email-alcooperx@gmail.com> <20170706141840.lanfxjdrkaqvv3vz@rob-hp-laptop>
 <CAGh=XACQvkb1QE=EokekiCdK9K9yktkGyVNdXaT4CxE8XP=u4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGh=XACQvkb1QE=EokekiCdK9K9yktkGyVNdXaT4CxE8XP=u4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Al Cooper <al.cooper-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, yuan linyu <Linyu.Yuan-cfy2TCaE7SHLM0G2K2Xlo2/U75nxZMCp@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Please only post plain text emails.

On Fri, Jul 7, 2017 at 2:03 PM, Al Cooper <al.cooper-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>
>
> On Thu, Jul 6, 2017 at 10:18 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>
>> On Tue, Jun 27, 2017 at 02:23:20PM -0400, Al Cooper wrote:
>> > Add Device Tree binding document for Broadcom USB Device
>> > Controller (BDC).
>> >
>> > Signed-off-by: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > ---
>> >  .../devicetree/bindings/usb/brcm,bdc-udc.txt       | 28 ++++++++++++++++++++++
>> >  1 file changed, 28 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt b/Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt
>> > new file mode 100644
>> > index 0000000..4eeaddb
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt
>> > @@ -0,0 +1,28 @@
>> > +Broadcom USB Device Controller (BDC)
>> > +====================================
>> > +
>> > +Required properties:
>> > +
>> > +- compatible: must be one of:
>> > +                "brcm,bdc-udc-v0.16"
>> > +                "brcm,bdc-udc"
>>
>> Isn't "bdc-udc" redundant?
>
>
> I'll change the base name to "brcm-udc"

Well, it should be "brcm,<something>" with the vendor prefix followed
by a comma. If the block is known as the BDC, then I'd use that.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
