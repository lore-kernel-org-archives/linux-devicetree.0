From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Add Support for R-Car D3 and
 Draak
Date: Mon, 18 Sep 2017 11:09:12 +0200
Message-ID: <20170918090909.GF4644@verge.net.au>
References: <1500555277-22921-1-git-send-email-geert+renesas@glider.be>
 <20170727151622.GG16143@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170727151622.GG16143-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 27, 2017 at 05:16:23PM +0200, Simon Horman wrote:
> On Thu, Jul 20, 2017 at 02:54:33PM +0200, Geert Uytterhoeven wrote:
> > 	Hi Simon, Magnus,
> > 
> > This patch series adds minimal support for the R-Car D3 SoC and the
> > Draak development board, allowing to boot from a ramdisk using a serial
> > console.
> > 
> >   - The first two patches add DT sources for R-Car D3 and Draak.
> >     Due to the use of hardcoded constants, they have no further (build)
> >     dependencies (obviously there is a runtime dependency).
> >   - The last two patches replace the hardcoded constants by symbols from
> >     DT binding headers, and thus depend on those headers.  Hence it
> >     should be postponed to v4.15.
> > 
> > For proper operation, this depends on the 3 series I have just sent:
> >   - [PATCH 0/3] arm64: renesas: Base R-Car D3 support,
> 
> I have applied the above patchset for v4.14.
> 
> >   - [PATCH 0/4] soc: renesas: Add R-Car D3 support,
> 
> And this one too.
> 
> >   - [PATCH 0/4] clk: renesas: Add R-Car D3 support.
> 
> And this one seems to have been acked, so I assume you will
> apply it once you are back from holidays.
> 
> So I have applied the first two patches for v4.14.
> Please repost the remaining two after v4.13-rc6 at which time I should
> be able to queue them up for v4.15.

I have now done so.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
