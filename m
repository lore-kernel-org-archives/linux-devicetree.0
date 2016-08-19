From: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: keystone-k2g: Add Message Manager node
Date: Fri, 19 Aug 2016 18:03:14 -0500
Message-ID: <CAGo_u6opv1nGTXeP0RKQVFDUNmQbRDTXsucDjyoN9bSbG1SGoQ@mail.gmail.com>
References: <20160819204748.21529-1-nm@ti.com> <e39f772a-8a30-4c69-fdd9-8b8a639207a6@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e39f772a-8a30-4c69-fdd9-8b8a639207a6-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dt list <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Santosh,

On Fri, Aug 19, 2016 at 3:55 PM, Santosh Shilimkar
<santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:
>>
> Patch looks good Nishant. Do you want to send a patch to update
> the config to enable TI_MESSAGE_MANAGER and MAILBOX ? Are we missing
> anything upstream yet to enable these ?

for message manager, nothing other than the dts(this patch) and
defconfig changes. I just finished putting the stack together and
re-testing things and they work good. will send the defconfig in a few
mins.

---
Regards,
Nishanth Menon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
