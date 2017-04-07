From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3 RESEND] clocksource: Augment bindings for Faraday
 timer
Date: Sat, 8 Apr 2017 00:08:59 +0200
Message-ID: <20170407220859.GR2078@mai>
References: <20170407215513.25706-1-linus.walleij@linaro.org>
 <CAL_JsqJ6HWRiU2iQtJapRLwuWdUM6KCgYfseJzMtie-xG_UKxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ6HWRiU2iQtJapRLwuWdUM6KCgYfseJzMtie-xG_UKxw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 07, 2017 at 05:01:53PM -0500, Rob Herring wrote:
> On Fri, Apr 7, 2017 at 4:55 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > It turns out that the Cortina Gemini timer block is just a
> > standard IP block from Faraday Technology named FTTMR010.
> >
> > In order to make things clear and understandable, we rename the
> > bindings with a Faraday compatible as primary and the Cortina
> > gemini as a more specific case.
> >
> > For the plain Faraday timer we require two clock references,
> > while the Gemini can keep it's syscon lookup pattern.
> >
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  .../bindings/timer/cortina,gemini-timer.txt        | 22 ---------------
> >  .../devicetree/bindings/timer/faraday,fttmr010.txt | 33 ++++++++++++++++++++++
> >  2 files changed, 33 insertions(+), 22 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/timer/cortina,gemini-timer.txt
> >  create mode 100644 Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
> 
> Does the -M option not work here?
> 
> In any case,
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks.


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
