From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] dt: dma: Add DT binding document for jz4780-dma
Date: Thu, 29 Jan 2015 14:10:36 +0100
Message-ID: <2670922.EEM3IMjO9B@wuerfel>
References: <1422533980-42761-1-git-send-email-Zubair.Kakakhel@imgtec.com> <1422533980-42761-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422533980-42761-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: vinod.koul@intel.com, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 29 January 2015 12:19:38 Zubair Lutfullah Kakakhel wrote:
> 
> +1. Transmit request type: The DMA request type for transfers to the device on
> +   the allocated channel, as defined in the SoC documentation. If set to 0,
> +   transfers to the device will not be allowed on the channel.
> +
> +2. Receive request type: The DMA request type for transfers from the device on
> +   the allocated channel, as defined in the SoC documentation. If set to 0,
> +   transfers from the device will not be allowed on the channel.

It's fairly unusual to have separate fields for these two, most other
driver just use one. What would be a use-case for passing both?

	Arnd
