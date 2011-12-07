From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH v4 5/6] ARM: vexpress: DT-based support for Cortex-A5
 and Cortex-A9 based tiles
Date: Wed, 07 Dec 2011 19:09:34 +0000
Message-ID: <1323284974.32116.12.camel@hornet.cambridge.arm.com>
References: <1323186229-22054-1-git-send-email-pawel.moll@arm.com>
 <1323186229-22054-6-git-send-email-pawel.moll@arm.com>
 <20111207153338.GD2910@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20111207153338.GD2910@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dave Martin <dave.martin@linaro.org>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2011-12-07 at 15:33 +0000, Dave Martin wrote:
> Oh, we should select HAVE_PATA_PLATFORM in here somewhere too.
> But that's not critical for this series.

It's already selected in "arch/arm/Kconfig":

config ARCH_VEXPRESS
        bool "ARM Ltd. Versatile Express family"
        select ARCH_WANT_OPTIONAL_GPIOLIB
        select ARM_AMBA
        select ARM_TIMER_SP804 
        select CLKDEV_LOOKUP
        select HAVE_MACH_CLKDEV
        select GENERIC_CLOCKEVENTS
        select HAVE_CLK
        select HAVE_PATA_PLATFORM
        select ICST
        select PLAT_VERSATILE
        select PLAT_VERSATILE_CLCD
        help
          This enables support for the ARM Ltd Versatile Express boards.

Cheers!

Pawel
