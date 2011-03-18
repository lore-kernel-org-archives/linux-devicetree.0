From: Andy Green <andy-/Zus8d0mwwtBDgjK7y7TUQ@public.gmane.org>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Fri, 18 Mar 2011 08:38:05 +0000
Message-ID: <4D8319ED.2060703@linaro.org>
References: <20110311165642.GA9996@kroah.com> <20110317232756.GA3148@angua.secretlab.ca> <4D830E97.4010403@linaro.org> <201103180925.30074.arnd@arndb.de>
Reply-To: andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201103180925.30074.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/18/2011 08:25 AM, Somebody in the thread at some point said:
> On Friday 18 March 2011, Andy Green wrote:
>> On 03/17/2011 11:27 PM, Somebody in the thread at some point said:
>>
>>> The patch below also looks right to me.  I believe it also has the
>>> advantage of u-boot already knowing how to update the
>>> local-mac-address property at boot time.
>>
>> In my (tested, working, complete) patch series, I allow platform_data
>> based override of MAC at usbnet level, so all the drivers can benefit
>> from it.
>>
>> Is this not a case of "small thinking" from a Device Tree perspective
>> that Arnd's patch only targets smsc95xx?  Or did I miss some
>> disadvantage to allowing this functional configuration option at usbnet
>> layer?
>
> I think either way works (usb-net or individual drivers), the difference is
> which information you use when both a hardware MAC address and the
> local-mac-address property are used. Your patch uses the local-mac-address,
> mine would use the hardware mac address and only fall back to the
> property if there is no other one.
>
> I still need to look at your patch series, I didn't realize you had
> already sent it.

Yeah I sent it last Saturday.  Whether the MAC override from 
platform_data has precedence over EEPROM info is a matter of taste, in 
this set it overrides even EEPROM.  Note the smsc95xx patch crept into 
the Panda-specific set.

Platform series: http://marc.info/?l=linux-kernel&m=129996915023642&w=2
USB Host + Usbnet series: 
http://marc.info/?l=linux-kernel&m=129996966324111&w=2
Panda-specific: http://marc.info/?l=linux-kernel&m=129997032724779&w=2

-Andy
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
