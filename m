From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: Remove leading 0x from bindings notation
Date: Thu, 30 Nov 2017 20:40:56 -0600
Message-ID: <20171201024056.ij4jg3cfwq474db3@rob-hp-laptop>
References: <20171129205515.9009-1-malat@debian.org>
 <c7200904-f016-8789-ee5e-fe5a281be215@caviumnetworks.com>
 <CA+7wUszQAjcOkaWyEhJ9GnqL0+PQOvsMx3rOaHMOnq_0HnUDeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CA+7wUszQAjcOkaWyEhJ9GnqL0+PQOvsMx3rOaHMOnq_0HnUDeQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 30, 2017 at 08:57:11AM +0100, Mathieu Malaterre wrote:
> Hi David,
> 
> On Thu, Nov 30, 2017 at 12:21 AM, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
> > On 11/29/2017 12:55 PM, Mathieu Malaterre wrote:
> >>
> >> Improve the binding example by removing all the leading 0x to fix the
> >> following dtc warnings:
> >>
> >> Warning (unit_address_format): Node /XXX unit name should not have leading
> >> "0x"
> >
> >
> > How does it fix the warnings?  You are not changing the .dts files that are
> > compiled.

If the examples were compiled, then they would have this warning...

> 
> I originally only wanted to fix [...]watchdog/ingenic,jz4740-wdt.txt,
> but when I lookup git log, I eventually found out about the commit I
> refer to in my commit message:
> 
> https://github.com/torvalds/linux/commit/48c926cd3414
> 
> and I simply followed suggestion from Rob:
> 
> https://lkml.org/lkml/2017/11/1/965
> 
> > This may also cause the binding documentation to differ from the reality of
> > what the actual device trees contain.
> 
> 
> Chicken or the egg dilemma, but you understand that linux master tree
> still has the original warning:
> 
> $ perl -p -i -e 's/\@0+([0-9a-f])/\@$1/g' `find ./ -type f \( -iname
> \*.dtsi -o -iname \*.dts \)`
> $ git diff | diffstat
> [...]
>  40 files changed, 160 insertions(+), 160 deletions(-)
> 
> And those are real W=1 actual warnings. Do you want me to re-submit it
> as patch series instead which fix both the documentation side and the
> dts* files ?

Some of those I skipped on purpose (they don't really follow standard 
unit-address), but I does look like some new ones got in. I'm not sure 
why I skipped PPC and xtensa altogether.

No need to fix everything, everywhere (but more patches always welcome 
:) ).

I'll apply this. Thanks. 

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
