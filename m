From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 2/2] power: reset: at91-shdwc: add new shutdown
 controller driver
Date: Wed, 16 Mar 2016 13:07:49 +0100
Message-ID: <20160316120749.GC20227@piout.net>
References: <1457624260-30350-1-git-send-email-nicolas.ferre@atmel.com>
 <1457624260-30350-3-git-send-email-nicolas.ferre@atmel.com>
 <20160314202205.GA24894@piout.net>
 <56E94558.9010506@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56E94558.9010506-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 16/03/2016 at 12:36:56 +0100, Nicolas Ferre wrote :
> I don't agree with you on the 2 last ones. In Documentation/CodingStyle,
> it is said that:
> 
> "Chapter 2: Breaking long lines and strings
> [..]
> Descendants are always substantially shorter than the parent and
> are placed substantially to the right."
> 
> Together with the 80 column requirement that I also fulfil, I think that
> my code is well aligned.
> 
> So I keep it like this ;-)
> 

checkpatch.pl --strict disagrees with you


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
