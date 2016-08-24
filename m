From: "Nayak, Rajendra" <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 0/5] dts patches for qcom tsens support
Date: Wed, 24 Aug 2016 17:48:43 +0530
Message-ID: <57BD90A3.3000106@codeaurora.org>
References: <1471411128-4002-1-git-send-email-rnayak@codeaurora.org>
 <20160817193340.GA18215@hector.attlocal.net>
 <20160824102256.GA14048@harukaze>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160824102256.GA14048@harukaze>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paolo Pisati <p.pisati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 8/24/2016 3:52 PM, Paolo Pisati wrote:
> On Wed, Aug 17, 2016 at 02:33:40PM -0500, Andy Gross wrote:
>> On Wed, Aug 17, 2016 at 10:48:43AM +0530, Rajendra Nayak wrote:
>>> Hey Andy,
>>>
>>> This is a respin of v2 with some minor fixes pointed out by Rob.
>>> Please pull these in for 4.9
>>>
>>> Thanks,
>>> Rajendra
>>
>> I pulled these in.
>
> Did you try to read the content of the qfprom from userspace?

Hi, no I haven't tried it, I can give it a try tomorrow when I
have access to my board and see whats going wrong, but I did
look at Andys for-next and the defconfig still does not have
either nvmem or qcom-qfprom drivers enabled.
Did you manually enable them? or are you seeing this with the drivers 
still disabled?

>
> $ uname -a
> Linux dragon410c 4.8.0-rc1+ #6 SMP PREEMPT Wed Aug 24 11:11:02 CEST 2016 aarch64
> aarch64 aarch64 GNU/Linux
> $ lsmod
> Module                  Size  Used by
> nvmem_qfprom           16384  0
> nvmem_core             24576  1 nvmem_qfprom
> $ ls -la /sys/bus/nvmem/devices/
> total 0
> drwxr-xr-x 2 root root 0 Aug 24 10:17 .
> drwxr-xr-x 4 root root 0 Aug 24 10:15 ..
> lrwxrwxrwx 1 root root 0 Aug 24 10:17 qfprom0 ->
> ../../../devices/platform/soc/5c000.qfprom/qfprom0
> $ cat /sys/bus/nvmem/devices/qfprom0/nvmem
>
> [spontaneous reboot]
>
> This using agross's for-next tree as of today ("54ba896 Merge branch
> 'arm64-defconfig-for-4.9' into all-for-4.8") and defconfig.
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
