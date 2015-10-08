From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/4] dt-bindings: Document the STM32 DMA bindings
Date: Thu, 08 Oct 2015 17:43:11 +0200
Message-ID: <13614799.2Hi64P0fJ2@wuerfel>
References: <1444317612-818-1-git-send-email-cedric.madianga@gmail.com> <1444317612-818-2-git-send-email-cedric.madianga@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444317612-818-2-git-send-email-cedric.madianga@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: M'boumba Cedric Madianga <cedric.madianga@gmail.com>, mcoquelin.stm32@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, vinod.koul@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 08 October 2015 17:20:09 M'boumba Cedric Madianga wrote:
> +Each dmas request consists of 5 cells:
> +1. A phandle pointing to the STM32 DMA controller
> +2. The channel id
> +3. The request line number
> +4. A 32bit mask specifying the DMA channel configuration
> 

It's fairly unusual to encode the channel id here, rather than
letting the driver pick one. Is that actually required here?

	Arnd
