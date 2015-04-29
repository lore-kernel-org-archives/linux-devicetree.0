From: Alban <albeu@free.fr>
Subject: Re: [PATCH v3 00/12] MIPS: ath79: Add OF support and DTS for
 TL-WR1043ND
Date: Thu, 30 Apr 2015 01:07:28 +0200
Message-ID: <20150430010728.0331a736@tock>
References: <1429875679-14973-1-git-send-email-albeu@free.fr>
	<553E3CC8.3070304@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <553E3CC8.3070304@vanguardiasur.com.ar>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Aban Bedel <albeu@free.fr>, linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 27 Apr 2015 10:42:32 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> On 04/24/2015 08:41 AM, Alban Bedel wrote:
> > This series add OF bindings and code support for the interrupt
> > controllers, clocks and GPIOs. However it was only tested on a
> > TL-WR1043ND with an AR9132, others SoCs are untested, and a few are
> > not supported at all.
> > 
 
> Hi Alban,

Hi,

> I've booted a Carambola2 using this (plus a custom devicetree and some
> small changes):
> 
> Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>
> Just a small comment/question: Shouldn't we allow to build all the
> devicetree files, instead of just the one that will be built-in?
> 
> I.e., something like this:
> 
> dtb-$(CONFIG_MATCH_ATH79_DT)   += ar9132_tl_wr1043nd_v1.dtb
> dtb-$(CONFIG_MACH_ATH79_DT)    += ar9331_carambola2.dtb
> 
> It should be useful to catch errors, but also in general, as the
> devicetree is supposed to be independent of the kernel and should be
> built separate from it.

Yes, that would be better, I'll fix that.

> PS: This series depends on a previous patchset. It's usually useful to
> mention this in the cover letter and make a poor tester's life
> easier :)

> > Most code changes base on the previous bug fix series:
> > [PATCH v2 0/5] MIPS: ath79: Various small fix to prepare OF support

Wasn't that clear enough?

> Thanks for the work,

Thanks for the testing.

Alban
