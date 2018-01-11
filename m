From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] media: dt-bindings: Add OF properties to ov7670
Date: Thu, 11 Jan 2018 08:45:35 -0600
Message-ID: <CAL_Jsq+zNEzkV0M715so=RxfTmgNrD8D=VxcBHk+Cw8xMiQ7NQ@mail.gmail.com>
References: <1515059553-10219-1-git-send-email-jacopo+renesas@jmondi.org>
 <1515059553-10219-3-git-send-email-jacopo+renesas@jmondi.org>
 <20180109033555.vgofzbnpx37iqaon@rob-hp-laptop> <20180109080111.GD25666@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180109080111.GD25666@w540>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 9, 2018 at 2:01 AM, jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
> Hi Rob,
>    thanks for comments
>
> On Mon, Jan 08, 2018 at 09:35:55PM -0600, Rob Herring wrote:
>> On Thu, Jan 04, 2018 at 10:52:33AM +0100, Jacopo Mondi wrote:
>> > Describe newly introduced OF properties for ov7670 image sensor.
>> > The driver supports two standard properties to configure synchronism
>> > signals polarities and two custom properties already supported as
>> > platform data options by the driver.
>>
>> Missing S-o-b.
>>
>
> Ups, that was trivial, sorry about that
>
>> > ---
>> >  Documentation/devicetree/bindings/media/i2c/ov7670.txt | 14 ++++++++++++++
>> >  1 file changed, 14 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov7670.txt b/Documentation/devicetree/bindings/media/i2c/ov7670.txt
>> > index 826b656..57ded18 100644
>> > --- a/Documentation/devicetree/bindings/media/i2c/ov7670.txt
>> > +++ b/Documentation/devicetree/bindings/media/i2c/ov7670.txt
>> > @@ -9,11 +9,22 @@ Required Properties:
>> >  - clocks: reference to the xclk input clock.
>> >  - clock-names: should be "xclk".
>> >
>> > +The following properties, as defined by video interfaces OF bindings
>> > +"Documentation/devicetree/bindings/media/video-interfaces.txt" are supported:
>> > +
>> > +- hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
>> > +- vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
>>
>> Don't these go in the endpoint? Not sure offhand.
>>
>
> Yes they do. I will list them as "Optional endpoint properties", and
>
>> > +
>> > +Default is high active state for both vsync and hsync signals.
>> > +
>> >  Optional Properties:
>> >  - reset-gpios: reference to the GPIO connected to the resetb pin, if any.
>> >    Active is low.
>> >  - powerdown-gpios: reference to the GPIO connected to the pwdn pin, if any.
>> >    Active is high.
>> > +- ov7670,pll-bypass: set to 1 to bypass PLL for pixel clock generation.
>>
>> Boolean instead?
>>
>
> Do we have booleans? I had a look at device tree specs and grep for
> "true"/"false" in arch/arm*/boot/dts, and didn't find that much.
> Seems like they're actually strings, am I wrong?

Properties with no value are boolean. Present is true, absent is
false. "foo = <0>" is also treated as true, but not recommended.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
