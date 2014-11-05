From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v1 2/3] usb: phy: convert gpio-vbus to gpio_desc
Date: Wed, 05 Nov 2014 20:46:58 +0100
Message-ID: <87sihx1lcd.fsf@free.fr>
References: <1414951910-16075-1-git-send-email-robert.jarzmik@free.fr>
	<1414951910-16075-2-git-send-email-robert.jarzmik@free.fr>
	<20141105192957.GM6548@saruman>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141105192957.GM6548@saruman> (Felipe Balbi's message of "Wed,
	5 Nov 2014 13:29:57 -0600")
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> writes:

> Hi,
>
> On Sun, Nov 02, 2014 at 07:11:49PM +0100, Robert Jarzmik wrote:
>> In order to prepare device-tree conversion, port gpio_vbus to use
>> gpio_desc.
>> 
>> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
>
> Can we just convert users of this to a phy-generic.c with a regulator ?
Maybe, let's see what is missing.

> This is basically what gpio-vbus is doing, it's basically a regulator.
And a detector too. The basic thing is that it request an interrupt, and upon
this interrupt it schedules through a workqueue a usb_gadget_vbus_connect() and
the regulator stuff.

I don't see the interrupt+ usb_gadget_vbus_connect() stuff that in the
phy-generic. Am I missing something ?

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
