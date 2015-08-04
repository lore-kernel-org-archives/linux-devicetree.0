From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 3/3] MIPS: ath79: Add the reset controller to the AR9132
 dtsi
Date: Tue, 04 Aug 2015 10:47:57 +0200
Message-ID: <1438678077.3793.25.camel@pengutronix.de>
References: <1438622633-9407-1-git-send-email-albeu@free.fr>
	 <1438622633-9407-4-git-send-email-albeu@free.fr>
	 <20150803182336.GH2843@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150803182336.GH2843-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, den 03.08.2015, 20:23 +0200 schrieb Ralf Baechle:
> On Mon, Aug 03, 2015 at 07:23:53PM +0200, Alban Bedel wrote:
> 
> Acked-by: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>t
> 
> Philipp,
> 
> Feel free to take this through the reset tree.  Or I can carry this in
> the MIPS tree which is probably better for testing.  Just lemme know.
> 
>   Ralf

How about I put this on a branch for you to pull? That way I can already
resolve the (trivial) merge conflict in drivers/reset/Makefile

    git://git.pengutronix.de/git/pza/linux.git reset/ath79

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
