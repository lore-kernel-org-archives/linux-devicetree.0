From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 2/3] misc: bmp085: Add DT bindings for EOC gpio line and
 direct irq.
Date: Thu, 21 Nov 2013 00:23:10 +0100
Message-ID: <20131120232310.GS17929@book.gsilab.sittig.org>
References: <1384465609-26485-1-git-send-email-marek@goldelico.com>
 <201311181238.40349.arnd@arndb.de>
 <20131118171747.GM17929@book.gsilab.sittig.org>
 <201311182328.40743.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201311182328.40743.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 18, 2013 at 23:28 +0100, Arnd Bergmann wrote:
> 
> [ ... incomplete 8xxx gpio binding document ... ]
> 
> You are absolutely right, I picked an example that was actually
> wrong.
> 
> [ ... ]
> 
> I think the problem is that this particular controller is never
> used in "interrupts" properties, so nobody noticed the mistake.
> It probably still works for gpio references and drivers using
> gpio_to_irq on those numbers.

Actually that very GPIO module _is_ being used as an IRQ
controller as well.  The MPC5121 is one of those (not explicitly
listed) compatibles.  The mpc5121.dtsi correctly declares the
GPIO module as both a GPIO as well as an IRQ controller, and the
ac14xx.dts board does use GPIO lines as IRQs.

Which suggests that the issue is just incomplete documentation.
And that an incomplete binding document does not prevent correct
use of the binding. :)  And more importantly that the use of DT
is so intuitive that people get things right without looking at
the docs. :-]


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
