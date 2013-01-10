From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RFC PATCH 1/7] ARM: common: vic: Parse interrupt and resume masks from device tree
Date: Thu, 10 Jan 2013 12:10:38 +0100
Message-ID: <25622346.hsAr9IOJWj@flatron>
References: <1357774909-29938-1-git-send-email-tomasz.figa@gmail.com> <1357774909-29938-2-git-send-email-tomasz.figa@gmail.com> <20130110110314.GH20956@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20130110110314.GH20956@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

On Thursday 10 of January 2013 11:03:14 Mark Brown wrote:
> On Thu, Jan 10, 2013 at 12:41:43AM +0100, Tomasz Figa wrote:
> > +- interrupt-mask : Bit mask of valid interrupt sources (defaults to
> > all valid) +- wakeup-mask : Bit mask of interrupt sources that can
> > wake up the system +  (defaults to all allowed)
> 
> Should this really be configured in the VIC itself?  It seems like
> something that might change at runtime (for example, due to the user
> configuring wakes in sysfs).

This is not the runtime interrupt/wakeup mask, but a global mask of 
available interrupt/wakeup lines on particular platform, which still have 
to be configured and enabled appropriately by user.

Best regards,
Tomasz Figa
