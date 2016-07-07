From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC/PATCH] dt: Add of_device_compatible_match()
Date: Fri, 08 Jul 2016 08:25:52 +1000
Message-ID: <1467930352.27157.70.camel@kernel.crashing.org>
References: <1466981246.20278.27.camel@kernel.crashing.org>
	 <577E868E.30702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <577E868E.30702-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2016-07-07 at 09:42 -0700, Frank Rowand wrote:
> 
> of_device_is_compatible() returns a higher value for a better match.
> 
> of_fdt_match() returns a lower value for a better match.

Ugh ... that smells of trainwreck...

> So checking for (tmp < score) will give you the opposite of what you want.

Yup. I'll fix it.

> And if you are replacing of_fdt_match() with of_device_compatible_match(),
> the caller will have the expectation that a smaller score is a better
> match.

The few callers I converted only really cared about exact matches.

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
