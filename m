From: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 6/6] ACPI: import watchdog info of GTDT into
 platform device
Date: Tue, 26 May 2015 22:08:14 -0500
Message-ID: <5565351E.6050708@codeaurora.org>
References: <=fu.wei@linaro.org> <1432548193-19569-1-git-send-email-fu.wei@linaro.org> <1432548193-19569-7-git-send-email-fu.wei@linaro.org> <55642EA8.5000003@linaro.org> <5564A0C7.1090306@codeaurora.org> <5565336D.6040904@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5565336D.6040904-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org, linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hanjun Guo wrote:
>> I don't agree with this.  The GTDT should be parsed even if there's no
>> watchdog driver compiled for this kernel.  There are no other #ifdefs in
>> this file.
>
> So what's the point of parse GTDT and alloc memories for it if there
> is no watchdog driver compiled for the kernel?

I don't think it's normal policy to generate a platform only if one 
specific driver is enabled.

 > will the module insmod
> later even if the CONFIG_ARM_SBSA_WATCHDOG=n?

I think that actually can work, but it's not a good reason by itself.

> OK, that's good point. but what I proposed is some hint to which driver
> will use the data prepared in this file, we can easily understand it
> in this patchset, but if just review the code in this fiel, I think
> people will be confused without detail comments.

All anyone needs to is

	git grep "sbsa-gwdt"

And you'll find the driver.

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
