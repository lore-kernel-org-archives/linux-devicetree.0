From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: GPIO: Add generic serializer binding
Date: Thu, 28 Jan 2016 10:56:33 -0600
Message-ID: <CAL_JsqK7-bW_NmNwR_bhor6+h1szcxyZ+zuCJPnFKgT=-gSakw@mail.gmail.com>
References: <1453739851-31839-1-git-send-email-afd@ti.com> <1453739851-31839-2-git-send-email-afd@ti.com>
 <CACRpkdbSAi7t2gEy=jHhgCeQaGziDor1U2b5CDMciS8N_gYX-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbSAi7t2gEy=jHhgCeQaGziDor1U2b5CDMciS8N_gYX-w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 28, 2016 at 4:59 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Jan 25, 2016 at 5:37 PM, Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org> wrote:
>
>> Add binding for generic parallel-in/serial-out shift register devices
>> used as GPIO.
>>
>> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
> (...)
>> +Required properties:
>> + - compatible          : Should be "pisosr-gpio".
>
> As mentioned I'd like some vendor examples here with dual strings.
> "ti,foo", "pisosr-gpio"; is fine.

I acked it despite this because I've concluded it is not all that
useful in this case given you can have a variety of number of bits,
can chain together chips, etc. and the opportunity for screwing up or
differentiating this circuit in some way is really outside of the
logic chips themselves. You'd probably want to know the board not the
IC in this case.

The only reason I can think of to know the specific logic chip is if
different versions of IC can be populated and they have different
logic levels requiring regulator programming. We can cross that when
someone adds a supply. Of course, you could just as easily change
supply constraints as compatible strings in that case.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
