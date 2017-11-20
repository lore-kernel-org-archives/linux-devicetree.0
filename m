From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: bcm283x: Fix fifo size for EP 6,7
Date: Mon, 20 Nov 2017 13:48:36 +0100
Message-ID: <56581c3c-9159-8e07-288b-5ccc793e1fa1@i2se.com>
References: <1507371414-21688-1-git-send-email-stefan.wahren@i2se.com>
 <160210128.18582.1509137904239@email.1und1.de> <871slkw3ms.fsf@anholt.net>
 <1506055926.93787.1509439381859@email.1und1.de>
 <2056429546.196128.1510871632211@email.1und1.de>
 <410670D7E743164D87FA6160E7907A560113A3F8F0@am04wembxa.internal.synopsys.com>
 <2145990636.312534.1511036500613@email.1und1.de>
 <410670D7E743164D87FA6160E7907A560113A409A8@am04wembxa.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <410670D7E743164D87FA6160E7907A560113A409A8-ouFQeoKRuQ8bQ7k9MBbv4fufCSb+aD3WLzEdoUbNIic@public.gmane.org>
Content-Language: de-DE
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Minas Harutyunyan <Minas.Harutyunyan-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Minas,

Am 20.11.2017 um 12:59 schrieb Minas Harutyunyan:
> Hi Stefan,
> Looks like I know cause of issue... but I'm overloaded today and will able to check it tomorrow. Sorry for delay.

thanks for your reply. There is no need to hurry, because the merge
window isn't open yet, but i like to get this fixed for the next kernel
release.

I have the suspicion this is related to the fact that u-boot already
initialize the USB IP, before dwc2 driver is loaded.

Regards
Stefan

>
> Thanks,
> Minas
>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
