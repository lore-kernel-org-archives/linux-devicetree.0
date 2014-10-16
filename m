From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 1/3] dma: at_xdmac: creation of the atmel eXtended
 DMA Controller driver
Date: Thu, 16 Oct 2014 21:42:33 +0530
Message-ID: <20141016161233.GJ1638@intel.com>
References: <1412175565-810-1-git-send-email-ludovic.desroches@atmel.com>
 <1412175565-810-2-git-send-email-ludovic.desroches@atmel.com>
 <20141015133004.GP1638@intel.com>
 <20141016141048.GC2367@ldesroches-Latitude-E6320>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141016141048.GC2367@ldesroches-Latitude-E6320>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 16, 2014 at 04:10:48PM +0200, Ludovic Desroches wrote:
> > This is pretty odd, I dont see a reason why we can have proper case values
> > and converted ones. It would have made sense if we use this for conversion
> > but in case values in quite puzzling
> > 
> > > +	case 1:
> > > +		csize = AT_XDMAC_CC_CSIZE_CHK_2;
> > and looking at values this can be ffs(maxburst) - 1 for valid cases
> 
> Yes I can return ffs(maxburst) - 1 for valid cases.
> 
> > > +		break;
> > > +	case 2:
> > > +		csize = AT_XDMAC_CC_CSIZE_CHK_4;
> > > +		break;
> > > +	case 3:
> > > +		csize = AT_XDMAC_CC_CSIZE_CHK_8;
> > > +		break;
> > > +	case 4:
> > > +		csize = AT_XDMAC_CC_CSIZE_CHK_16;
> > > +		break;
> > > +	default:
> > > +		csize = AT_XDMAC_CC_CSIZE_CHK_1;
> > why?
> 
> Because some devices don't set maxburst, for example, our serial driver.
Then pls send a patch against that as well. returniung error here will
ensure that they fix that as well

> > > +
> > > +		prev = desc;
> > > +		if (!first)
> > > +			first = desc;
> > > +
> > > +		dev_dbg(chan2dev(chan), "%s: add desc 0x%p to descs_list 0x%p\n",
> > > +			 __func__, desc, first);
> > > +		list_add_tail(&desc->desc_node, &first->descs_list);
> > > +	}
> > > +
> > > +	spin_unlock_bh(&atchan->lock);
> > > +
> > > +	first->tx_dma_desc.cookie = -EBUSY;
> > why are you init cookie here
> 
> Inspired by other driver. What is the right place so?
You dont. Cookie will be set to correct value when the descriptor is
submitted

> > For memcpy why should we need slave_config. The system memory source and
> > destination width could be assumed to relastic values and then burst sizes
> > maxed for performance. These values make more sense for periphral where we
> > have to match up with the periphral
> 
> I don't tell I need slave_config. We have already talked about this. I don't
> see the problem. It is only a comment, a reminder. The only information
> I may need, one day, is the direction because we have to set src and dst
> interfaces. At the moment, all our products are done in a way nand flash
> and DDR are on the same interface so we don't have to care about
> direction.
> Since we don't have the direction, two solutions:
> - remember this limitation for next products, that's why there is this reminder,
> - change our nand driver in order to see nand as a peripheral instead of
>   a memory. 
I think treating NAND as memory may not be a right model. It should be
treated as periphral with incrementing and decrementing address value. That
way you should be able to set the right properties for it.

The system memory copy is right model for memcpy.

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
