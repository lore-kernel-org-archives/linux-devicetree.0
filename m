From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [RFC 1/5] ARM: at91: add general purpose backup register
 (GPBR) support
Date: Thu, 11 Apr 2013 16:53:03 +0200
Message-ID: <20130411145303.GA25242@game.jcrosoft.org>
References: <20130407150938.GA25605@localhost>
 <1365347572-14972-1-git-send-email-jhovold@gmail.com>
 <20130408073329.GO20693@game.jcrosoft.org>
 <20130408084618.GB25605@localhost>
 <20130408100417.GT20693@game.jcrosoft.org>
 <20130411123908.GB21305@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130411123908.GB21305@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Johan Hovold <jhovold@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, Robert Nelson <Robert.Nelson@digikey.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-arm-kernel@lists.infradead.org, dgilbert@interlog.com
List-Id: devicetree@vger.kernel.org

On 14:39 Thu 11 Apr     , Johan Hovold wrote:
> On Mon, Apr 08, 2013 at 12:04:17PM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > On 10:46 Mon 08 Apr     , Johan Hovold wrote:
> > > On Mon, Apr 08, 2013 at 09:33:29AM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > > > On 17:12 Sun 07 Apr     , Johan Hovold wrote:
> > > > > 
> > > > > Add General Purpose Backup Register (GPBR) support.
> > > > > 
> > > > > Most at91 SoCs have at least four 32-bit General Purpose Backup
> > > > > Registers (GPBR) powered by backup-power (VDDBU). One such register is
> > > > > currently used by rtc-at91sam9 driver to store the RTC time base.
> > > > > 
> > > > > Make sure the registers are mapped by arch setup code and add generic
> > > > > accessors for in-kernel use.
> > > > > 
> > > > > This is a step in adding device-tree support to the rtc-at91sam9 driver.
> > > > > 
> > > > This is a regression
> > > > 
> > > > we loose the tracking of what request and use the GPBR
> > > 
> > > Implementing the GPBR accessors using a simple global resource was one
> > > quick way forward to decouple and generalise the GPBR. Of course, this
> > > could be turned into a more elaborate framework or driver where
> > > registers are requested and released by other drivers and possibly also
> > > by user-space.
> > yes must as we used on SAMA5 to pass the boot source from the firstage
> > of the boot loader to the other software
> 
> Could you please elaborate on this; how is the GPBR used, how many
> registers, and when is it accessed?

The second stage bootloader store the content of the boot mode passs via r4
from the Rom-Code in the 2nd gpbr
> 
> Is there already code in at91/at91-3.10-soc or are you referring to
> a userspace consumer?
no user you can see the code in barebox
you can see the code of barebox here
http://git.linupdate.org/git?p=barebox.git;a=shortlog;h=refs/heads/delivery/sama5-release-bootmode

Best Regards,
J.
> 
> Thanks,
> Johan
