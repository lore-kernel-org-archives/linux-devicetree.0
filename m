From: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: atlas7: use general dt-binding for hwspinlock
Date: Mon, 1 Jun 2015 13:31:14 +0800
Message-ID: <CAGsJ_4xGHQ4aqrejr7WwQKbn_7Mgfxv7ntxqYVxPzQGNW+KBPw@mail.gmail.com>
References: <1432628911-18555-1-git-send-email-21cnbao@gmail.com>
 <1432628911-18555-3-git-send-email-21cnbao@gmail.com> <5567890D.30906@ti.com> <CAJAp7OjjzMCGQSRx8c3f5D7uCnWUesZ5Sx8X8=BEjAuAxBqOYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJAp7OjjzMCGQSRx8c3f5D7uCnWUesZ5Sx8X8=BEjAuAxBqOYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Cc: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DL-SHA-WorkGroupLinux <workgroup.linux-kQvG35nSl+M@public.gmane.org>, Wei Chen <Wei.Chen-kQvG35nSl+M@public.gmane.org>, Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-05-29 23:50 GMT+08:00 Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>:
> On Thu, May 28, 2015 at 2:30 PM, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org> wrote:
> [..]
>>>                               reg = <0x13240000 0x00010000>;
>>
>> An unrelated question here, why the reg is same for all the child nodes
>> of the  parent ipc node? If this is partitioned properly, then the
>> driver can be simplified a bit by using platform_get_resource and
>> devm_ioremap_resource?
>>
>
> Good catch Suman, I missed that.
>
> Barry, if these blocks represents various functionalities of the same
> hw block then you should consider moving them to be part of a
> simple-mfd.

the hwspinlock and the IPC, which works for kicking interrupts between
multiple cores in the SoC,  are in one bus node but there is no
overlapping register.
hwspinlock:
begin from 0x13240000 + 0x400
IPC:
begin from 0x13240000, and end at begin from 0x13240000 + 0x400 - 0x4 ?

so i guess we can refine the dts memory region to avoid MFD?

>
> Regards,
> Bjorn

-barry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
