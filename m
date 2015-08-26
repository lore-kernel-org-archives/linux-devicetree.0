From: vikas <vikas.manocha-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash
 Controller.
Date: Wed, 26 Aug 2015 16:05:07 -0700
Message-ID: <55DE4623.8090508@st.com>
References: <1440148851-14621-1-git-send-email-marex@denx.de> <1440148851-14621-2-git-send-email-marex@denx.de> <55DCE7AE.5070501@st.com> <201508260819.02535.marex@denx.de> <55DDDF99.4030701@st.com> <20150826180631.GS81844@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150826180631.GS81844-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 08/26/2015 11:06 AM, Brian Norris wrote:
> On Wed, Aug 26, 2015 at 08:47:37AM -0700, vikas wrote:
>> On 08/25/2015 11:19 PM, Marek Vasut wrote:
>>> On Wednesday, August 26, 2015 at 12:09:50 AM, vikas wrote:
>>>> the patch failed to apply, please rebase it to master.
>>>
>>> it's based on -next, I'm sure you can fix trivial conflicts yourself if you
>>> need to apply it elsewhere. Do you have any other review comments ?
>>
>> Always rebase the patch on master.
> 
> Development works against -next, not Linus' master:
> 
> https://lwn.net/Articles/289013/
> 
> This is also noted here:
> 
> https://www.kernel.org/doc/man-pages/linux-next.html
> 
> Technically, you should work off of the respective subsystem tree (see
> entries in MAINTAINERS). For MTD, this is also documented here:
> 
> http://linux-mtd.infradead.org/source.html
> 
> In the end, most MTD patches get applied to l2-mtd.git, but l2-mtd.git
> and linux-next.git should provide pretty similar MTD patching
> experiences, as the former is included in the latter.

Thanks Brian for these useful links, appreciate it.

Rgds,
Vikas

> 
> Regards,
> Brian
> .
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
