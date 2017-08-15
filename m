From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 0/4] OF phandle nexus support + GPIO nexus
Date: Tue, 15 Aug 2017 15:36:59 -0500
Message-ID: <CAL_JsqLTzL1AkyfQxuTzz06ywXkCE6JZaFzV60ENDuL7TzY0BA@mail.gmail.com>
References: <20170811154236.12891-1-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170811154236.12891-1-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 11, 2017 at 10:42 AM, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This is a continutation of my phandle remapping/nexus node series
> from a while ago. I finally got around to writing the documentation
> in the spec for this, but it's really rough around the edges and
> could use some review/suggestions to get it into shape. Please
> review!
>
> This is one small chunk of work related to DT overlays for expansion
> boards. It would be good to have a way to expose #<list>-cells types of
> providers through a connector in a standard way. So we introduce a way
> to make "nexus" nodes for these types of properties to remap the consumer
> number space to the other side of the connector's number space. It's
> basically a copy of the interrupt nexus implementation, but without
> the address space matching design and interrupt-parent walking.

This generally looks good to me. I'm inclined to merge the kernel
parts now and sort the spec addition out afterwards. With no users
yet, we can still tweak things if needed.

I would like to see more comments on this though. Perhaps "OF phandle
nexus" is too obscure. Maybe "Add DT overlay connector bindings" would
trick some people in looking at it...

Rob
