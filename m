From: Wolfgang Denk <wd@denx.de>
Subject: Re: [PATCH] drivers, char: add U-Boot bootcount driver
Date: Sun, 04 Dec 2011 17:34:17 +0100
Message-ID: <20111204163417.1AD6625EA22@gemini.denx.de>
References: <1322991921-21096-1-git-send-email-hs@denx.de> <20111204114741.GA5788@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20111204114741.GA5788@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: Heiko Schocher <hs@denx.de>, Vitaly Bordug <vbordug@ru.mvista.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dear Wolfram,

in message <20111204114741.GA5788@pengutronix.de> you wrote:
> 
> >       Description: OSDL CGL specifies that carrier grade Linux
> >       shall provide support for detecting a repeating reboot cycle
> > 	due to recurring failures. This detection should happen in
> > 	user space before system services are started.
>
> So, technically, a flag would be enough, not necessarily a counter? Although a
> counter probably has more advantages...

The real-life applications we have seen so far all required a counter.
They all required to switch to a recovery mode or other alternative
boot sequence after N failed boot attempts, with N > 1 in all cases.

> >                   reg = <0x23060 0x20>;
>
> I assume that non-volatile memory would qualify as a boot-counter, so those
> could be tied to I2C busses etc? reg would not fit then.

Actually all kind of non-volatile storage can be used - it depends
on specific hardware roperties.  Some SoCs have registers that are
guaranteed not to change theier value during a reset; on other systems
we have storage or NVRAM in RTCs or similar, or we can use SRAM, or
I2C or SPI attached EEPROM, or even storage on SDCard, USB or other
storage devices.

This binding covers the memory type only.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"There is nothing new under the sun, but there are lots of old things
we don't know yet."                                  - Ambrose Bierce
