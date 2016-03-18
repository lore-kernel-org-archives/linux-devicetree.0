From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] drm: Add DT bindings documentation for ARC PGU
 display controller
Date: Fri, 18 Mar 2016 14:55:50 -0500
Message-ID: <CAL_JsqLvhHGjYV2DaCL8nxQuzx2ox0EOfynt5PvHcBik6+aPpw@mail.gmail.com>
References: <1455887034-7739-1-git-send-email-abrodkin@synopsys.com>
 <1455887034-7739-3-git-send-email-abrodkin@synopsys.com> <20160223203841.GA15744@rob-hp-laptop>
 <1457013497.3005.99.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457013497.3005.99.camel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 3, 2016 at 7:58 AM, Alexey Brodkin
<Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> wrote:
> Hi Rob,
>
> On Tue, 2016-02-23 at 14:38 -0600, Rob Herring wrote:
>> On Fri, Feb 19, 2016 at 04:03:52PM +0300, Alexey Brodkin wrote:
>> >
>> > This add DT bindings documentation for ARC PGU display controller.
>> >
>> > Signed-off-by: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>> > Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> > Cc: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> > ---
>> >  .../devicetree/bindings/display/snps,arcpgu.txt    | 74 ++++++++++++++++++++++
>> >  1 file changed, 74 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/display/snps,arcpgu.txt
>> > b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
>> > new file mode 100644
>> > index 0000000..c8382fb
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
>> > @@ -0,0 +1,74 @@
>> > +ARC PGU
>> > +
>> > +This is a display controller found on several development boards produced
>> > +by Synopsys. The ARC PGU is an RGB streamer that reads the data from a
>> > +framebuffer and sends it to a single digital encoder (usually HDMI).
>> > +
>> > +Required properties:
>> > +  - compatible: "snps,arcpgu"
>> Seems like this should be more specific. Is there some sort or
>> versioning with ARC blocks?
>
> Well as of today there's only one and only version of PGU.
> So is there a real need for "snps,arcpgu-1.0"?
>
>> >
>> > +  - reg: Physical base address and length of the controller's registers.
>> > +  - clocks: A list of phandle + clock-specifier pairs, one for each
>> > +    entry in 'clock-names'.
>> > +  - clock-names: A list of clock names. For ARC PGU it should contain:
>> > +      - "pxlclk" for the clock feeding the output PLL of the controller.
>> > +  - encoder-slave: Phandle of encoder chip.
>> This is unnecessary with the OF graph.
>
> Do you mean I may drop "encoder-slave" from bindings description?

Yes, you should drop it.

> I actually thought about that because in case of simulation platform where
> this device is also used there's no encoder as well as no connector - we're
> dealing with memory area which is read by host and then displayed on host's
> display.
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
