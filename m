From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: dtc warnings
Date: Fri, 1 Apr 2016 16:53:48 +0900
Message-ID: <CAJKOXPdDyVbfSyshu4j21Ax2J-VwPpMZgAGEeO8VtgFYh4hTmw@mail.gmail.com>
References: <CAL_Jsq+=OjY8y_8x7OSm-MWYKbrHN5cbv4TLwULxhNq+gfiMtw@mail.gmail.com>
	<56FE27F9.2070100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56FE27F9.2070100-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-platform-maintainers-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 1, 2016 at 4:49 PM, Tomi Valkeinen <tomi.valkeinen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Hi Rob,
>
> On 01/04/16 04:40, Rob Herring wrote:
> > You may have noticed that linux-next had gotten noisy with dtc
> > warnings lately. I dropped the change for a bit, but added it back
> > today except now it is disabled unless building with "W=1".
> >
> > There's ~25K (2500 unique) warnings generated from the ARM dts files.
> > Here's the ranking of warnings by dtb. OMAP is the clear winner (based
> > on the similar counts, probably lots of duplicates). Please help
> > remind contributors to test with W=1 and start to fix these.
> >
> > At least for memory nodes, I plan to whitelist allowing no
> > unit-address. There could be others, but none that I've seen so far.
>
> What's the correct way to fix nodes for display platform devices? For
> example, omap4-panda-common.dtsi has two connector nodes:
>
> dvi0: connector@0 {
>         compatible = "dvi-connector";
>         label = "dvi";
>         ...
> };
>
>
> hdmi0: connector@1 {
>         compatible = "hdmi-connector";
>         label = "hdmi";
>         ...
> };

I have the same doubts. The ePAPR says in that case "the node-name
alone differentiates the node from other nodes at the same level in
the tree.". But which is preferred? Differentiating by number or by
type?

Similarly, what to do with the opp modes (a lot of warnings) in
Documentation/devicetree/bindings/opp/opp.txt?

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
