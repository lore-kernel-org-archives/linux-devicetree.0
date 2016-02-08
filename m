From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/7] [PATCH] MIPS: OCTEON: Add support for OCTEON III
 interrupt  controller.
Date: Mon, 8 Feb 2016 13:14:48 -0600
Message-ID: <20160208191448.GA19126@rob-hp-laptop>
References: <1454632974-7686-1-git-send-email-ddaney.cavm@gmail.com>
 <1454632974-7686-7-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454632974-7686-7-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 04, 2016 at 04:42:53PM -0800, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
> 
> Add irq_chip support for both IPI and "normal" interrupts of the CIU3
> controller.  Document the device tree binding for the CIU3.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: devicetree@vger.kernel.org
> Cc: Thomas Gleixner <tglx@linutronix.de>
> ---
>  .../devicetree/bindings/mips/cavium/ciu3.txt       |  27 +

Acked-by: Rob Herring <robh@kernel.org>

>  arch/mips/cavium-octeon/octeon-irq.c               | 651 ++++++++++++++++++++-
>  arch/mips/include/asm/octeon/octeon.h              |   2 +
>  3 files changed, 679 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/mips/cavium/ciu3.txt
