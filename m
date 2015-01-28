From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v2 0/8] ARM: Conexant Digicolor CX92755 SoC support
Date: Wed, 28 Jan 2015 23:33:15 +0100
Message-ID: <1422484395.3621.73.camel@x220>
References: <cover.1420744368.git.baruch@tkos.co.il>
 <5966468.GiJYdzCvnt@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5966468.GiJYdzCvnt@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Valentin Rothberg <valentinrothberg@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-01-08 at 23:46 +0100, Arnd Bergmann wrote:
> Once there are no more review comments, please submit the first three
> patches to arm@kernel.org, and send the other patches as separate
> series to the respective maintainers for irqchip and clocksource.

I found this message while looking into CONFIG_ARCH_DIGICOLOR. That
Kconfig macro entered linux-next in next-20150128. But there's no
Kconfig symbol ARCH_DIGICOLOR yet in linux-next.

As you might be aware I try to check each linux-next release for Kconfig
oddities. One of the oddities I tend _not_ to report are things like
this. That is, SoC's, MFD's, or whatever, were specific drivers can get
merged before the core functionality. In this case the irqchip driver
got merged into linux-next while the core ARCH_DIGICOLOR code is still
pending. And you happen to be involved with quite a bit of code in areas
like that. 

Pre-merges like this appear unavoidable (ie, other workflows would be
more trouble for the people involved). But what would be a good moment
to still raise an issue like this? Just to make sure things don't fall
through the cracks. As in: "this driver got merged into mainline but do
you know you can't yet build it?". Perhaps with each -rc1?


Paul Bolle
