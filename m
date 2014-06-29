From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2 2/3] usb: gadget: pxa27x_udc device-tree documentation
Date: Sun, 29 Jun 2014 11:29:49 +0200
Message-ID: <87fviooygi.fsf@free.fr>
References: <1403427899-32154-1-git-send-email-robert.jarzmik@free.fr>
	<1403427899-32154-2-git-send-email-robert.jarzmik@free.fr>
	<20140625103357.GC14495@leverpostej> <87zjh07okm.fsf@free.fr>
	<20140626085950.GJ15240@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140626085950.GJ15240@leverpostej> (Mark Rutland's message of
	"Thu, 26 Jun 2014 09:59:51 +0100")
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb@vger.kernel.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:

> On Wed, Jun 25, 2014 at 08:54:01PM +0100, Robert Jarzmik wrote:
>> > The name of the clock input doesn't make sense.
>> I don't understand. With [1] does it make any more sense ? If not you'll have to
>> expand a bit more the "doesn't make sense".
>
> My concern is that clock-names is supposed to describe the name of the
> input clock line from the view of the IP block. "pxa27x-udc" doesn't
> sound like the name of a clock input line from the view of the UDC
> block.
>
> I assume the clock input line you care about has a more specific name
> than "pxa27x-udc"?
Not as far as I know. The technical reference manual call it "udc clock", so
it's even "less" specific ...

Marvell engineers have probably the internal schematics and the name of the
clock, but outsiders like me only have "udc" ...

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
