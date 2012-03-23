From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] USB: Add DT probing support to ehci-spear and ohci-spear
Date: Fri, 23 Mar 2012 09:17:16 -0500
Message-ID: <4F6C85EC.4070309@gmail.com>
References: <1332431402-20606-1-git-send-email-sr@denx.de> <4F6BF275.9040007@st.com> <201203230900.02280.sr@denx.de> <4F6C2F25.8030402@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F6C2F25.8030402-qxv4g6HH51o@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Cc: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Deepak SIKRI <deepak.sikri-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/23/2012 03:07 AM, Viresh Kumar wrote:
> On 3/23/2012 1:30 PM, Stefan Roese wrote:
>> There could be differences between the IP cores integrated into the SoCs. I 
>> only tested on spear600, so thats what I integrated into the drivers. While 
>> supporting more SoCs (SPEAr300 etc) to those drivers, you should add the 
>> specific compatible properties to the lists.
> 
> Ya. That's what i was expecting.
> 
>> If the IP core doesn't differ between those SoCs, then it might make sense to 
>> change this property to something more general, like "st,spear-ohci" (etc). 
>> Not 100% sure though. Other DT experts might have more insight here.
> 
> Ok. FSMC version is same for 3xx and 6xx. Is different for 13xx.
> But driver is capable of detecting the version itself and so we might
> go ahead with "st,spear-fsmc there"
> 
> SMI, EHCI and OHCI have exactly the same version for all three families of SoC's.
> So, we must better name them "st,spear-***"

No, it's better to be safe and be more specific. You have to think of it
as if you created the DT entries as the h/w came out. Define the
compatible string in terms of the 1st version. Then if the 2nd SOC
happens to have the same version, you can re-use the compatible string
and not change the driver.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
