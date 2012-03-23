From: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH] USB: Add DT probing support to ehci-spear and ohci-spear
Date: Fri, 23 Mar 2012 13:37:01 +0530
Message-ID: <4F6C2F25.8030402@st.com>
References: <1332431402-20606-1-git-send-email-sr@denx.de> <4F6BF275.9040007@st.com> <201203230900.02280.sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201203230900.02280.sr-ynQEQJNshbs@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, Deepak SIKRI <deepak.sikri-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3/23/2012 1:30 PM, Stefan Roese wrote:
> There could be differences between the IP cores integrated into the SoCs. I 
> only tested on spear600, so thats what I integrated into the drivers. While 
> supporting more SoCs (SPEAr300 etc) to those drivers, you should add the 
> specific compatible properties to the lists.

Ya. That's what i was expecting.

> If the IP core doesn't differ between those SoCs, then it might make sense to 
> change this property to something more general, like "st,spear-ohci" (etc). 
> Not 100% sure though. Other DT experts might have more insight here.

Ok. FSMC version is same for 3xx and 6xx. Is different for 13xx.
But driver is capable of detecting the version itself and so we might
go ahead with "st,spear-fsmc there"

SMI, EHCI and OHCI have exactly the same version for all three families of SoC's.
So, we must better name them "st,spear-***"

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
