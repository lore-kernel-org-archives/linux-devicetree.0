From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 08/29] metag: use unflatten_and_copy_device_tree
Date: Fri, 8 Nov 2013 17:34:18 +0000
Message-ID: <527D209A.8090305@imgtec.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com> <1381163377-21044-9-git-send-email-robherring2@gmail.com> <527CE32F.6090305@imgtec.com> <CAL_JsqKprnCn7JQj7QFbMbLW3Ei-paBH6RYti+CgEFCb4JUaAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKprnCn7JQj7QFbMbLW3Ei-paBH6RYti+CgEFCb4JUaAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-metag <linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Qais <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Qais Yousef <qsyousef-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/11/13 17:26, Rob Herring wrote:
> On Fri, Nov 8, 2013 at 7:12 AM, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
>> On 07/10/13 17:29, Rob Herring wrote:
>>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>>
>>> Use the common unflatten_and_copy_device_tree to copy the built-in FDT
>>> out of init section.
>>>
>>> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>> Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>>
>> With Qais' suggestion of removing the extern void copy_fdt(void) from
>> arch/metag/include/asm/prom.h (thanks Qais):
>> Acked-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> 
> Look at the second series with the prom.h clean-up. prom.h is removed
> from metag altogether now.

Ah yes. It should technically be removed in this patch, but since prom.h
is going away anyway it doesn't particularly bother me.

Thanks
James

--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
