From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/9] ARM: dts: consolidate aliases for Cygnus dt files
Date: Wed, 23 Sep 2015 23:31:12 +0200
Message-ID: <20046098.CeNft0Jl1D@wuerfel>
References: <1442611454-16331-1-git-send-email-rjui@broadcom.com> <25764744.UdkoAR05y0@wuerfel> <55FC85D6.7050506@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55FC85D6.7050506-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 18 September 2015 14:44:54 Ray Jui wrote:
> On 9/18/2015 2:27 PM, Arnd Bergmann wrote:
> > On Friday 18 September 2015 14:24:06 Ray Jui wrote:
> > 
> > The SoC has at least four uarts according to this, so it seems unlikely that
> > each board really only uses only the fourth one of them and labels it '0'
> > on the board. As soon as you get one board that has more than one uart wired
> > up, you would need to undo this.
> > 
> 
> I think Scott might have explained this in the past. uart3 is going to
> be used on all Cygnus boards (including all future boards) because the
> bootrom was designed to use uart3 as console and that won't change.
> 
> Let me know if you still think I need to move this back to the dts.

I would still like to see them stay in the .dts file, if only for
consistency with other platforms. 

Also, even if you can guarantee that uart3 is always used for the
console, that doesn't prevent board designers from adding more than
one uart, right?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
