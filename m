From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: ls1088a: Add USB support
Date: Thu, 16 Nov 2017 14:58:07 +0800
Message-ID: <20171116065805.GA25176@dragon>
References: <20170913091009.21448-1-yinbo.zhu@nxp.com>
 <20170922065454.GF26358@dragon>
 <VI1PR04MB1262D160BA8625330E32CAF9E9470@VI1PR04MB1262.eurprd04.prod.outlook.com>
 <AM3PR04MB12515DB71B8ACF7422A20244E9280@AM3PR04MB1251.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AM3PR04MB12515DB71B8ACF7422A20244E9280-f56W/S9L6NR31AIMYRlgnc9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yinbo Zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>, Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Catalin Marinas )" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "Will Deacon )" <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Raghav Dogra <raghav.dogra-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 14, 2017 at 08:00:00AM +0000, Yinbo Zhu wrote:
> On Wed, Sep 13, 2017 at 05:10:09PM +0800, yinbo.zhu-3arQi8VN3Tc@public.gmane.org wrote:
> > From: "yinbo.zhu" <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
> > 
> > Fix the issue that usb is not detected on ls1088ardb
> 
> >It's not really about fixing issue but adding support.
> 
> The patch had been tested on upstream 4.14 code, it can fix the issue. 
> > 
> > Signed-off-by: yinbo.zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
> > Signed-off-by: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
> > ---
> 
> >You should better have a version history here to tell what's changed between version.
> 
> >I will add a version history on next v3 patch
> Hi,
> 
> I had modified the code as v4 version, 
> https://patchwork.kernel.org/patch/10027393/
> please check.

You should copy me on that patch, if you expect me to pick it up.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
