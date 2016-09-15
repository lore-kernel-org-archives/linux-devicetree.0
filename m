From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 5/8] ARM: dts: am335x-boneblack: Add
 blue-and-red-wiring -property to LCDC node
Date: Thu, 15 Sep 2016 12:22:59 -0700
Message-ID: <20160915192257.hbz4vqxgd5thesfq@atomide.com>
References: <cover.1472719892.git.jsarha@ti.com>
 <fad833a6a4368196f4fc131a54d90f5b90169393.1472719892.git.jsarha@ti.com>
 <d9dcc43b-6884-aab1-ff82-c66ecf6e96b6@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d9dcc43b-6884-aab1-ff82-c66ecf6e96b6-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, peter.ujfalusi-l0cyMroinI0@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org> [160915 02:44]:
> Tony,
> The functional changes are now merged. But let's not merge this bbb dts
> patch just yet, so we do not cause a conflict with the other bbb hdmi
> audio dts change[1] that slipped into tda998x pull request. The patch
> can very well wait until v4.10 if needed.
> 
> However, the other three dts patches[2] can be merged. Should I rebase
> those on top of some branch and resend them?

Sorry I've lost count of all the patches and about tag all my emails
as read for v4.9 merge window. So yeah it's best to resend the dts
changes separately :)

Regards,

Tony
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
