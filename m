From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: EXYNOS5420: Add IO mapping for non-secure SYSRAM
Date: Mon, 14 Apr 2014 15:24:50 +0200
Message-ID: <5167415.PAy87EVlKC@wuerfel>
References: <1397239311-27717-1-git-send-email-a.kesavan@samsung.com> <11327275.EJLfDGG21r@wuerfel> <20140414115910.GD3844@e103592.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140414115910.GD3844-M5GwZQ6tE7x5pKCnmE3YQBJ8xKzm50AiAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 14 April 2014 12:59:11 Dave Martin wrote:
> On Mon, Apr 14, 2014 at 01:47:56PM +0200, Arnd Bergmann wrote:
> > On Monday 14 April 2014 12:25:20 Dave Martin wrote:
> > > Arnd, what was your preferred solution?  Should this be described in DT?
> > 
> > Yes. There are already patches on the list to do this right.
> 
> This is http://www.spinics.net/lists/linux-samsung-soc/msg27647.html,
> right?
> 
> If so, it looks like exynos5420 should definitely follow the same
> approach.
> 

Yes, exactly.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
