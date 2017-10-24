From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] phy: add combo phy driver for HiSilicon STB SoCs
Date: Tue, 24 Oct 2017 23:12:04 +0800
Message-ID: <20171024151202.GF6403@dragon>
References: <1508042882-20922-1-git-send-email-shawnguo@kernel.org>
 <20171023222850.ecavz6jm2mnoplea@rob-hp-laptop>
 <20171024064108.GC6403@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171024064108.GC6403@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 24, 2017 at 02:41:09PM +0800, Shawn Guo wrote:
> > > +HiSilicon STB PCIE/SATA/USB3 PHY
> > > +
> > > +Properties:
> > > +- compatible: Should be "hisilicon,hi3798cv200-combphy"
> > > +- #phy-cells: Should be 1.  The cell number is used to select the phy mode:
> > > +	0: PCIe mode
> > > +	1: USB 3.0 mode
> > > +	2: SATA mode
> > > +- clocks: The phandle to clock provider and clock specifier pair.
> > > +- resets: The phandle to reset controller and reset specifier pair.
> > > +- hisilicon,peripheral-syscon: The phandle to the peripheral controller.
> > 
> > Could just be a child of the syscon instead?
> 
> It should be doable, but I do not fully understand the benefits of doing
> that.

Okay, I see that having it be child of syscon can save us this
hisilicon,peripheral-syscon property, as the parent will just be the
syscon device.  Also, if there is any register space only for phy
device, we can define them as regular 'reg' property.

Let me know if I misunderstood your comment here.  Otherwise I will
rework both combphy and inno-usb-phy patches to adopt your suggestion
in v3 posting.  Thanks.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
