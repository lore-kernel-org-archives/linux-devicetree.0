From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Migrate PXA27x platforms to clock framework
Date: Sun, 24 Aug 2014 14:08:19 +0200
Message-ID: <201408241408.19861.arnd@arndb.de>
References: <1406753464-15000-1-git-send-email-robert.jarzmik@free.fr> <1465795.XsPpj3dZHX@wuerfel> <87d2bq43pc.fsf@free.fr>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87d2bq43pc.fsf-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sunday 24 August 2014, Robert Jarzmik wrote:
> > By default, I'd expect Haojian to pick up the patches and send
> > us a pull request. He sent an Ack, but also didn't make it clear
> > that we should pick them up.
> I was thinking that they would go through the clk maintainers, hence Haojian's
> ack. If they should go through arm-soc, they would need Mike's ack.

Right, makes sense. We have in the past done it either way for other
platforms. When merging the patches through the clk subsystem, it still
makes sense to let us know of those plans and ask for an Ack from
the arm-soc maintainers, to be sure we can plan ahead in case there
are other (conflicting) patch sets that are sent through arm-soc.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
