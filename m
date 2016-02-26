From: Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC 3/3] CMDQ: Mediatek CMDQ driver
Date: Fri, 26 Feb 2016 17:00:30 +0800
Message-ID: <1456477230.17841.2.camel@mtksdaap41>
References: <8A0FDEEF9DBBD140A3857422D81DA20F867B19FD@mtkmbs01n1>
	 <1454479333.11967.12.camel@mtksdaap41>
	 <CAGS+omABD93f3X0pfiFgaxa9Lob2txkJfUUomUvs+hiRkxSuHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omABD93f3X0pfiFgaxa9Lob2txkJfUUomUvs+hiRkxSuHw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Josh-YC Liu <josh-yc.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Glory Hung <glory.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob
List-Id: devicetree@vger.kernel.org

On Wed, 2016-02-03 at 14:40 +0800, Daniel Kurtz wrote:
> > Hi Dan,
> >
> > Thanks for your comment.
> > This solution looks good to me.
> > I will change it as your suggestion.
> >
> > But, I have a question about 'mask out the provided *device virtual*
> > address'.
> > Are lower 16-bits (or 24-bits for JUMP op) of device virtual address the
> > same as device physical address?
> 
> I'm not sure.  But I doubt it we can rely on this.
> My guess would be that the ioremap only preserves the lower 12 bits
> (4k page size).
> 
> > If not, we still need to pass in physical address into CMDQ driver.
> 
> Or, instead of the iommu/slot approach, we can just provide a
> registration function for the gce driver.
> Each gce consumer could then have a simple gce node, with no slot/address:
> 
>   mediatek,gce = <&gce>;
> 
> Then on probe, the gce consumer could pass in its (struct device *) to
> gce_register_device().  gce_register_device() could then access the
> device's of_node to extract its physical address range, and look up
> its physical address in its table of per-soc of
> "device_address:gce_subsys_address" entries.  If the physical address
> is in a valid subsys ranges, the gce_register_device would cache the
> subsys address, and an offset in a (struct gce_consumer).
> gce_register_device() could then add this struct to a struct list_head
> of gce_consumers, and finally return a pointer to it back to the
> caller.
> 
> Later, the gce consumer could pass in ths (struct gce_consumer *) when
> make gce calls, along with the *offset* (not the physical address or
> virtual address) for the register that it wishes to access.  Then the
> gce driver can simply use the gce_consumer->subsys entry to create a
> gce address from the passed in offset.
> 
> This will keep the binding very simple, and would remove the need to
> convert from device virtual to physical addresses by the gce consumer,
> but require a little more per-gce-consumer setup.
> 
> -Dan

Hi Dan,

When I try to implement this comment, I realize the only benefit from
this comment is to wrap physical address.

Recall from my previous reply: gce address = subsys + valid low bits.
So, CMDQ driver still need to do "(Base + offset) & valid mask" to get
gce valid low bits.
Current implementation let display driver do "base + offset".
This comment just transfers this calculation from display driver to CMDQ
driver.

However, this comment will let CMDQ interface (behavior) become more
complicated, e.g. gce_register_device(), struct gce_consumer, and int
cmdq_rec_write(struct cmdq_rec *handle, u32 value, struct gce_consumer
*consumer, u32 offset)

Do you think it is worth to do this effort to wrap physical address?

Thanks,
HS Liao


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
