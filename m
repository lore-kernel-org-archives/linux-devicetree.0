From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] Add of_path property for all devices with a node
Date: Mon, 10 Nov 2014 16:17:06 +1100
Message-ID: <1415596626.5769.14.camel@kernel.crashing.org>
References: <1415342031.4925.27.camel@kernel.crashing.org>
	 <1415342117.4925.29.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415342117.4925.29.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-11-07 at 17:35 +1100, Benjamin Herrenschmidt wrote:
> On Fri, 2014-11-07 at 17:33 +1100, Benjamin Herrenschmidt wrote:
> 
> > So I came up with this patch, 
> 
> And here is the actual patch, which might help :-) It's pretty trivial
> and small...

So not much reactions here .. a bit more on IRC, where Olof suggested
that rather than a file containing a path, we could use a symlink since
the devtree is now in sysfs, so we can do relative links.

That means keeping the legacy "devspec" files in the few places where
they exist, possibly behind a deprecated-default-y config option (though
we might never be able to deprecate them...), but there aren't many.

Any preference either way ?

Cheers,
Ben.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
