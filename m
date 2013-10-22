From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Tue, 22 Oct 2013 13:42:48 -0400 (EDT)
Message-ID: <alpine.LFD.2.03.1310221333300.1951@syhkavp.arg>
References: <52644A9E.3060007@wwwdotorg.org> <20131020220839.GT2443@sirena.org.uk> <5264576F.6050307@wwwdotorg.org> <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg> <52658EBC.8020800@wwwdotorg.org> <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
 <20131022093923.GC15640@ulmo.nvidia.com> <20131022150426.GF29341@beef>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131022150426.GF29341@beef>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 22 Oct 2013, Matt Porter wrote:

> DT has many benefits. It would be great to leverage them as long as it
> doesn't interfere with the rate of change and willingness to evolve code
> that's always been the strength of the kernel process. That strength is
> too valuable to trade away for the "DT as ABI" vision.

Amen.  This is the best statement I've read about DT so far.

Having "stable" DT bindings is just a dream.  Experience so far is 
showing that this is neither practical nor realistic.

The unstructured free-for-all approach isn't good either.  Some 
compromise between the two extremes needs to be found.


Nicolas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
