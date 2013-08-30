From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 1/2] gpio: bcm281xx: Add GPIO driver
Date: Fri, 30 Aug 2013 10:03:17 +0200
Message-ID: <CACRpkdY-feNrJvL6_pbPtQ0Z1Q8ukaszqPMY4EPKhbuNgw0A1w@mail.gmail.com>
References: <1377820267-20050-1-git-send-email-markus.mayer@linaro.org>
 <1377820267-20050-2-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1377820267-20050-2-git-send-email-markus.mayer@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Device Tree List <devicetree@vger.kernel.org>, Linaro Patches <patches@linaro.org>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Christian Daudt <csd@broadcom.com>, Tim Kryger <tim.kryger@linaro.org>, Markus Mayer <mmayer@broadcom.com>, Matt Porter <matt.porter@linaro.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2013 at 1:51 AM, Markus Mayer <markus.mayer@linaro.org> wrote:

> diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
> index f112895..5819126 100644
> --- a/arch/arm/mach-bcm/Kconfig
> +++ b/arch/arm/mach-bcm/Kconfig
> @@ -9,7 +9,7 @@ config ARCH_BCM
>         select CLKSRC_OF
>         select GENERIC_CLOCKEVENTS
>         select GENERIC_TIME
> -       select GPIO_BCM
> +       select GPIO_BCM_KONA
>         select SPARSE_IRQ
>         select TICK_ONESHOT
>         help

No. I didn't ask you to move this hunk over to this patch.

Just the two hunks hitting:

- Kconfig
- Makefile

Further I only wanted *this* patch [1/3] to be renamed with
the gpio: prefix, not the other two.

The idea is:

Patch mainly touches drivers/gpio/* -> gpio: prefix
Patch mainly touches arch/arm/* -> ARM: prefix

Yours,
Linus Walleij
