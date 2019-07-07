From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 2/6] irqchip: Add Realtek RTD129x intc driver
Date: Sun, 7 Jul 2019 15:27:16 +0200
Message-ID: <baeb2dd8-0382-01ad-514b-982c0f123e6e@suse.de>
References: <20190707132256.GC13340@arks.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707132256.GC13340@arks.localdomain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aleix Roca Nonell <kernelrocks@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am 07.07.19 um 15:22 schrieb Aleix Roca Nonell:
> This driver adds support for the RTD1296 and RTD1295 interrupt
> controller (intc). It is based on both the BPI-SINOVOIP project and
> Andreas Färber's previous attempt to submit a similar driver.

Doing that without my Signed-off-by and Copyright is certainly not okay.
It is also lacking a clear description of what you changed from my last
submission or the post-submission GitHub version adressing review
comments, which broke.

Regards,
Andreas

-- 
SUSE Linux GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
