From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH 0/1] mtd: Add NAND ECC devicetree binding
Date: Tue, 11 Feb 2014 23:44:42 -0800
Message-ID: <20140212074442.GB3500@norris-Latitude-E6410>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA66555@DBDE04.ent.ti.com>
 <20140117203347.GC3843@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA67E79@DBDE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA67E79-yXqyApvAXouIQmiDNMet8wC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Gupta, Pekon" <pekon-l0cyMroinI0@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 20, 2014 at 06:21:35AM +0000, Pekon Gupta wrote:
> >From: Ezequiel Garcia 
> >I'm not implying we should deprecate the recently added "ti-nand-ecc-opt",
> >but just want to know it's eventually possible.
> >
> Yes, this is good approach for long-term, and it can replace "ti-nand-ecc-opt"
> "ti-nand-ecc-opt" is not new DT binding, it just got some new values added
> However, you have to convince DT Maintainers to get this in, and then deprecate
> other vendor specific bindings. It would be difficult to maintain backward
> compatibility to these bindings, if we move to 'nand-ecc-strength'.

I don't see why it would be difficult to support both the more generic
nand-ecc-strength and the OMAP-specific ti-nand-ecc-opt in the same
driver. OMAP NAND would just have to define a helper that translates
properties like "bch8" into a strength and sector size (8 and 512,
respectively). From then on, you can treat them identically.

> At some-point we need to get some concrete guidelines from DT Maintainers on
> how long we should support deprecated bindings in our code, And what is the
> age of DT binding. I think David Woodhouse should throw more light, as he had
> some discussions & ideas on about DT binding life, during a linux conference.

Barring some new direction from the DT folks, I believe DT is an eternal
ABI. We can and should maintain compatibility forever. And in this case,
I don't think it's that hard.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
