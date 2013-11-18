From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 2/3] misc: bmp085: Add DT bindings for EOC gpio line and
 direct irq.
Date: Mon, 18 Nov 2013 18:17:47 +0100
Message-ID: <20131118171747.GM17929@book.gsilab.sittig.org>
References: <1384465609-26485-1-git-send-email-marek@goldelico.com>
 <20131115153015.GD24831@e106331-lin.cambridge.arm.com>
 <CAAfyv346pUa9k3+9jdBX+EK8cV9GenaBxrAnVnKsbUPBoNBqrQ@mail.gmail.com>
 <201311181238.40349.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201311181238.40349.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[ trimmed Cc: list for DT ]
[ is the bindings/gpio/8xxx_gpio.txt document incomplete? ]

On Mon, Nov 18, 2013 at 12:38 +0100, Arnd Bergmann wrote:
> 
> See Documentation/devicetree/bindings/gpio/8xxx_gpio.txt for an
> example of a device whose interrupt line is connected to a gpio
> controller. The key here is to set the "interrupt-parent" to
> the gpio node and have the irq specifier define an interrupt
> local to that node.

I was wondering whether the gpio-controller nodes lack both the
'interrupt-controller' boolean flag as well as the
'#interrupt-cells = <2>' property.  The former may be optional,
I'm not certain there.  But the latter should be a hard
requirement without which the 'funkyfpga' references cannot get
parsed I'm afraid.

Am I missing something?  Did I get the names right?  Shall I send
a patch?  Is the code working without those specs since it
assumes knowledge that was not specified in the device tree?  And
would this be against the idea that the binding should be
"complete" and independent of who is interpreting the data?  Or
is the binding document just incomplete?


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
