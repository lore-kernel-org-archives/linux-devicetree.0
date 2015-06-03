From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V2 0/3] Pistachio USB2.0 PHY
Date: Wed, 3 Jun 2015 08:44:58 -0700
Message-ID: <CAL1qeaFdcqUoivOkBjbGEtMovDow08_j68k+Z7mxrY==OAhAWA@mail.gmail.com>
References: <1428444258-25852-1-git-send-email-abrestic@chromium.org>
	<CAL1qeaE0+aMLBgk8SKgJ3fXm==M2-Z_yEPYNVZ0yxSee-p7YOw@mail.gmail.com>
	<5549083F.8080505@imgtec.com>
	<5550C06D.2010409@ti.com>
	<556E99B4.6090307@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <556E99B4.6090307-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: 1428444258-25852-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 2, 2015 at 11:07 PM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
>
>
> On Monday 11 May 2015 08:15 PM, Kishon Vijay Abraham I wrote:
>>
>>
>>
>> On Tuesday 05 May 2015 11:43 PM, Ezequiel Garcia wrote:
>>>
>>> Hi Kishon,
>>>
>>>>
>>>> This series adds support for the USB2.0 PHY present on the IMG Pistachio
>>>> SoC.
>>>>
>>>> Based on mips-for-linux-next and tested on the IMG Pistachio BuB.  If
>>>> possible,
>>>> I'd like this to go through the MIPS tree with Kishon's ACK.
>>>>
>>>
>>> Tested-by: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>>>
>>> Can we have your Ack for this series so Ralf can pick it?
>>
>>
>> sure..
>>
>> Acked-by: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
>
>
> I'm not sure if this has been merged yet. But this will cause conflicts with
> other PHY patches in Makefile and Kconfig when linus merges to his tree. I'd
> prefer the phy patches go in PHY tree itself.

It doesn't look like Ralf has picked these up, so if you want to take
them through your tree, that would be great.

Thanks,
Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
