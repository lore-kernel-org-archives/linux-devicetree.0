From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5] checks: check for #{size,address}-cells without child nodes
Date: Mon, 20 Nov 2017 10:22:53 -0600
Message-ID: <CAL_JsqJoiBvD-QE5bgk5ob3qc65ar371xWxx-1D+fKGh7+P=Zw@mail.gmail.com>
References: <20171117144515.10870-1-robh@kernel.org> <20171117144515.10870-5-robh@kernel.org>
 <20171120001438.GJ19214@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171120001438.GJ19214-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 19, 2017 at 6:14 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Nov 17, 2017 at 08:45:14AM -0600, Rob Herring wrote:
>> nodes with a 'reg' property nor a ranges property.
>>
>> An exception may be an overlay that adds nodes, but this case would
>> need
>
> Sentence doesn't seem finished..

It was there until I rebased. Since the line started with #, git dropped it...

"#{size,address}-cells in the overlay to properly compile already."

> In any case, I'm not sure this is a good idea.  It's not uncommon to
> have bus bridge nodes that ought to have a well defined #address and
> #size cells, but just don't happen to have any plugged devices yet.
> An overlay that adds nodes is one possibility, but a bus where the
> children can be probed is another.

Wouldn't an overlay without #{size,address}-cells have warnings from
avoid_default_addr_size?

As long as there are no child nodes, the check is not run. So we're
limited to false positives if we have a mixture of nodes with and
without unit addresses and only the nodes without unit addresses are
populated. I have seen this with PCI hosts with an interrupt
controller child node.

In general, I'm struggling with how to have tests that check for
things that we generally want to avoid, but we still allow exceptions.
Some of these may be things we want to avoid in new bindings, but
wouldn't fix for existing cases. Another example is things that
were/are valid for OF, but not FDT.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
