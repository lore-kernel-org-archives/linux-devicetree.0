From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/7] drm/bridge: Support hotplugging panel-bridge.
Date: Thu, 22 Jun 2017 14:41:50 +0200
Message-ID: <20170622144150.1663f649@bbrezillon>
References: <20170615204130.19255-1-eric@anholt.net>
        <20170615204130.19255-2-eric@anholt.net>
        <777ee1b1-e5ce-ea29-8a48-f792354a22d1@codeaurora.org>
        <871sqkouvr.fsf@eliezer.anholt.net>
        <8e148170-b626-b426-3c94-b93d2746f4ce@codeaurora.org>
        <871sqe7ei0.fsf@eliezer.anholt.net>
        <CA+M3ks6T5aXjVuiYirw+j0UMt-x6tPjoeBXfOTAH8DXQNW-5sA@mail.gmail.com>
        <dd33044e-46d6-6f33-1011-b0bc343ddc96@codeaurora.org>
        <CGME20170622092354epcas1p2eb523cbfb64a4da2dc0b188df760d493@epcas1p2.samsung.com>
        <20170622112332.7ec7b65c@bbrezillon>
        <7ce4f741-309a-2eaa-381c-8033f089651a@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7ce4f741-309a-2eaa-381c-8033f089651a-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 22 Jun 2017 14:29:07 +0200
Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:

> On 22.06.2017 11:23, Boris Brezillon wrote:
> > On Thu, 22 Jun 2017 13:47:43 +0530
> > Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> >  
> >> On 06/22/2017 01:20 PM, Benjamin Gaignard wrote:  
> >>> 2017-06-20 19:31 GMT+02:00 Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>:    
> >>>> Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:
> >>>>    
> >>>>> On 06/16/2017 08:13 PM, Eric Anholt wrote:    
> >>>>>> Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:
> >>>>>>    
> >>>>>>> On 06/16/2017 02:11 AM, Eric Anholt wrote:    
> >>>>>>>> If the panel-bridge is being set up after the drm_mode_config_reset(),
> >>>>>>>> then the connector's state would never get initialized, and we'd
> >>>>>>>> dereference the NULL in the hotplug path.  We also need to register
> >>>>>>>> the connector, so that userspace can get at it.
> >>>>>>>>    
> >>>>>>> Shouldn't the KMS driver make sure the panel-bridge is set up before
> >>>>>>> drm_mode_config_reset? Is it the case when we're inserting the
> >>>>>>> panel-bridge driver as a module?
> >>>>>>>
> >>>>>>>
> >>>>>>> All the connectors that have been added are registered automatically
> >>>>>>> when drm_dev_register() is called by the KMS driver. Registering a
> >>>>>>> connector in the middle of setting up our driver is prone to race
> >>>>>>> conditions if the userspace decides to use them immediately.    
> >>>>>> Yeah, this is fixing initializing panel_bridge at DSI host_attach time,
> >>>>>> which in the case of a panel module that creates the DSI device
> >>>>>> (adv7533-style, like you said I should use as a reference) will be after
> >>>>>> drm_mode_config_reset() and drm_dev_register().    
> >>>>> Okay. In the case of the msm kms driver, we defer probe until the
> >>>>> adv7533 module is inserted, only then we proceed to drm_mode_config_reset()
> >>>>> and drm_dev_register(). I assumed this was the general practice followed by
> >>>>> most kms drivers. I.,e the kms driver defers probe until all connector
> >>>>> related modules are inserted, and only then proceed to create a drm device.    
> >>>> The problem, though, is the panel driver needs the MIPI DSI host to
> >>>> exist to call mipi_dsi_device_register_full() during the probe process.
> >>>> The adv7533 driver gets around this by registering the DSI device in the
> >>>> bridge attach step, but drm_panel doesn't have an attach step.    
> >> I'm not sure how we can get around this. We had discussion about this on irc
> >> recently, but couldn't come up with a good conclusion. We could come up with a
> >> panel_attach() callback to make it similar to bridges, but that's just us avoiding
> >> the real issue.  
> > How about making DSI dev registration fully asynchronous, that is, DSI
> > devs declared in the DT under the DSI host node will be
> > registered/attached at probe time, and devs using another control bus
> > (like the adv7533 controller over i2c) will be registered afterwards.
> >
> > That implies moving the drm_brige registration logic outside of the DSI
> > host ->probe() path. The idea would be to check if all devs connected
> > to the DSI bus are ready at dsi_host->attach() time. If they are, we
> > can finally register the XXX -> DSI bridge. If they're not (because
> > some devs connected to the DSI bus have not been probed yet), then we
> > do not register the drm_bridge and wait for the next dsi_host->attach()
> > event.  
> 
> I guess you assumes that dsi-host knows all devs connected to it, thanks to:
> - subnodes of the host - ie. devices controlled via dsi bus,
> - graph links from host ports/endpoints - ie. devices controlled by
> other buses, for example adv7533.

Yep, but I think that's already a requirement when populating devices
with the OF graph method (if one of the DSI output endpoint does not
have a drm_bridge/panel attached to it, the DSI host driver returns
-EPROBE_DEFER).

> 
> I would separate both abstractions to make it more clear:
> 1. MIPI bus should be registered early - to allow create/bind devices on it,

Exactly.

> 2. drm_bridge should be registered only if all required sinks
> (bridges/panels) are registered.

That's true, until we find a solution to support add DRM bridge hotplug.

> 
> First point seems OK, I am not sure about the 2nd one - if used
> consistently, it would require building pipeline from sink to source.

Yes.

> By the way is there any pipeline with two consecutive external bridges
> in the mainline?

I don't know if it exists in mainline, but I had to do that on my FPGA
platform when developing/testing Cadence DSI host driver. I had the
following chain and it worked just fine:

CRTC -> DPI encoder -> DPI to DSI bridge -> DSI to DPI bridge -> DPI to HDMI bridge (adv7511) -> HDMI connector

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
