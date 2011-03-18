From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Fri, 18 Mar 2011 09:25:29 +0100
Message-ID: <201103180925.30074.arnd@arndb.de>
References: <20110311165642.GA9996@kroah.com> <20110317232756.GA3148@angua.secretlab.ca> <4D830E97.4010403@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D830E97.4010403-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 18 March 2011, Andy Green wrote:
> On 03/17/2011 11:27 PM, Somebody in the thread at some point said:
> 
> > The patch below also looks right to me.  I believe it also has the
> > advantage of u-boot already knowing how to update the
> > local-mac-address property at boot time.
> 
> In my (tested, working, complete) patch series, I allow platform_data 
> based override of MAC at usbnet level, so all the drivers can benefit 
> from it.
>
> Is this not a case of "small thinking" from a Device Tree perspective 
> that Arnd's patch only targets smsc95xx?  Or did I miss some 
> disadvantage to allowing this functional configuration option at usbnet 
> layer?

I think either way works (usb-net or individual drivers), the difference is 
which information you use when both a hardware MAC address and the
local-mac-address property are used. Your patch uses the local-mac-address,
mine would use the hardware mac address and only fall back to the
property if there is no other one.

I still need to look at your patch series, I didn't realize you had
already sent it.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
