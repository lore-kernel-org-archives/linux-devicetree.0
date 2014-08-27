From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: Re: [RFC PATCH 0/9] dt: dependencies (for deterministic driver initialization
 order based on the DT)
Date: Wed, 27 Aug 2014 09:16:23 +0200
Message-ID: <53FD85C7.4080900@ahsoftware.de>
References: <20140825093931.GB2399@ulmo> <E1XLu15-0002DP-6o@jdl.com> <20140825133714.GH4163@ulmo.nvidia.com> <20140826084208.AE5F0C40989@trevor.secretlab.ca> <20140826084922.GG17263@ulmo> <53FC566C.30904@ahsoftware.de> <20140826102503.GC31124@ulmo> <53FC6513.5040800@ahsoftware.de> <20140826110827.GA31350@ulmo> <53FC6E4A.6030407@ahsoftware.de> <20140826114718.GB641@ulmo> <53FC76E8.5050009@ahsoftware.de> <E1XMHGc-0008TS-CQ@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1XMHGc-0008TS-CQ-CYoMK+44s/E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 26.08.2014 15:58, schrieb Jon Loeliger:

> I think we need to do the complete topsort *before* we attempt
> to do any probing.  So three steps:
>
>     1) Graph Construction
>         Add a new "emit dependencies" function to driver bindings.
>         Iterate over known devices or nodes in the DT in any order.
> 	    Call the "emit dependencies" function.  It adds all
> 	    dependency edges to a global graph by knowing what
> 	    phandles or other pieces it will need.
> 	    A driver with no "emit dependencies" function can be
> 	    added to the graph anywhere without loss of generality.
>         Add any additional edges for whatever reason.
>
>     2) Topsort the generated driver graph
>
>     3) Call probe for real in topsort order
>
> Alexander, I don't recall the details of your patch series.
> Can you please remind us if it took this approach in the kernel?
>
>> Anyway, I'm leaving this discussion. I've already made a proposal
>> which solved most mentioned problems (imho) and even offered usable
>> patches

Why should I? I've posted patches along with a lot of comments and
explanations, and e.g. you are just talking that it should be made like
my patches already did. And others do talk too like my patches and the
accompanying comments from me which explain most stuff never have 
existed and just repeat what the patches already do without refering to 
them.

> Darn.  I think you clearly have a pony in this race, and it
> would be good if you still participated.  Really.

Thanks. But I don't see it as a race and I don't want to take part in a 
race (and I usually avoid those silly contests which have become chic in 
the IT world). I just offered a solution (or at least a working starting 
point to a solution).

>> (ok, they suffer under the "not invented here" syndrom, but ...). ;)
>
> There isn't a single thing in the entire Linux Kernel community
> that was "invented here"; every aspect of it was NIH'ed by *someone*.
> That's how it gets built, changed, maintained, fixed, etc.

Might be true in an ideal open source world and might have been true for 
past kernel development when most people weren't full time kernel 
developers. But nowadays it appears to me like many parts of the kernel 
have become in the hands of closed groups. And they build and enforce 
hurdles that high, that nobody else can take them without spending an 
idiotic amount of time. Just like many other "consortiums" do, you only 
have to build enough rules to protect from the outside while still 
looking open.

E.g. an example I've seen often is that someone spend a lot of time to 
examine and fix a bug and write a commented patch. And the only response 
from the maintainer was that he should add an emtpy line before a return 
statement and similiar silly things to enforce patch-ping-pong. Such 
just drives people on the other end crazy and they likely won't spend 
the time to post another patch (they still might  fix other bugs, but 
just for themself).

Regards,

Alexander Holler
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
