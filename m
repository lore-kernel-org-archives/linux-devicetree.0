From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/2] powerpc/qman: Change fsl,qman-channel-id to
 cell-index
Date: Thu, 20 Aug 2015 11:53:48 -0500
Message-ID: <20150820165348.GA4881@home.buserror.net>
References: <1429311187-19062-1-git-send-email-scottwood@freescale.com>
 <BN3PR0301MB126796C0EC18EEBB26702C588CD10@BN3PR0301MB1267.namprd03.prod.outlook.com>
 <1430858734.16357.256.camel@freescale.com>
 <BN3PR0301MB1267E5A61E7E5BC2789F9E898CDA0@BN3PR0301MB1267.namprd03.prod.outlook.com>
 <1431470762.16357.511.camel@freescale.com>
 <BN3PR0301MB12670C0BE318280D1C53FE0F8C670@BN3PR0301MB1267.namprd03.prod.outlook.com>
 <20150819213021.GA22290@home.buserror.net>
 <BN3PR0301MB12675C1EC30FBC1E823161908C660@BN3PR0301MB1267.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BN3PR0301MB12675C1EC30FBC1E823161908C660-CEkquS/Gb80KBjv5qxT+hJwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pledge Roy-R01356 <roy.pledge-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bucur Madalin-Cristian-B32716 <madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Wang Haiying-R54964 <Haiying.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 20, 2015 at 09:52:46AM -0500, Pledge Roy-R01356 wrote:
> I guess my point isn't getting through - channel-id and cell-index are
> too independent concepts that are coincidentally the same.  Cell-index
> is only used by u-boot and is used to determine the portal number.  It
> is absolutely possible that we produce and SoC where portal number 0
> has channel 0x1000.  We've changed these things in the past as well -
> this is why we introduced the channel-id property.  This is also
> consistent with other blocks (FMan, PME, DCE) that have channels
> associated with them.
> 
> The cell-index is useless - the portal ID can be derived from the
> portal address.  The fact that you're unwilling to remove cell-index
> doesn't mean that channel-id is redundant and should be removed.

I guess my point isn't getting through.  Any concept that cell-index
represented that was not identical to channel id is dead and gone, as is
the concept of "portal number".  Every time you see cell-index just
pretend you are seeing fsl,qman-channel-id.

cell-index is *not* defined as anything to do with the portal address.

> > > The only thing cell-index indicates is the offset of the portal in the
> > > QMan address space.
> > 
> > cell-index has been redefined to not mean that at all.  It now only means
> > channel ID.  We can do this because the value happens to be the same for all
> > existing SoCs (and we should be sure to avoid putting things into the SDK for
> > the aforementioned ARM chips that are contrary to the new definition).
> > 
> 
> U-boot doesn't dictate the HW architecture and shouldn't - you're
> trying very hard not to admit you changed something you didn't fully
> understand and actually making the system harder to deal with.  At no
> point in time have we ever assumed portal ID would equal channel id. 

cell-index does not mean "portal ID".

> With your logic u-boot is broken because it is using channel ID to
> index into an array that is per portal not per channel.  We shouldn't
> have removed channel-id in the first place - trying to redefine that
> portals = channels is just plain incorrect.

That's not what happened.

> I'm not sure how else to get through to you on this, your base
> assumption is wrong.

Likewise.

-Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
