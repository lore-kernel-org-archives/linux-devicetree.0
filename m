From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: BCM5301X: Specify serial console parameters
Date: Tue, 14 Mar 2017 22:51:06 +0100
Message-ID: <20170314215106.GB22176@lunn.ch>
References: <20170314075830.2247-1-zajec5@gmail.com>
 <20170314122650.GV15842@lunn.ch>
 <3345fb38-fbea-141e-6ad2-a3341e2c31fe@gmail.com>
 <CAC3K-4qQzX37BLD2N-N-vDwSk=H_rF5PzoMM+GM=Z935QFVnXw@mail.gmail.com>
 <9f5a0381-aae6-9ac2-56f3-9eb78ecfd819@broadcom.com>
 <CAC3K-4pAzs5fXNB=ZpyzYZnTENa=c0v81GVn7WpW53K7GV9UOg@mail.gmail.com>
 <5776ba44-e280-9711-1b05-1c79556884e2@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5776ba44-e280-9711-1b05-1c79556884e2-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rafa?? Mi??ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rafa?? Mi??ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> >Unfortunately, there is not a common bootloader.  CFE is used for the
> >4708/9 boards, and u-boot is used for the 5301x boards.
> OK, little different situation not having a boot rom with console
> output enforcing all designs to use the same UART.
> Do both of the bootloaders happen to use the same UART and all the
> boards are designed to use the same UART?

You need to be a little bit careful here. Some vendor could use a
different UART in there design, use some other bootloader,
etc. Somebody in the community might want to throw out uboot and use
barebox etc....

Device tree does allow .dtsi properties to be over written, so it is
not an issue in practice.

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
