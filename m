From: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH V6 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Thu, 23 Jan 2014 19:59:06 +0100
Message-ID: <20140123185906.GU20094@book.gsilab.sittig.org>
References: <1390359265-22808-1-git-send-email-thloh@altera.com>
 <20140122180904.GN20094@book.gsilab.sittig.org>
 <CAOLUe6Ya=bTYrURhieWQkZewYf2Z8kFN82nkxwfM5DJDHb5wzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOLUe6Ya=bTYrURhieWQkZewYf2Z8kFN82nkxwfM5DJDHb5wzw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Tien Hock Loh <thloh.linux@gmail.com>
Cc: Tien Hock Loh <thloh@altera.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dinguyen@altera.com, "lftan@altera.com" <lftan@altera.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 23, 2014 at 09:47 +0800, Tien Hock Loh wrote:
> 
> On Thu, Jan 23, 2014 at 2:09 AM, Gerhard Sittig <gsi@denx.de> wrote:
> > On Wed, Jan 22, 2014 at 10:54 +0800, thloh@altera.com wrote:
> >>
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
> >> @@ -0,0 +1,42 @@
> >> +Altera GPIO controller bindings
> >> +
> >> +Required properties:
> >> +- compatible:
> >> +  - "altr,pio-1.0"
> >> +- reg: Physical base address and length of the controller's registers.
> >> +- #gpio-cells : Should be 1
> >> +  - The first cell is the gpio offset number
> >> +- gpio-controller : Marks the device node as a GPIO controller.
> >
> > Learning about required data types when reading the binding would
> > be nice.  So that DTS authors can tell whether a property is
> > boolean, takes integers or strings, etc
> 
> Hmm, I don't quite understand your statement. I'm referring to other
> gpio device tree binding documentation when creating this. Do you mind
> to elaborate what you're expecting?

Do you mean you have been citing, or copying from other bindings?
Got inspiration from them, did what they do?  This I'd understand.

But you don't _reference_ other bindings or a common binding.
The above quotation is complete from the start of the file, and
one cannot learn from this specific binding what the data types
of the properties are, nor are other bindings referred to.

It's easy to fix.  No problem there.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
