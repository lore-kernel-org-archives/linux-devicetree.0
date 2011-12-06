From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH v3 1/3] ARM: at91/aic: add irq domain and device tree
 support
Date: Tue, 6 Dec 2011 07:34:16 +0100
Message-ID: <20111206063416.GI9192@game.jcrosoft.org>
References: <1322590066-430-1-git-send-email-nicolas.ferre@atmel.com>
 <1322754127-15206-1-git-send-email-nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1322754127-15206-1-git-send-email-nicolas.ferre@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: linux-arm-kernel@lists.infradead.org, robherring2@gmail.com, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 16:42 Thu 01 Dec     , Nicolas Ferre wrote:
> Add an irqdomain for the AIC interrupt controller.
> The device tree support is mapping the registers and
> is using the irq_domain_simple_ops to manage hwirq
> translation.
> The documentation is describing the meaning of the
> two cells required for using this "interrupt-controller"
> in a device tree node.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> ---
> This patch should go on top of Jamie's patch:
> "irqdomain: export irq_domain_simple_ops for !CONFIG_OF"
> https://lkml.org/lkml/2011/12/1/109
> 
> v3: - change number of cells to define an AIC interrupt (irq trigger type)
>     - change current .dtsi files to match specification
>     - use irq_domain_simple_ops (for DT mapping)
> 
> v2: - use of_irq_init() function for device tree probing
>     - add documentation
>     - use own simple struct irq_domain_ops
just one stuff missing the definition of the external irq

Best Regards,
J.
