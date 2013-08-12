From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH 1/2] ARM: dts: Change dw-apb-timer-osc and
 dw-apb-timer-sp to just dw-apb-timer
Date: Mon, 12 Aug 2013 13:57:04 +0200
Message-ID: <20130812115703.GA27616@amd.pavel.ucw.cz>
References: <1374723797-22169-1-git-send-email-dinguyen@altera.com>
 <20130811214509.GA26757@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130811214509.GA26757@quad.lixom.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: dinh.linux@gmail.com, Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, John Stultz <john.stultz@linaro.org>, linux-arm-kernel@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Jamie Iles <jamie@jamieiles.com>, dinguyen@altera.com
List-Id: devicetree@vger.kernel.org


> > index eb2327b..0a1020e 100644
> > --- a/Documentation/devicetree/bindings/rtc/dw-apb.txt
> > +++ b/Documentation/devicetree/bindings/rtc/dw-apb.txt
> > @@ -1,7 +1,7 @@
> >  * Designware APB timer
> >  
> >  Required properties:
> > -- compatible: "snps,dw-apb-timer-sp" or "snps,dw-apb-timer-osc"
> > +- compatible: "snps,dw-apb-timer"
> >  - reg: physical base address of the controller and length of memory mapped
> >    region.
> >  - interrupts: IRQ line for the timer.
> 
> Here's a classic example of where we will eventually need to keep the ABI. You
> can add a comment that the preferred compatible value is the new one, but the
> old ones still need to be handled by the drivers, and shouldn't be removed.
> 
> That is, of course, if people are happy with the current binding and want to
> keep it instead of revising it before declaring it locked in.

The first -sp / -osc separation was bad idea from the start. It would
be better if we could get rid of it.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
