From: Chris Ball <chris@printf.net>
Subject: Re: [PATCH v2 3/4] rename ARCH_BCM to ARCH_BCM_MOBILE (mmc)
Date: Mon, 24 Mar 2014 13:29:22 +0000
Message-ID: <86pplbwwr1.fsf@void.printf.net>
References: <1379956836-5866-1-git-send-email-bcm@fixthebug.org>
	<1379956836-5866-4-git-send-email-bcm@fixthebug.org>
	<20140312214524.GS25092@beef>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <20140312214524.GS25092@beef> (Matt Porter's message of "Wed, 12
	Mar 2014 17:45:24 -0400")
Sender: linux-mmc-owner@vger.kernel.org
To: Matt Porter <mporter@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Domenico Andreoli <cavokz@gmail.com>, Christian Daudt <csd@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, Alex Elder <alex.elder@linaro.org>, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Mar 12 2014, Matt Porter wrote:
> On Mon, Sep 23, 2013 at 10:20:35AM -0700, Christian Daudt wrote:
>> Currently ARCH_BCM has been used for Broadcom
>> Mobile V7 based SoCs. In order to allow other Broadcom
>> SoCs to also use mach-bcm directory and files, this patch
>> renames the original ARCH_BCM to ARCH_BCM_MOBILE, and
>> uses ARCH_BCM to define any Broadcom chip residing
>> in mach-bcm directory.
>> 
>> Signed-off-by: Christian Daudt <bcm@fixthebug.org>
>> Acked-by: Olof Johansson <olof@lixom.net>
>
> Hi Chris,
>
> Could you please take this patch for 3.15? It was missed for 3.14.

Sorry about that -- it's in mmc-next for 3.15 now.

Thanks,

- Chris.
-- 
Chris Ball   <chris@printf.net>   <http://printf.net/>
