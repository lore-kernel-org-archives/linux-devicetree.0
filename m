From: Arun Ramamurthy <arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] phy: usbphy: Add dt documentation for Broadcom Cygnus
 USB PHY driver
Date: Tue, 17 Feb 2015 13:05:50 -0800
Message-ID: <54E3AD2E.8050902@broadcom.com>
References: <1424200821-16368-1-git-send-email-arun.ramamurthy@broadcom.com> <8242260.cl4QTECoeX@wuerfel> <54E39DF1.50409@broadcom.com> <2797126.uqvyZJisPk@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2797126.uqvyZJisPk@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 15-02-17 12:53 PM, Arnd Bergmann wrote:
> On Tuesday 17 February 2015 12:00:49 Arun Ramamurthy wrote:
>> Arnd, I patched the ehci and ohci driver to accept multiple phys so they
>> require different names and cannot both be "usb". That patch was
>> accepted by Alen Stern but I did not update the bindings documentation.
>> I will send out another patch for that. Could we go with the naming
>> scheme of "usb" + "p" + port number or do you have other suggestions?
>
> I don't have a good idea, but I think it would be best if the first
> phy could remain named "usb" for compatibility with the existing binding.
>
The patch was written in a way that all the existing and new drivers can
continue to use "usb" if they are using only one phy so that we remain 
compatible. The names need to be different only if more than one phy is 
specified. In such cases i don't think the first phy should be "usb" as 
it would be confusing to have
	phy-names = "usb","usbp1"
Should I run this by Alan Stern?
> What is the reason for having two phys in your case? Are these
> identical phy devices connected to a single controller or do they
> server different purposes?
>
Yes, we have three identical phys connected to a single host controller 
and one of the phys is also connected to the device controller
> 	Arnd
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
