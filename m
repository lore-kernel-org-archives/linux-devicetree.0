From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [RFC v2 3/7] irqchip/rtl8186: Add RTL8186 interrupt controller
 driver
Date: Mon, 1 Oct 2018 11:47:51 +0100
Message-ID: <a0c812a0-3237-1cdc-049f-0ebe4c0ceccb@arm.com>
References: <20181001102952.7913-1-yasha.che3@gmail.com>
 <20181001102952.7913-4-yasha.che3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181001102952.7913-4-yasha.che3@gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Yasha Cherikovsky <yasha.che3@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/10/18 11:29, Yasha Cherikovsky wrote:
> The Realtek RTL8186 SoC is a MIPS based SoC
> used in some home routers [1][2].
> 
> This adds a driver to handle the interrupt controller
> on this SoC.
> 
> [1] https://www.linux-mips.org/wiki/Realtek_SOC#Realtek_RTL8186
> [2] https://wikidevi.com/wiki/Realtek_RTL8186
> 
> Signed-off-by: Yasha Cherikovsky <yasha.che3@gmail.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-mips@linux-mips.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>   drivers/irqchip/Kconfig       |   5 ++
>   drivers/irqchip/Makefile      |   1 +
>   drivers/irqchip/irq-rtl8186.c | 107 ++++++++++++++++++++++++++++++++++
>   3 files changed, 113 insertions(+)
>   create mode 100644 drivers/irqchip/irq-rtl8186.c

Acked-by: Marc Zyngier <marc.zyngier@arm.com>

Please let me know how you want this to be merged once the rest of the 
series has been reviewed.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
