From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Wed, 16 Jul 2014 14:12:46 +0200
Message-ID: <22032517.gk8PRUMaIU@wuerfel>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com> <5615007.cNNjmu3rBK@wuerfel> <cd73d8a384cc4040a0bbc6afc1f3063d@DM2PR0301MB0783.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cd73d8a384cc4040a0bbc6afc1f3063d-Cwg/PA1lyPm/cNt3X/Hc6pwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Antoine =?ISO-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org" <zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org" <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 16 July 2014 11:58:14 Peter Chen wrote:
> > >
> > > Some people wanted the possibility to set the DMA mask as this USB2 CI
> > > driver does not do specific Berlin operation and can be reused later.
> > > I don't particularly need to call dma_coerce_mask_and_coherent() in my
> > > case, as far as I know.
> > 
> > Ok, just remove the call then and rely on the default mask.
> > 
> > > They can maybe give the restrictions they might want to put on the DMA
> > > mask.
> > 
> > If the restriction is from the bus, it should get handled automatically
> > by the device probe as long as the correct dma-ranges property is there
> > (though we have a small bug there at the moment). If there is a variation
> > of ci13xxx that can't do 32-bit DMA, that should use a different
> > compatible string and pass a fixed mask into dma_set_mask_and_coherent()
> > based on the device.
> > 
> 
> Correct me if my below understanding is wrong please.
> 
> For three chipidea users:
> user_a: don't need dma mask
> user_b: dma mask value is dma_mask_b
> user_c: dma mask value is dma_mask_c
> 
> We don't need to call dma_coerce_mask_and_coherent() at generic chipidea
> glue driver, and set dma-ranges as dma_mask_b at user_b's dts, and set
> dma-ranges as dma_mask_c at user_c's dts.

The dma-ranges property doesn't just encode a dma-mask for a device, but
rather how the children of a bus see the memory address space of the parent.

For traditional reasons we default to assuming that a 32-bit dma_mask
is correct, but there may be multiple reasons why this is not true:

- you have a device connected to a bus that is smaller than 32-bit wide
  (and that would have a dma-ranges property describing that)
- you have a device that has fewer than 32 address lines but is connected
  to a 32-bit upstream bus (hence the dma-ranges describe all 32 bit,
  but the driver must set a smaller mask)
- you have a 64-bit capable device connected to a 32-bit bus: the driver
  will ask for a 64-bit mask, but the dma_set_mask() call refuses this
  because of the bus capabilities.
- you have a 64-bit capable device on a 64-bit capable bus, and the
  dma_set_mask call should succeed.

The mask is definitely never "user" specific, but is a combination of
the device you have and the bus it is connected to.

Things get more complicated when you add in IOMMUs to this, but I'm
skipping this for the sake of limiting the confusion.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
