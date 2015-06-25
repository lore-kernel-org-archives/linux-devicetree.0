From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv5 2/2] mailbox: Adding driver for Xilinx LogiCORE IP mailbox.
Date: Thu, 25 Jun 2015 13:12:38 +0200
Message-ID: <558BE226.2060907@xilinx.com>
References: <1435082402-29239-1-git-send-email-moritz.fischer@ettus.com>
	 <1435082402-29239-3-git-send-email-moritz.fischer@ettus.com>
	 <1435178205.4528.77.camel@tiscali.nl> <558BA5D4.8060903@xilinx.com>
	 <1435217491.16792.5.camel@tiscali.nl> <558BB217.5080200@xilinx.com>
 <1435224937.16792.19.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435224937.16792.19.camel-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/25/2015 11:35 AM, Paul Bolle wrote:
> On Thu, 2015-06-25 at 09:47 +0200, Michal Simek wrote:
>> It has to be platform_device somewhere for sure.
>> In past we had folder in arch/microblaze/platform folder.
>> Currently you can add this code to for example
>> arch/microblaze/kernel/platform.c
>>
>> But as I said I don't think it is really important. There will be a 
>> lot
>> of others drivers in the kernel which can be used as platform drivers
>> but you are not able to find out platform_device for it.
> 
> Because, like probably happens with this driver, the OF infrastructure
> makes sure the .probe and .remove functions will eventually called?
> 
>> The important part is that driver can work as is.
> 
> Sure.
> 
> But I was talking about the MODULE_ALIAS() macro. Trivial as it is,
> since I still don't see where a "MODALIAS=platform:xilinx-mailbox"
> uevent could come from I still don't see the point of this line. As I
> asked in my first message: what breaks if this line is dropped?

TBH probably nothing because all will just use OF because it is just
common for a long time on all xilinx platforms.

> 
>> Also it is quite common that users create own BSP for their custom
>> boards but they don't push it to mainline.
> 
> I can't recall what BSP means. Anyhow, why should we care about boards
> not pushed into mainline?

I am not the right person to answer this in general. For SoC tree I
maintain I tend to accept these patches if they are useful and
definitely don't want to have support for various platforms. But having
shared drivers is fine.

For this case if Moritz tested OF and platform device probes and both
work I am fine to keep it there. If only OF part is tested then I would
remove this line.

Thanks,
Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
