From: Johan Hovold <jhovold@gmail.com>
Subject: Re: [RFC 1/5] ARM: at91: add general purpose backup register (GPBR)
 support
Date: Thu, 11 Apr 2013 14:39:08 +0200
Message-ID: <20130411123908.GB21305@localhost>
References: <20130407150938.GA25605@localhost>
 <1365347572-14972-1-git-send-email-jhovold@gmail.com>
 <20130408073329.GO20693@game.jcrosoft.org>
 <20130408084618.GB25605@localhost>
 <20130408100417.GT20693@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130408100417.GT20693@game.jcrosoft.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Johan Hovold <jhovold@gmail.com>, dgilbert@interlog.com, Nicolas Ferre <nicolas.ferre@atmel.com>, Robert Nelson <Robert.Nelson@digikey.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 08, 2013 at 12:04:17PM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 10:46 Mon 08 Apr     , Johan Hovold wrote:
> > On Mon, Apr 08, 2013 at 09:33:29AM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > > On 17:12 Sun 07 Apr     , Johan Hovold wrote:
> > > > 
> > > > Add General Purpose Backup Register (GPBR) support.
> > > > 
> > > > Most at91 SoCs have at least four 32-bit General Purpose Backup
> > > > Registers (GPBR) powered by backup-power (VDDBU). One such register is
> > > > currently used by rtc-at91sam9 driver to store the RTC time base.
> > > > 
> > > > Make sure the registers are mapped by arch setup code and add generic
> > > > accessors for in-kernel use.
> > > > 
> > > > This is a step in adding device-tree support to the rtc-at91sam9 driver.
> > > > 
> > > This is a regression
> > > 
> > > we loose the tracking of what request and use the GPBR
> > 
> > Implementing the GPBR accessors using a simple global resource was one
> > quick way forward to decouple and generalise the GPBR. Of course, this
> > could be turned into a more elaborate framework or driver where
> > registers are requested and released by other drivers and possibly also
> > by user-space.
> yes must as we used on SAMA5 to pass the boot source from the firstage
> of the boot loader to the other software

Could you please elaborate on this; how is the GPBR used, how many
registers, and when is it accessed?

Is there already code in at91/at91-3.10-soc or are you referring to
a userspace consumer?

Thanks,
Johan
