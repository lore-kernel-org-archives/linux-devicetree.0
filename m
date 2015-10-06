From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 0/3] ARM: uniphier: add outer cache support and rework SMP operations
Date: Tue, 06 Oct 2015 16:22:05 +0200
Message-ID: <5275814.I392BfIEUH@wuerfel>
References: <1442551054-2116-1-git-send-email-yamada.masahiro@socionext.com> <6239461.UGe6XP3dfB@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6239461.UGe6XP3dfB@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org, Jiri Slaby <jslaby@suse.com>, Linus Walleij <linus.walleij@linaro.org>, Kumar Gala <galak@codeaurora.org>, Jungseung Lee <js07.lee@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, Pawel Moll <pawel.moll@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Tomasz Figa <t.figa@samsung.com>, devicetree@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Russell King <linux@arm.linux.org.uk>, Nicolas Pitre <nico@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Nathan Lynch <nathan_lynch@mentor.com>, Kees Cook <keescook@chromium.org>, Paul Bolle <pebolle@tiscali.nl>, Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 06 October 2015 16:20:23 Arnd Bergmann wrote:
> On Friday 18 September 2015 13:37:31 Masahiro Yamada wrote:
> > Hi Olof,
> > 
> > Now Linux 4.3-rc1 is out, so I am back to this.
> > 
> > 1/3: add outer cache support
> > 2/3: rework SMP operations
> > 3/3: add device tree nodes
> > 
> > Because 2/3 highly depends on 1/3, I hope whole of this series
> > is applied through ARM-SOC tree.
> 
> Sorry for the long delay here. Is this the latest version of these
> patches?
> 
> Did Russell King review the first patch?
> Is he ok with merging this through arm-soc?
> 

I found an answer to the first question, as I see you posted
v5 of the patchset in the meantime.

	Arnd
