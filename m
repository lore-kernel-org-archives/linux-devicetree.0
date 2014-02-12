From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] BCM2835: Add dmaengine driver to device tree
Date: Tue, 11 Feb 2014 22:05:06 -0700
Message-ID: <52FB0102.3080108@wwwdotorg.org>
References: <52D3C9EF.1030901@koalo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <52D3C9EF.1030901@koalo.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Meier <florian.meier@koalo.de>
Cc: linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 01/13/2014 04:11 AM, Florian Meier wrote:
> This adds the definitions for the BCM2835 dmaengine driver
> to the device tree. The dma-channel-mask is currently
> fixed. Later it should be set via the firmware.

I've applied patch 1, and the part of patch 2 which touches bcm2835.dtsi
to bcm2835's for-3.15/dt branch, with minor fixes.
