From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH V6 1/3] dt-bindings: document common IEEE 802.11
 frequency limit property
Date: Fri, 06 Jan 2017 13:59:57 +0100
Message-ID: <1483707597.12677.0.camel@sipsolutions.net>
References: <20170104175832.25996-1-zajec5@gmail.com>
         <CAL_JsqLg5YkC-YUHg6mQ35nmGaG7SC33VJB++fgtZsu1fRV-7Q@mail.gmail.com>
         <1483617089.4394.13.camel@sipsolutions.net>
         <CAL_JsqKYpTZFRJpPR1V9MmA-JW5ntoKzbkjwnYBp9HMWLObG3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKYpTZFRJpPR1V9MmA-JW5ntoKzbkjwnYBp9HMWLObG3A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2017-01-05 at 10:34 -0600, Rob Herring wrote:
> On Thu, Jan 5, 2017 at 5:51 AM, Johannes Berg <johannes@sipsolutions.
> net> wrote:
> > 
> > > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > 
> > Do I take that to mean that we'll merge it through the subsystem
> > tree,
> > and not go through some common DT tree?
> 
> Yes, that's generally the case when bindings are in a series with
> driver changes.

Alright, thanks.

I've applied patches 1-3, patch 4 obviously still needs work (and
probably won't go through my tree anyway.)

Note that I made some documentation fixes in patch 3, Rafał, please
check.

johannes
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
