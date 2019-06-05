From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] irqchip: al-fic: Introduce Amazon's Annapurna
 Labs Fabric Interrupt Controller Driver
Date: Wed, 5 Jun 2019 14:50:55 +0200
Message-ID: <20190605125055.GA3184@kroah.com>
References: <1559731921-14023-1-git-send-email-talel@amazon.com>
 <1559731921-14023-3-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559731921-14023-3-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Talel Shenhar <talel@amazon.com>
Cc: nicolas.ferre@microchip.com, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, mchehab+samsung@kernel.org, robh+dt@kernel.org, davem@davemloft.net, shawn.lin@rock-chips.com, tglx@linutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, jonnyc@amazon.com, hhhawa@amazon.com, ronenk@amazon.com, hanochu@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 05, 2019 at 01:52:01PM +0300, Talel Shenhar wrote:
> --- /dev/null
> +++ b/drivers/irqchip/irq-al-fic.c
> @@ -0,0 +1,289 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/**

No need for kernel-doc format style here.

> + * Copyright 2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.

"or its affiliates"?  You know the answer to this, don't keep us in
suspense.  Put the proper copyright holder here please, otherwise this
is totally useless.

Well, copyright notices are technically useless anyway, but lawyers like
to cargo-cult with the best of them, so it should be correct at the
least.

thanks,

greg k-h
