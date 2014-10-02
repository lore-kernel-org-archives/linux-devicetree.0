From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: ath10k: calibration data through Device Tree?
Date: Thu, 2 Oct 2014 14:29:15 +0100
Message-ID: <20141002132914.GN5788@leverpostej>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87tx3mmx4s.fsf-HodKDYzPHsUD5k0oWYwrnHL1okKdlPRT@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

> ath10k is a wireless driver for Qualcomm Atheros 802.11ac hardware and
> located in drivers/net/wireless/ath/ath10k/. Currently it only supports
> PCI devices.
> 
> Some of the devices store the calibration data to the host flash and the
> bootloader reads the data from the flash. And now we need a method to
> deliver the calibration data from bootloader to ath10k. 

What does this calibration data consist of?

What happens if you don't have the calibration data? Is it a critical
requirement for the use of the device, or does its absence simply result
in degraded performance?

What do you do on non-DT systems? Where does the information come from
in that case?

I'm somewhat puzzled as to why a discoverable PCI device would require
non-discoverable information to use.

> * The calibration data is now 2116 bytes, in the future it might be
>   longer. The data is unique for each radio and is created at the
>   factory.

Why would this change in future? Who is in charge of providing this
information, and deciding upon the format thereof?

> * ath10k must be able to reliably map the PCI device (=radio) to the
>   correct calibration data. Maybe with using PCI bus and slot numbers?

I guess we'd have to do something along those lines.

I'd like to get a better understanding of the problem before we start
figuring out how to pass an arbitrary blob of information around.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
