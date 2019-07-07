From: Aleix Roca Nonell <kernelrocks@gmail.com>
Subject: Re: [PATCH 2/6] irqchip: Add Realtek RTD129x intc driver
Date: Sun, 7 Jul 2019 17:46:17 +0200
Message-ID: <20190707154617.GA18436@arks.localdomain>
References: <20190707132256.GC13340@arks.localdomain>
 <baeb2dd8-0382-01ad-514b-982c0f123e6e@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <baeb2dd8-0382-01ad-514b-982c0f123e6e@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 07, 2019 at 03:27:16PM +0200, Andreas Färber wrote:
> Am 07.07.19 um 15:22 schrieb Aleix Roca Nonell:
> > This driver adds support for the RTD1296 and RTD1295 interrupt
> > controller (intc). It is based on both the BPI-SINOVOIP project and
> > Andreas Färber's previous attempt to submit a similar driver.
> 
> Doing that without my Signed-off-by and Copyright is certainly not okay.
> It is also lacking a clear description of what you changed from my last
> submission or the post-submission GitHub version adressing review
> comments, which broke.

I'm really sorry about that, because I rewrote the code (almost) from
scratch (given that I wasn't aware of this previous attempt when I
started working with it) I was not sure if it was necessary. I will
address this in the next version of the patch series.

Thank you and sorry for the inconvenience.

> 
> Regards,
> Andreas
> 
> -- 
> SUSE Linux GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
> HRB 21284 (AG Nürnberg)
