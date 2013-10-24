From: Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 14:13:21 +0200
Message-ID: <1382616801.6040.26.camel@sakura.staff.proxad.net>
References: <20131020220839.GT2443@sirena.org.uk>
	 <5264576F.6050307@wwwdotorg.org>
	 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
	 <52658EBC.8020800@wwwdotorg.org>
	 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
	 <20131022093923.GC15640@ulmo.nvidia.com> <20131022150426.GF29341@beef>
	 <20131022171346.GE4061@obsidianresearch.com>
	 <20131023080630.GA14413@netboy>
	 <20131023172955.GA17145@obsidianresearch.com>
	 <20131023174458.GC5208@netboy>
	 <1382553982.31058.10.camel@sakura.staff.proxad.net>
	 <20131024095232.27BBCC4039D@trevor.secretlab.ca>
	 <1382614439.6040.16.camel@sakura.staff.proxad.net>
	 <1382615278.8522.72.camel@shinybook.infradead.org>
Reply-To: mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="ANSI_X3.4-1968"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382615278.8522.72.camel-Fexsq3y4057IgHVZqg5X0TlWvGAXklZc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Thu, 2013-10-24 at 12:47 +0100, David Woodhouse wrote:

> If you can automatically infer the correct clock/interrupt/etc in order
> to do DMA correctly, despite the fact that it wasn't explicitly spelled
> out in the old DT, then the property is *not* a "required" property.
> It's optional, and you have a default behaviour for when it's not
> present.

so inside the new version of driver-hwcrypto.c:

if (irq_of_parse_and_map(...) == NO_IRQ) {
	switch (get_soc_model()) {
		case SOC1:
			irq = 51;
			break;

		case SOC2:
			irq = 62;
			break;

		[...]
	}
}

?

-- 
Maxime


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
