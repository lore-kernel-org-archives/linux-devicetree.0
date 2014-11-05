From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v1 2/3] usb: phy: convert gpio-vbus to gpio_desc
Date: Wed, 05 Nov 2014 21:02:04 +0100
Message-ID: <87oasl1kn7.fsf@free.fr>
References: <1414951910-16075-1-git-send-email-robert.jarzmik@free.fr>
	<1414951910-16075-2-git-send-email-robert.jarzmik@free.fr>
	<20141105192957.GM6548@saruman> <87sihx1lcd.fsf@free.fr>
	<20141105195015.GU6548@saruman>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141105195015.GU6548@saruman> (Felipe Balbi's message of "Wed,
	5 Nov 2014 13:50:15 -0600")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> writes:

> On Wed, Nov 05, 2014 at 08:46:58PM +0100, Robert Jarzmik wrote:
> Well, let's add that :-) Just make it optional. It's pointless to have
> 80% duplicated code just because of 20% missing in phy-generic :-)
>
> Then we avoid adding gpio-vbus specific DT properties too.
OK, got it.

It will take me a couple of days. Philipp, am I missing something apart the
detection and connect stuff ? While I'm at making my board work with
phy-generic, let's thing ahead.

Felipe, that will mean at least this for phy-generic :
 - usb_phy_gen_create_phy() will be enhanced
   => struct usb_phy_generic_platform_data will get a :
     - int gpio_vbus field (or whatever name you wish)
     - int gpio_vbus_inverted (or maybe we could go directly for gpio desc)
     - int gpio_pullup field (I'm not sure here, maybe we should just drop that)
     - bool wakeup field (or another name)
   => device tree will get :
     - a vbus-gpio (or another name)
     - a pullup-gpio (or nothing if we drop)
 - there will be a request_irq() and a workqueue (mostly taken from gpio-vbus)
   => will call usb_gadget_vbus_connect()
   => will call usb_gadget_vbus_disconnect()

I'm writing all this just to be sure I have the good picture before I start
coding.

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
