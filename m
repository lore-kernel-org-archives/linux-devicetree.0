From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Status variable
Date: Fri, 29 Jan 2016 09:49:37 +0100
Message-ID: <3706345.JqhHqFGYfF@wuerfel>
References: <CANMsd02jhaouPBuySWXQ2edE+gyMZ3dncobipKa-dg1vLJCE2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANMsd02jhaouPBuySWXQ2edE+gyMZ3dncobipKa-dg1vLJCE2Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryan <ryanphilips19-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 29 January 2016 14:13:20 Ryan wrote:
> Hello,
> 
> I am confused about the "status" variables on a device tree. What is
> the meaning of
> status="okay", status="enabled", status="disabled".
> 
> the function: __of_device_is_available returns 1 if the entry itself
> is not there.
> 
> Why is this?
> 
> Thanks for your time.

On status="disabled" is defined to have an effect and will prevent
the device from being used. Any other value or an absent status
property is interpreted as a working device.

The common way this is used is that a soc-specific .dtsi file lists
all devices that are present within the soc, but marks the ones as
disabled that are not always usable because they depend on a external
connection (e.g. a uart only makes sense if it talks to something,
while a timer device is always usable). A board specific file then
does not need to define the entire device but just override the
status as "okay".

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
