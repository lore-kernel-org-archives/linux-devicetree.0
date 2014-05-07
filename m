From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/20] USB support for Armada 38x and Armada 375
Date: Wed, 07 May 2014 11:21:58 +0200
Message-ID: <5369FB36.7040404@gmail.com>
References: <1399335255-589-1-git-send-email-gregory.clement@free-electrons.com> <loom.20140507T102941-222@post.gmane.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <loom.20140507T102941-222-eS7Uydv5nfjZ+VzJOa5vwg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[Adding back the original Cc-List]

On 05/07/2014 10:33 AM, Hans de Goede wrote:
> Hi Gregory,
>
> Gregory CLEMENT <gregory.clement <at> free-electrons.com> writes:
>
>> This patch set adds the USB support for the Armada 38x Armada
>> 375. These SoCs use an xHCI but still need specific initialization,
>> mainly to setup the windows memory on the mbus. They also use the same
>> controller that the other mvebu SoC for EHCI.
>
> <snip>
>
>> Gregory CLEMENT (20):
>>    usb: ehci-orion: Fix clock reference leaking
>>    usb: ehci-orion: Add the optional PHY support
>
> If you're using a proper phy driver, do you really need a soc specific ehci
> driver? I've spend a lot of time during the last release cycle to make
> ehci-platform a lot more generic, including adding (optional) phy support to
> it. It would be great if the new Armada SoCs could use ehci-platform instead
> of extending ehci-orion to cover more models (ideally most ehci-foo drivers
> would go away completely). I've no idea how feasible it is to use
> ehci-platform in your case, but IMHO it should at least be considered.

Hans,

unfortunately we currently have no USB-PHY driver for the other mvebu
SoCs. I have started some code grabbing for barebox bootloader and plan
to add proper USB-PHYs for Linux later.

There is one thing very specific to mvebu SoCs, which is the mbus:
you need to setup upstream memory windows for the usb bus master.
 From my current understanding, that will require at least a minimal
stub to remain for ehci-orion.

I do think that most of the stuff in ehci-orion can (and should) be
replaced with ehci-platform then. So, we definitely consider reusing
the generic foo-platform drivers on all opportunities but IMHO we are
not yet ready for it.

Sebastian

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
