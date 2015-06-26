From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: pSeries boot failure due to wrong interrupt controller
Date: Sat, 27 Jun 2015 08:38:44 +1000
Message-ID: <1435358324.26815.17.camel@kernel.crashing.org>
References: <CAEFTgiyHkf8ooYdWW0nTLcdraJ_L9FpLSVZa4KS3CcdpGWJxew@mail.gmail.com>
	 <CAL_JsqJqkUL8XyqR6yjg+-thj4YOQ6cUohGHHid71tdRFft7vw@mail.gmail.com>
	 <558D91C1.6030004@tributary.com>
	 <1435355687.26815.8.camel@kernel.crashing.org>
	 <558DD3C8.6000800@tributary.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <558DD3C8.6000800-WMdfZNuR64nqlBn2x/YWAg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy Linton <jlinton-WMdfZNuR64nqlBn2x/YWAg@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jeremy Linton <lintonrjeremy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2015-06-26 at 17:35 -0500, Jeremy Linton wrote:
> On 6/26/2015 4:54 PM, Benjamin Herrenschmidt wrote:
> > Ah I missed that completely. From your discussion, it looks correct, I'll
> > see if I can find a machine to test, however I think we dropped support for
> > POWER3 so it might be non-trivial to do so.
> 
> 	Thanks, the problem originally cropped up on a power4+, I was going to test
> it on power5 too, but I don't have access anymore. I do have a power3 as well,
> but I think that machine has other issues (the BUG_ON in the platform table
> for starters).

Ok, I don't think I still have one of these, but if you re-send the
patch with S-O-B etc... I'll review & ack it.

Cheers,
Ben.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
