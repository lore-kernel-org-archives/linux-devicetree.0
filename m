From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm/marvell: ABI unstability warning
 about Marvell 7K/8K
Date: Thu, 25 Feb 2016 09:09:27 +0100
Message-ID: <20160225090927.13492cfb@free-electrons.com>
References: <1456327007-31008-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1456327007-31008-2-git-send-email-thomas.petazzoni@free-electrons.com>
	<20160224172545.GC9137@leverpostej>
	<20160224211045.379352d3@free-electrons.com>
	<CAL_JsqLevrujSeYNBvSJA-5T0Ho8y7c0fKid7QvVm8LLvYLotw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLevrujSeYNBvSJA-5T0Ho8y7c0fKid7QvVm8LLvYLotw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Rob,

On Wed, 24 Feb 2016 16:07:04 -0600, Rob Herring wrote:

> You should fix the incomplete information problem. I pushed back on
> this, you got more information and already the binding is closer to
> reality.

"You should fix the incomplete information problem". You seem to think
that it is a simple thing that can be fixed with a magic wand. But it's
not.

Either because the internal processes are complicated, or simply
because the Linux kernel support is done without cooperation from the
HW vendor (it's not the case of this Marvell platform, but it's the
case of many other platforms).

> Mark didn't say don't submit. First, there is value in submitting even
> if not accepted immediately and you have to carry some patches for
> some time. It was also suggested that you err on the side of less
> information in DT if things are uncertain and you have not done that.

Submitting without merging is useless. The point of submitting is to
get the code merged, to reduce the amount of out-of-tree patches we
have to carry, and to allow users of the platform to simply run
mainline on their platform.

So this proposal really doesn't make any sense. Just like Mark initial
statement of not submitting code so early.

> > So please get to an agreement between DT binding maintainers. And stop
> > saying this ridiculous statement that HW vendors should stop submitting
> > their code to the mainline.
> 
> You want us to agree, then you won't like the answer. Bindings must be
> stable. I'll allow exceptions to that, but not without push back.
> 
> In general, if there is disagreement about whether stability is
> required, then it is required. See the recent sunxi discussion. That's
> more between users and platform maintainers though.

Do you realize that this all DT binding stuff is today the *biggest* to
getting HW support in the Linux kernel? It has become more complicated
to merge a 4 properties DT binding than to merge multiple thousands of
lines of driver code. Simply because of this DT stability fairy tale.

In the mean time, I'm withdrawing this patch. I'll let Mark and you in
your Alice in Wonderland world, where you believe that DT bindings are
stable while the reality is that they are not and that their stability
is actually unneeded for most platforms.

Gregory, can you skip patch 1/3, and merge patches 2/3 and 3/3, once
the new clock DT binding has been approved.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
