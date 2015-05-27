From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] ARM: BCM5301X: add NAND flash chip description
Date: Tue, 26 May 2015 18:15:38 -0700
Message-ID: <20150527011538.GE27753@ld-irv-0074>
References: <1432492349-18517-1-git-send-email-hauke@hauke-m.de>
 <20150527004144.GC27753@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150527004144.GC27753@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 26, 2015 at 05:41:44PM -0700, Brian Norris wrote:
> > +			linux,part-probe = "ofpart", "bcm47xxpart";
> 
> ^ NAK to this line. You still haven't documented any semantics for this
> property. And I gave you several comments on your previous patch about
> what would need to change before I'd accept this property.

Just noticed you sent v2 of your previous patch over the weekend, which
does include documentation for this. That's a start, but I'm still not
very happy with the property. I'll put my full comments there
eventually.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
