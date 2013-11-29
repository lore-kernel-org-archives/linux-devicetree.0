From: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH V4 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Fri, 29 Nov 2013 17:41:17 +0100
Message-ID: <20131129164117.GL2982@book.gsilab.sittig.org>
References: <1385524192-21501-1-git-send-email-thloh@altera.com>
 <20131128202424.GC2982@book.gsilab.sittig.org>
 <CAOLUe6aWObs1FsZUmw0ptPfwFK6gAiCMjRweMJM5qC8TbnFRBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOLUe6aWObs1FsZUmw0ptPfwFK6gAiCMjRweMJM5qC8TbnFRBQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Tien Hock Loh <thloh@altera.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tien Hock Loh <thloh.linux@gmail.com>, "lftan@altera.com" <lftan@altera.com>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 29, 2013 at 09:59 +0800, Tien Hock Loh wrote:
> 
> On Fri, Nov 29, 2013 at 4:24 AM, Gerhard Sittig <gsi@denx.de> wrote:
> > On Wed, Nov 27, 2013 at 11:49 +0800, thloh@altera.com wrote:
> >>
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
> >> @@ -0,0 +1,35 @@
> >> +[ ... ]
> >> +
> >> +Example:
> >> +
> >> +gpio_altr: gpio_altr {
> >> +    compatible = "altr,pio-1.0";
> >> +    reg = <0xff200000 0x10>;
> >
> > This length appears to be less than what the code defines (the
> > latter has offsets beyond 0x10).
> 
> The higher registers (0x10 and 0x14) are only available if the
> controller is configured as GPIO output. Thus, there are two
> configuration - one that has the length 0x10 (GPIO without output
> ports), and one with the length 0x20 (GPIO with output ports). Is
> there anything I need to handle for cases like this?

Hmm.  I cannot tell whether there is a preference in mainline or
whether there is prior art of IP blocks having different sizes
depending on their "being compatible" to something or their
configuration and feature set.  Others may know more.

With your explanation in mind, writing "specify an address and
size that fits your component" may be considered "stating the
obvious".

So I don't have strong feelings about it, I was just wondering.
This need not mean that something was wrong. :)


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
