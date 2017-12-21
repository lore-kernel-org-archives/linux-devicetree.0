From: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patches] [PATCH] RISC-V: Support built-in dtb
Date: Thu, 21 Dec 2017 12:48:05 -0800 (PST)
Message-ID: <mhng-40be3873-485c-4cb6-9990-1137745f5425@palmer-si-x1c4>
References: <CAK8P3a2TVbrnjN00iZe2R_FNzLB+82BkiekPOwqtt6WDgFw30w@mail.gmail.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a2TVbrnjN00iZe2R_FNzLB+82BkiekPOwqtt6WDgFw30w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: zongbox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, albert-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Wesley Terpstra <wesley-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>, patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zong-MUIXKm3Oiri1Z/+hSey0Gg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Dec 2017 12:43:20 PST (-0800), Arnd Bergmann wrote:
> On Thu, Dec 21, 2017 at 9:32 PM, Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org> wrote:
>> On Wed, 20 Dec 2017 01:14:31 PST (-0800), zongbox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>
>> I've added Arnd and Olof, in case they have a bit more perspective here.  If
>> I'm reading this correctly, there isn't an arm or arm64 option to do this.
>> There is an option to built in many DTBs, which makes a lot more sense to me
>> as it doesn't tie the kernel to any one particular implementation.  We'd
>> need a mechanism for picking the DTB that Linux should use.  We've kicked
>> around the idea of:
>>
>> * Having the bootloader always provide a DTB.
>> * Taking a hash of that DTB when booting Linux.
>> * Using that hash to look up DTBs that are built in to Linux.
>>
>> This would allow us to support replacing broken DTBs if they escape into the
>> wild, but would still allow us to have a portable kernel.
>
> Having an embedded DTB is only necessary for platforms with a legacy bootloader
> that doesn't understand DT at all, you should never need that here.
>
> I would suggest to require each bootloader to provide a way to replace the DTB
> with one that gets installed alongside the kernel.

Sounds good to me.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
