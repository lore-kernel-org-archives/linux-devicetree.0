From: Andy Green <andy-/Zus8d0mwwtBDgjK7y7TUQ@public.gmane.org>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Fri, 18 Mar 2011 23:33:09 +0000
Message-ID: <4D83EBB5.1010705@linaro.org>
References: <20110311165642.GA9996@kroah.com> <201103181600.09877.arnd@arndb.de> <4D839BCD.6030202@linaro.org> <201103182106.13888.arnd@arndb.de> <4D83CF8C.3020605@linaro.org> <20110318232553.GA11422@opensource.wolfsonmicro.com>
Reply-To: andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110318232553.GA11422-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/18/2011 11:25 PM, Somebody in the thread at some point said:
> On Fri, Mar 18, 2011 at 09:33:00PM +0000, Andy Green wrote:
>
>> Well: Greg was also reduced to explaining that device renaming in
>> userland was decided "a long time ago".  It's not argumentation, it is
>> an appeal to an alleged tradition.
>
> The story with device renaming is fairly simple - nobody could agree on
> what the ideal names should be and different userlands ended up wanting
> different things so rather than try to keep everyone happy the kernel
> picked the simplest policy possible and let userland override it to its
> heart's content.
>
>> You think that striving away to create this Device Tree description of a
>> specific board and maintaining it in a bootloader is LESS work somehow
>> that registering platform devices in an array in the board definition
>> file?  I think not.
>
> It's more the fact that it can be distributed separately to the kernel
> which reduces the pressure to mainline the basic board description stuff
> for ongoing maintinance.

However that was not the claim.

The claim was that there is a burden with platform_data that it is 
"inflexible", which I dealt with separately, and -->

''...you have to write code for each new board you want to support,
something that we've generally moved away from in Linux a decade
ago. ''

You very much "have to write code for each new board you want to 
support" with Device Tree, so this point is bogus when contrasting the 
attributes of platform_data against Device Tree.

-Andy
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
