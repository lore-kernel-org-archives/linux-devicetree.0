From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC PATCH 2/2] usb: phy: Add platform driver support for ULPI
 PHYs
Date: Thu, 24 Sep 2015 17:43:31 +0800
Message-ID: <20150924094330.GC27847@shlinux2>
References: <1443012873-13757-1-git-send-email-sbhatta@xilinx.com>
 <20150924090629.GA27847@shlinux2>
 <F1B223389110CE49B4CF055ABA2E5D3D78C9BCA7@XAP-PVEXMBX02.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <F1B223389110CE49B4CF055ABA2E5D3D78C9BCA7-4lKfpRxZ5ekkx2a1wsGfbYg+Gb3gawCHQz34XiSyOiE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kishon-l0cyMroinI0@public.gmane.org" <kishon-l0cyMroinI0@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 24, 2015 at 09:21:16AM +0000, Subbaraya Sundeep Bhatta wrote:
> > > +uphy->flags);
> > > +
> > > +	uphy->usb_phy->set_vbus	= usbphy_set_vbus;
> > 
> > When you will call it?
> 
> I am calling it in host.c and otg_fsm.c of Chipidea driver wherever
> regulator_enable/disable is called to control VBUS like below: 
> 
> if (ci->platdata->flags & CI_HDRC_PHY_VBUS_CONTROL) {
>                 if (enable)
>                         ci->usb_phy->set_vbus(ci->usb_phy, 1);
>                 else
>                         ci->usb_phy->set_vbus(ci->usb_phy, 0);
> }
> 
> After these changes host mode and otg modes works fine
> for my case.
> 

Get it, there are several vbus control ways, I may need to consolidate
them, of cos, this is another topic.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
