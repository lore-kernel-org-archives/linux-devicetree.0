From: Jeremy Linton <jlinton-WMdfZNuR64nqlBn2x/YWAg@public.gmane.org>
Subject: Re: [PATCH] Fix pSeries boot failure, by returning interrupt controller
 node when an interrupt-map property doesn't exist
Date: Tue, 30 Jun 2015 13:14:48 -0500
Message-ID: <5592DC98.8070805@tributary.com>
References: <CAEFTgixGKnMuMGp2DfoksqF0m_P6-EGJ0sUjg2=ReX2X0tq2nA@mail.gmail.com>	<1435634613.26815.78.camel@kernel.crashing.org> <20150630160156.7010DC405A7@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150630160156.7010DC405A7-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Linton <lintonrjeremy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 6/30/2015 11:01 AM, Grant Likely wrote:
> Merged, thanks.
	Thanks!

> Jeremy, please check your mailer configuration. The patch was mangled
> and would not apply. I had to fix it up manually.

	Sorry about that, I will see about creating a better setup (aka not gmail/web
client) for patches I send from home.

> Also, does this patch need to be backported into stable? What commit
> introduced this bug, and which kernel does it first appear in?

	I didn't bisect the problem so i'm not 100% sure, but I think the commit that
caused this was 2361613206e66ce59cc0e08efa8d98ec15b84ed1 AKA 3.13. For me I
don't need stable, I just pulled the machine forward on a whim in order to build
some other things. I will try to do that more frequently due to the fact that
the bug existed for a little over a year..


	
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
