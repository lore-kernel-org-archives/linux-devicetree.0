From: Ian Campbell <ijc@hellion.org.uk>
Subject: Re: [PATCH v2 1/2] ARM: dts: Remove use of skeleton.dtsi from
 bcm283x.dtsi
Date: Fri, 09 Sep 2016 17:21:02 +0100
Message-ID: <1473438062.28111.61.camel@hellion.org.uk>
References: <1470233565-30154-1-git-send-email-ijc@hellion.org.uk>
         <7746678.0mZLVD2k0J@wuerfel> <1473432356.28111.60.camel@hellion.org.uk>
         <5852905.snAkjWmlVZ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5852905.snAkjWmlVZ@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Catalin Marinas <catalin.marinas@arm.com>, Lee Jones <lee@kernel.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Eric Anholt <eric@anholt.net>, arm@kernel.org, Gerd Hoffmann <kraxel@redhat.com>, Frank Rowand <frowand.list@gmail.com>, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 2016-09-09 at 17:47 +0200, Arnd Bergmann wrote:
> On Friday, September 9, 2016 3:45:56 PM CEST Ian Campbell wrote:
> > 
> > On Tue, 2016-08-23 at 12:09 +0200, Arnd Bergmann wrote:
> > > 
> > > I had skipped the new message as well while sorting through 5000
> > > messages after my vacation, but I've now put it into my TODO
> > > folder
> > > and will get to it eventually.
> > 
> > Is it still on your TODO or should I do...
> > 
> > > 
> > > We sometimes miss stuff that is meant for arm-soc when it comes
> > > from people that don't normally send us patches. If you want to
> > > be sure to catch the attention, stick a 'GIT PULL' into the
> > > subject
> > > or send a ping on IRC.
> > 
> > ... one of these?
> > 
> > It'd be great to get this fixed in v4.8 so that the corresponding
> > device-tree.git tag will build.
> 
> Oh, it ended  up in my v4.9-todo folder, not 4.8, I misunderstood
> the urgency, sorry.

No worries.

> I've applied it to the fixes branch now.

Thank you!

Ian.
