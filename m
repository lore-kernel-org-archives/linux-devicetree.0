From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 29/30] dt-bindings: add vendor prefix for bananapi
Date: Tue, 9 May 2017 16:03:00 +0800
Message-ID: <CAGb2v66PuKQVoq1oSLepdUGLwvA-O0jh+ckLNwsNMCwcnfAJBg@mail.gmail.com>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
 <1493198774-4478-30-git-send-email-sean.wang@mediatek.com>
 <20170428203727.m6jm5w6nb2iirxih@rob-hp-laptop> <1493621880.32195.13.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493621880.32195.13.camel@mtkswgap22>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, May 1, 2017 at 2:58 PM, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> On Fri, 2017-04-28 at 15:37 -0500, Rob Herring wrote:
>> On Wed, Apr 26, 2017 at 05:26:13PM +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
>> > From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> >
>> > Banana Pi team in Sinovoip Co., Limited which are dedicated to
>> > design and manufacture open hardware product.
>> >
>> > Website: http://www.banana-pi.org/
>> >
>> > Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> > ---
>> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> > index ec0bfb9..8ca0f3c 100644
>> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> > @@ -44,6 +44,7 @@ avia      avia semiconductor
>> >  avic       Shanghai AVIC Optoelectronics Co., Ltd.
>> >  axentia    Axentia Technologies AB
>> >  axis       Axis Communications AB
>> > +bananapi Banana Pi SINOVOP CO., LIMITED
>>
>> s/SINOVOP/SINOVOIP/
>
> Hi Rob,
>
> thanks for your careful reviewing , i will correct it in the next
> version.
>
> BTW, Could those related dts changes go through your tree if everything
> looks good? Because I find Matthias have been inactive for a while and
> the latest branch in his tree seems still staying on 4.10.

Chiming in from the linux-sunxi side.

We've been using the "lemaker" prefix for the original Banana Pi, and
the "sinovoip" prefix for all the later ones by SINOVOIP. Both prefixes
are still undocumented.

Given the complicated history behind the Banana Pi brand, do we know
what prefix they prefer, and what company should be tied to it?

Thanks
ChenYu

>
>         Sean
>
>>
>> >  boe        BOE Technology Group Co., Ltd.
>> >  bosch      Bosch Sensortec GmbH
>> >  boundary   Boundary Devices Inc.
>> > --
>> > 1.9.1
>> >
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
