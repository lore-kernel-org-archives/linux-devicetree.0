From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V7 1/4] Documentation/devicetree/bindings: b850v3_lvds_dp
Date: Wed, 4 Jan 2017 14:39:50 -0600
Message-ID: <CAL_JsqJk=QZ20VmV5uE1ta2T0TEO3rvWFbiGsJpH1e3-ojnBfA@mail.gmail.com>
References: <20170103225127.jn36tatufdfz2k5q@rob-hp-laptop> <529b-586c3500-5-5e05b080@98620974>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <529b-586c3500-5-5e05b080@98620974>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Peter Senna Tschudin <peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh@>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 3, 2017 at 5:34 PM, Peter Senna Tschudin
<peter.senna-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
>  Hi Rob,
>
> Thank you for the review.
>
> On 03 January, 2017 23:51 CET, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
>> On Sun, Jan 01, 2017 at 09:24:29PM +0100, Peter Senna Tschudin wrote:
>> > Devicetree bindings documentation for the GE B850v3 LVDS/DP++
>> > display bridge.
>> >
>> > Cc: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
>> > Cc: Martin Donnelly <martin.donnelly-JJi787mZWgc@public.gmane.org>
>> > Cc: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
>> > Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>> > Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> > Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> > Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
>> > Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>> > ---
>> > There was an Acked-by from Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> for V6, but I changed
>> > the bindings to use i2c_new_secondary_device() so I removed it from the commit
>> > message.
>> >
>> >  .../devicetree/bindings/ge/b850v3-lvds-dp.txt      | 39 ++++++++++++++++++++++
>>
>> Generally, bindings are not organized by vendor. Put in
>> bindings/display/bridge/... instead.
>
> Will change that.
>
>>
>> >  1 file changed, 39 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt b/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
>> > new file mode 100644
>> > index 0000000..1bc6ebf
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
>> > @@ -0,0 +1,39 @@
>> > +Driver for GE B850v3 LVDS/DP++ display bridge
>> > +
>> > +Required properties:
>> > +  - compatible : should be "ge,b850v3-lvds-dp".
>>
>> Isn't '-lvds-dp' redundant? The part# should be enough.
>
> b850v3 is the name of the product, this is why the proposed name. What about, b850v3-dp2 dp2 indicating the second DP output?

Humm, b850v3 is the board name? This node should be the name of the bridge chip.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
