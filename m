From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/3] misc: bmp085: Add DT bindings for EOC gpio line and direct irq.
Date: Mon, 18 Nov 2013 12:38:40 +0100
Message-ID: <201311181238.40349.arnd@arndb.de>
References: <1384465609-26485-1-git-send-email-marek@goldelico.com> <20131115153015.GD24831@e106331-lin.cambridge.arm.com> <CAAfyv346pUa9k3+9jdBX+EK8cV9GenaBxrAnVnKsbUPBoNBqrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAfyv346pUa9k3+9jdBX+EK8cV9GenaBxrAnVnKsbUPBoNBqrQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "neilb-l3A5Bk7waGM@public.gmane.org" <neilb-l3A5Bk7waGM@public.gmane.org>, "hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 18 November 2013, Belisko Marek wrote:

> > It would be far nicer for the device binding to just have the interrupts
> > property, and for the gpio controller to act as an interrupt-controller,
> > with the appropriate pin management.
> OK. Can you please give me some example in current bindings tree?
> Something like in:
> Documentation/devicetree/bindings/fb/mxsfb.txt ? So if I understand
> correctly we define only property
> interrupts = <xxx> which will be exact interrupt number for cpu gpio
> connected to bmp085 irq line.
> >

See Documentation/devicetree/bindings/gpio/8xxx_gpio.txt for an example
of a device whose interrupt line is connected to a gpio controller. The
key here is to set the "interrupt-parent" to the gpio node and have
the irq specifier define an interrupt local to that node.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
