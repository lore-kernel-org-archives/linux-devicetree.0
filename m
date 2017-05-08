From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 29/30] dt-bindings: add vendor prefix for bananapi
Date: Mon, 8 May 2017 17:53:33 +0800
Message-ID: <1494237213.9662.50.camel@mtkswgap22>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
         <1493198774-4478-30-git-send-email-sean.wang@mediatek.com>
         <20170428203727.m6jm5w6nb2iirxih@rob-hp-laptop>
         <1493621880.32195.13.camel@mtkswgap22>
         <CAL_JsqKHpWGviZ2H-xhGMzNWsCCRMj_O5ux8aguFfeVKBfJa_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKHpWGviZ2H-xhGMzNWsCCRMj_O5ux8aguFfeVKBfJa_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, RobHerring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

thanks for helping me looping in the right group


Hi Arnd and Olof

I found Matthias is inactive for a while (his branch in his tree seemed
to stop at 4.10 since the end of February) maybe he was busy at other
things. Is there a good way to break the stuck situation and keeping
linux-mediatek moving on?

I have the willing to fork his tree, prepare dt-for-4.12 and send
pull-requests to you. But I am worried in that way violating the
reviewing process if Matthias no reads it.

	Sean


On Tue, 2017-05-02 at 08:52 -0500, Rob Herring wrote:
> +arm-soc
> 
> On Mon, May 1, 2017 at 1:58 AM, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > On Fri, 2017-04-28 at 15:37 -0500, Rob Herring wrote:
> >> On Wed, Apr 26, 2017 at 05:26:13PM +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> >> > From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >> >
> >> > Banana Pi team in Sinovoip Co., Limited which are dedicated to
> >> > design and manufacture open hardware product.
> >> >
> >> > Website: http://www.banana-pi.org/
> >> >
> >> > Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >> > ---
> >> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >> >  1 file changed, 1 insertion(+)
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> >> > index ec0bfb9..8ca0f3c 100644
> >> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> >> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> >> > @@ -44,6 +44,7 @@ avia      avia semiconductor
> >> >  avic       Shanghai AVIC Optoelectronics Co., Ltd.
> >> >  axentia    Axentia Technologies AB
> >> >  axis       Axis Communications AB
> >> > +bananapi Banana Pi SINOVOP CO., LIMITED
> >>
> >> s/SINOVOP/SINOVOIP/
> >
> > Hi Rob,
> >
> > thanks for your careful reviewing , i will correct it in the next
> > version.
> >
> > BTW, Could those related dts changes go through your tree if everything
> > looks good? Because I find Matthias have been inactive for a while and
> > the latest branch in his tree seems still staying on 4.10.
> 
> Happy to take binding doc changes, but I don't take dts changes
> because those go thru arm-soc. If the platform maintainer is not
> responsive, then we should replace or add maintainers.
> 
> Rob





--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
