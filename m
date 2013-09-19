From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [dtc RFC PATCH] Enforce node name unit-address presence/absence
Date: Thu, 19 Sep 2013 17:10:53 +1000
Message-ID: <1379574653.6148.62.camel@pasglop>
References: <1379535836-12726-1-git-send-email-swarren@wwwdotorg.org>
	 <CAOesGMg0Rrmew0iK-Gtrx_UiODhpro_S2xUxQi0gZ+7PJmBHnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMg0Rrmew0iK-Gtrx_UiODhpro_S2xUxQi0gZ+7PJmBHnw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2013-09-18 at 13:41 -0700, Olof Johansson wrote:
> Also, maybe warn for @0x<foo>, which is another unpreferred syntax, it
> should just be @<foo> (with foo being in hex).

It can also bee @foo,bar, it doesn *have* to match the exact content of
the reg property first entry. In fact it's not uncommon to use a 64-bit
value here on 64-bit processors and pci uses a different encoding scheme
(on real OFW at least) where they typically do @dev,fn

Yes, the fact that the unit address is not something deterministic is
and has always been a major PITA though.

Cheers,
Ben.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
