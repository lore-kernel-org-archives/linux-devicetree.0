From: Andy Green <andy-/Zus8d0mwwtBDgjK7y7TUQ@public.gmane.org>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Fri, 18 Mar 2011 07:42:36 +0000
Message-ID: <4D830CEC.4040608@linaro.org>
References: <20110311165642.GA9996@kroah.com> <20110317214042.GQ31411@opensource.wolfsonmicro.com> <20110317214736.GA29014@kroah.com> <201103172333.01474.arnd@arndb.de> <20110317225328.GB31581@kroah.com> <4D8296D1.9060106@linaro.org> <20110317232503.GA14561@kroah.com>
Reply-To: andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110317232503.GA14561-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/17/2011 11:25 PM, Somebody in the thread at some point said:
> On Thu, Mar 17, 2011 at 11:18:41PM +0000, Andy Green wrote:
>> On 03/17/2011 10:53 PM, Somebody in the thread at some point said:
>>
>>>> Not tested!
>>>>
>>>> Signed-off-by: Arnd Bergmann<arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>
>>> <snip>
>>>
>>> Very nice.
>>>
>>> Andy and Mark, would this patch work for you?
>>
>> You do realize this untested patch depends on 13 year old vapour
>> definition of general usb device tagging in Device Tree that does
>> not exist yet?
>
> As you get to create your own device tree for your board, it will then
> exist, right?

No, if you read Arnd's post you will find Device Tree does not support 
targeting USB devices yet, and if you further read the 1998 document he 
points to as the basis of actually implementing it, it seems to me at 
least it'll be a little project yet to do that on Linux side.

That is why his "very nice" patch is untested, it literally doesn't work 
as things stand so he is unable to test it.  Yes, you will also need a 
device tree for your board.  When you ask if it "works for me", the 
answer is it doesn't work for me, the author nor anybody else.

The Device Tree guys at first trashing and then co-opting this RFC has 
the tendency to make me sound like a Device Tree basher.  Actually I 
don't think it's evil so long as it reflects the reality and necessity 
that it is completely optional, there is an elephant in the room about 
that and how it competes with platform_data.  At the moment Device Tree 
is "all things to all men", and few things stay like that for long.

-Andy
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
