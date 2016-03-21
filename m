From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regmap: fix documentation to match code
Date: Mon, 21 Mar 2016 08:14:28 -0500
Message-ID: <20160321131428.GA28046@rob-hp-laptop>
References: <1458235427-3856540-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458235427-3856540-1-git-send-email-arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Xiubo Li <Li.Xiubo-3arQi8VN3Tc@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 17, 2016 at 06:23:40PM +0100, Arnd Bergmann wrote:
> The regmap binding talks about one thing, which is register
> endianess, and it gets almost every aspect of it wrong.
> 
> This replaces the current text of the file with a version
> that makes more sense and that matches what we implement
> now.
> 
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Fixes: a06c488da0b0 ("regmap: Add explict native endian flag to DT bindings")
> Fixes: 275876e208e2 ("regmap: Add the DT binding documentation for endianness")

[...]

> +Note:
> +Regmap defaults to little-endian register access on MMIO based
> +devices, this is by far the most common setting. On CPU

This seems a bit Linux specific to me, but I guess if we are defining 
the binding to be this way it is fine.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> +architectures that typically run big-endian operating systems
> +(e.g. PowerPC), registers can be defined as big-endian and must
> +be marked that way in the devicetree.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
