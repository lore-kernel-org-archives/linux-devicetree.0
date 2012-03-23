From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] USB: Add DT probing support to ehci-spear and ohci-spear
Date: Fri, 23 Mar 2012 09:00:01 +0100
Message-ID: <201203230900.02280.sr@denx.de>
References: <1332431402-20606-1-git-send-email-sr@denx.de> <4F6BF275.9040007@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F6BF275.9040007-qxv4g6HH51o@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, deepak sikri <deepak.sikri-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Viresh,

On Friday 23 March 2012 04:48:05 Viresh Kumar wrote:
> On 3/22/2012 9:20 PM, Stefan Roese wrote:
> > +static struct of_device_id spear_ohci_id_table[] __devinitdata = {
> > +	{ .compatible = "st,spear600-ohci", },
> 
> Hi Stefan,
> 
> I have this question for other drivers (fsmc, stmmac...) as well:
> Why do we name it spear600-ohci and not spear-ohci?
> Because i believe we have same version of USB on all SPEAr SoCs.

There could be differences between the IP cores integrated into the SoCs. I 
only tested on spear600, so thats what I integrated into the drivers. While 
supporting more SoCs (SPEAr300 etc) to those drivers, you should add the 
specific compatible properties to the lists.

If the IP core doesn't differ between those SoCs, then it might make sense to 
change this property to something more general, like "st,spear-ohci" (etc). 
Not 100% sure though. Other DT experts might have more insight here.

Thanks,
Stefan
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
