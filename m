From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dma: mv_xor_v2: new driver
Date: Mon, 22 Feb 2016 13:58:14 -0600
Message-ID: <CAL_Jsq+bYmafQWasY1T2QG6Dujf7Ki6JSZKZoFzJXAphTAvnCA@mail.gmail.com>
References: <1455523083-25506-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160222032730.GU19598@localhost> <20160222101621.4f03ef8b@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160222101621.4f03ef8b-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 22, 2016 at 3:16 AM, Thomas Petazzoni
<thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hello Vinod,
>
> On Mon, 22 Feb 2016 08:57:30 +0530, Vinod Koul wrote:
>> On Mon, Feb 15, 2016 at 08:58:03AM +0100, Thomas Petazzoni wrote:
>> > diff --git a/Documentation/devicetree/bindings/dma/mv-xor-v2.txt b/Documentation/devicetree/bindings/dma/mv-xor-v2.txt
>> > new file mode 100644
>> > index 0000000..0a03dcf
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/dma/mv-xor-v2.txt
>> > @@ -0,0 +1,19 @@
>> > +* Marvell XOR v2 engines
>> > +
>> > +Required properties:
>> > +- compatible: Should be "marvell,mv-xor-v2"
>> > +- reg: Should contain registers location and length (two sets)
>> > +    the first set is the DMA registers
>> > +    the second set is the global registers
>> > +- msi-parent: Phandle to the MSI-capable interrupt controller used for
>> > +  interrupts.
>> > +
>> > +Example:
>> > +
>> > +   xor0@400000 {
>> > +           compatible = "marvell,mv-xor-v2";
>> > +           reg = <0x400000 0x1000>,
>> > +                 <0x410000 0x1000>;
>> > +           msi-parent = <&gic_v2m0>;
>> > +           dma-coherent;
>> > +   };
>>
>> This should be a separate patch :)
>
> This is really a personal preference, and different maintainers have
> different opinions on the matter. However, if your preference is to
> have the DT binding documentation as a separate patch, then I'll split
> it, no problem :)

Read step 1 in Documentation/devicetree/bindings/submitting-patches.txt.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
