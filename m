From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC 1/5] ARM: at91: add general purpose backup register
 (GPBR) support
Date: Mon, 8 Apr 2013 12:04:17 +0200
Message-ID: <20130408100417.GT20693@game.jcrosoft.org>
References: <20130407150938.GA25605@localhost>
 <1365347572-14972-1-git-send-email-jhovold@gmail.com>
 <20130408073329.GO20693@game.jcrosoft.org>
 <20130408084618.GB25605@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130408084618.GB25605@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Robert Nelson <Robert.Nelson-9gsZL1vm+hpBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dgilbert-qazKcTl6WRFWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10:46 Mon 08 Apr     , Johan Hovold wrote:
> On Mon, Apr 08, 2013 at 09:33:29AM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > On 17:12 Sun 07 Apr     , Johan Hovold wrote:
> > > 
> > > Add General Purpose Backup Register (GPBR) support.
> > > 
> > > Most at91 SoCs have at least four 32-bit General Purpose Backup
> > > Registers (GPBR) powered by backup-power (VDDBU). One such register is
> > > currently used by rtc-at91sam9 driver to store the RTC time base.
> > > 
> > > Make sure the registers are mapped by arch setup code and add generic
> > > accessors for in-kernel use.
> > > 
> > > This is a step in adding device-tree support to the rtc-at91sam9 driver.
> > > 
> > This is a regression
> > 
> > we loose the tracking of what request and use the GPBR
> 
> Implementing the GPBR accessors using a simple global resource was one
> quick way forward to decouple and generalise the GPBR. Of course, this
> could be turned into a more elaborate framework or driver where
> registers are requested and released by other drivers and possibly also
> by user-space.
yes must as we used on SAMA5 to pass the boot source from the firstage of the boot
loader to the other software
