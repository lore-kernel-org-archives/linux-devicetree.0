From: Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 00/23] usb gadget update for OTG 2.0
Date: Thu, 23 Jul 2015 10:45:22 +0800
Message-ID: <CACCg+XMgqcCM1eTsjDDzD9YTPy=mqCZ1EXcTj70qvddLB0xGCQ@mail.gmail.com>
References: <1436426340-18477-1-git-send-email-jun.li@freescale.com>
 <20150722151308.GE10467@saruman.tx.rr.com> <20150722235746.GA8453@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150722235746.GA8453@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jun,

2015-07-23 7:57 GMT+08:00 Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>:
> On Wed, Jul 22, 2015 at 10:13:08AM -0500, Felipe Balbi wrote:
>> On Thu, Jul 09, 2015 at 03:18:37PM +0800, Li Jun wrote:
>> > Change for v7:
>> > - Free otg descriptor when failure of bind in patch 21, 22, 23.
>> >   add Roger's Reviewed-by for patch 10~20.
>> > - Choose the lesser otg-rev if otg-rev has been set before update by DT,
>> >   remove 0x0300 in supported otg-rev list, and add code comments in case
>> >   otg-rev is not passed in DT in patch 7.
>> > - Fail chipidea usb initilization if DT pass an unsupported otg-rev in patch 8.

[Deleted]

> I will resend the whole series with a small fix and Peter's ACK for
> chipidea part.
>
> Li Jun
>

I'm very appreciate the whole work you've done!
While I'm still during business travel and cannot give any help on this task.
Great thanks for yours works and others suggestions to improve the
whole series of pathces.

-- 
Best regards,
Macpaul Lin
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
