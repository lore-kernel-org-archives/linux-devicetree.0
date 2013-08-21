Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-ee0-f44.google.com ([74.125.83.44]:51115 "EHLO
	mail-ee0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751984Ab3HUOyZ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2013 10:54:25 -0400
Received: by mail-ee0-f44.google.com with SMTP id b47so311536eek.17
        for <devicetree@vger.kernel.org>; Wed, 21 Aug 2013 07:54:22 -0700 (PDT)
Message-ID: <5214D49B.9070600@baylibre.com>
Date: Wed, 21 Aug 2013 16:54:19 +0200
From: Benoit Cousson <bcousson@baylibre.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/5]  ARM: OMAP: DTS/HWMOD/defconfig changes for USB3
References: <1377095494-15380-1-git-send-email-kishon@ti.com>
In-Reply-To: <1377095494-15380-1-git-send-email-kishon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, tony@atomide.com
Cc: balbi@ti.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, linux@arm.linux.org.uk, javier.martinez@collabora.co.uk, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Kishon,

On 21/08/2013 16:31, Kishon Vijay Abraham I wrote:
> From: Felipe Balbi <balbi@ti.com>
>
> With these patches (plus a few others on the driver side which
> will be going upstream soon) I could get functional USB3 with my
> omap5-uevm platform.
>
> Changes since v2:
> 	- added dt properties for enabling vbus/id interrupts and fixed
> vbus-supply value after SMPS10 is modeled as 2 regulators

Excellent, thanks for that super quick update. I've just applied it and 
will try to push it ASAP.
I've just slightly changed the subjects to have both ARM and OMAP in 
capital letters for consistency.

Tony,

I will update my pull-request now before Kevin and Olof pulled it.

Regards,
Benoit


> Changes since v1:
> 	- split ocp2scp dts and hwmod data into separate patches
> 	- reorganize the series in order to group DTS, hwmod and defconfig
> 	  changes
>
> Benoit Cousson (1):
>    arm: omap5: hwmod: add missing ocp2scp hwmod data
>
> Felipe Balbi (4):
>    arm: omap5: dts: fix reg property size
>    arm: omap5: dts: fix ocp2scp DTS data
>    arm: omap5: dts: add palmas-usb node
>    arm: omap2plus_defconfig: enable dwc3 and dependencies
>
>   arch/arm/boot/dts/omap5-uevm.dts           |   12 ++++++++
>   arch/arm/boot/dts/omap5.dtsi               |    9 +++---
>   arch/arm/configs/omap2plus_defconfig       |    9 ++++++
>   arch/arm/mach-omap2/omap_hwmod_54xx_data.c |   45 ++++++++++++++++++++++++++++
>   4 files changed, 71 insertions(+), 4 deletions(-)
>

