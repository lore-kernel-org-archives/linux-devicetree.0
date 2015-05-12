From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/2] powerpc/qman: Change fsl,qman-channel-id to
 cell-index
Date: Tue, 12 May 2015 17:46:02 -0500
Message-ID: <1431470762.16357.511.camel@freescale.com>
References: <1429311187-19062-1-git-send-email-scottwood@freescale.com>
	 <BN3PR0301MB126796C0EC18EEBB26702C588CD10@BN3PR0301MB1267.namprd03.prod.outlook.com>
	 <1430858734.16357.256.camel@freescale.com>
	 <BN3PR0301MB1267E5A61E7E5BC2789F9E898CDA0@BN3PR0301MB1267.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BN3PR0301MB1267E5A61E7E5BC2789F9E898CDA0-CEkquS/Gb80KBjv5qxT+hJwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pledge Roy-R01356 <roy.pledge-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bucur Madalin-Cristian-B32716 <madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-05-12 at 16:19 -0500, Pledge Roy-R01356 wrote:
> > >
> > > I don't believe this is correct - let me explain the rational why we had two
> > properties in the QMan portal to begin with.
> > >
> > > The two properties in question are cell-index and fsl,qman-channel-id.
> > >
> > > The cell-index property is used in u-boot as an index for the software portal
> > ID when adding the fsl,liodn from the U-boot table into the device tree.
> > 
> > The device tree is not supposed to contain arbitrary software identifiers.
> 
> I agree - this is why the original device tree bindings removed
> cell-index as it can be calculated.
 Unfortunately u-boot relied on
> this value being present so to be backward compatible we don't have a
> way to remove it.  I'm not sure on what the procedure is to change
> things u-boot relies on, 

Generally the procedure is that we don't change it.  It wouldn't be so
bad if using an old U-Boot just meant that datapath doesn't work with
upstream kernels (since that doesn't work now), but a dts that makes
existing U-Boot crash is another matter.

> I personal have always been very uncomfortable with the coupling
> between u-boot and Linux for things like this. 

Same here.  I've said for a while that I thought the dtses should live
in the U-Boot tree due to such coupling (the dtb/kernel interface has
well-defined binding documents; the dts/U-Boot interface doesn't), but
nobody else seemed interested.  It would also be good to minimize new
U-Boot fixups in favor of having the kernel do it, even if it results
in unpleasant code duplication.


> > 
> > > The  fsl,qman-channel-id property is used in Linux and corresponds to
> > > a hardware value that indicates which channel is dedicated to the
> > > software portal.
> > >
> > > While I'm not aware of a current SoC where the channel ID for a
> > > software portal does not match the index (i.e. SWP 0 uses channel 0,
> > > etc.)
> > 
> > Thus there's no backward compatibility issue with redefining cell-index to
> > mean the channel ID.
> 
> Channel IDs do change and are defined when the SoC is created

But for SoCs that already exist, they won't change, right?  We don't
need to care about what existing U-Boot does on new SoCs, since U-Boot
would need to be changed to support the new SoC at all.

>  (look at checks for QMan versions and adjustments for Pool Channel IDs
> in the driver).  If the channel ID for portal 0 ever becomes non zero
> we just end up having to make a mess in the code or reintroduce this
> field.

What defines that portal as "portal 0"?

> > > it is possible that future SoCs could stray from this model, there is
> > > no reason for portal index to equal channel ID at all times.
> > 
> > How can future SoCs dictate how we assign a software-defined identifier?
> > If software wants it to be the same as the channel id, then it will be.
> > 
> > If there is some aspect of the hardware itself (not the documentation) that
> > cell-index currently corresponds to, other than the channel id, please make
> > that clear.
> 
> Channel ID is defined in the SoC RTL - it is not controlled by software
> and it is not a software assigned identifier.  It is not possible for
> SW to set these values.

I said "other than the channel id".  In particular, I was asking about
the concept of "portal index".

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
