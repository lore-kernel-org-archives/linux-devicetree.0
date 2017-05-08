From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [RFC v3 2/2] mux: mmio-based syscon mux controller
Date: Mon, 8 May 2017 10:38:07 +0200
Message-ID: <8defd856-ee01-583e-6362-eedbe16f4b3b@axentia.se>
References: <1493380324-20638-1-git-send-email-p.zabel@pengutronix.de>
 <1493380324-20638-2-git-send-email-p.zabel@pengutronix.de>
 <f43fe769-426f-2bfe-fb58-c69743171b0d@axentia.se>
 <1494231144.3029.25.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494231144.3029.25.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-05-08 10:12, Philipp Zabel wrote:
> Hi Peter,
> 
> On Mon, 2017-05-08 at 10:00 +0200, Peter Rosin wrote:
>> Hi Philipp,
>>
>> With the ack on the bindings in place, I'm going to pile these
>> two patches on top of my mux series when I send v15 next week (or
>> whenever v4.12-rc1 is out). There are a pair of nitpicks that I'm
>> going to fix myself, so no need for a resend.
> 
> Yes, please. While at it, could you also fix my "bitfieldis" typo in the
> commit description of patch 1.

Done, and pushed out to the mux branch of
https://gitlab.com/peda-linux/mux.git

(i.e. if you're interested in a preview for the pending v15 next week)

Cheers,
peda

>> Thank you very much for making use of the new code, I hope the
>> "3rd party interest" will help getting the mux series merged...
> 
> Thanks to Sakari for pointing it out in the video-mux review.
> 
> regards
> Philipp
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
