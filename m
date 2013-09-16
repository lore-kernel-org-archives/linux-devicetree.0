From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v9 2/3] DMA: Freescale: Add new 8-channel DMA engine
 device tree nodes
Date: Mon, 16 Sep 2013 17:46:30 -0500
Message-ID: <1379371590.2536.187.camel@snotra.buserror.net>
References: <1377861980-7027-1-git-send-email-hongbo.zhang@freescale.com>
	 <1377861980-7027-3-git-send-email-hongbo.zhang@freescale.com>
	 <20130902155636.GA18206@e106331-lin.cambridge.arm.com>
	 <5225A57E.4030003@freescale.com>
	 <20130912171541.GH22013@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130912171541.GH22013-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Hongbo Zhang <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org" <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "djbw-b10kYP2dOMg@public.gmane.org" <djbw-b10kYP2dOMg@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2013-09-12 at 18:15 +0100, Mark Rutland wrote:
> On Tue, Sep 03, 2013 at 10:01:50AM +0100, Hongbo Zhang wrote:
> > On 09/02/2013 11:58 PM, Mark Rutland wrote:
> > > May some channels be unusable for some reason, or will all eight
> > > channels be wired on any given Elo3 DMA?
> > Sorry, not get your point clearly, maybe you are clear now because of my
> > previous explanations.
> 
> I assume that on any El03 DMA, there won't be a case where you can't
> describe the channel at 0x80, for instance. It will always be present
> (but it might not be wired up to anything any therefore be useful)?
> 
> This was related to my concerns about the status register description --
> if the channels at 0x0,0x80,0x100,0x180 weren't wired, what would get
> described in the dt? I guess that would never actually happen because
> all 8 channels must always be present in the Elo3 IP block.

If a channel is not usable for whatever reason (other than that "used
for a different fixed purpose and thus described with a different
compatible" thing that was mentioned earlier in these threads), wouldn't
it just have status = "disabled" or similar, or be absent?

-Scott



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
