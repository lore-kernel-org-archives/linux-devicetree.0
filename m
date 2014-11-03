From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 03/17] irqchip: irq-armada-370-xp: use proper return value
 for ->set_affinity()
Date: Mon, 03 Nov 2014 18:20:00 +0100
Message-ID: <5457B940.2030105@free-electrons.com>
References: <1414151970-6626-1-git-send-email-thomas.petazzoni@free-electrons.com> <1414151970-6626-4-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414151970-6626-4-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On 24/10/2014 13:59, Thomas Petazzoni wrote:
> The ->set_affinity() hook of 'struct irq_chip' is supposed to return
> one of IRQ_SET_MASK_OK or IRQ_SET_MASK_OK_NOCOPY. However, the code
> currently simply returns 0. This patch fixes that by using
> IRQ_SET_MASK_OK, which tells the IRQ core that it is responsible for
> updating irq_data.affinity.

It seems that this driver is not the only one to return 0 instead of
IRQ_SET_MASK_OK in the >set_affinity(). I found also irq-xtensa-mx.c,
irq-metag.c and irq-metag-ext.c.


> 
> Note that this patch does not cause any change to the compiled code,
> as IRQ_SET_MASK_OK has the value 0. This is therefore just a simple
> cleanup.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/irqchip/irq-armada-370-xp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Gregory CLEMENT <gregory.clement@free-electrons.com>


Thanks,

Gregory

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
