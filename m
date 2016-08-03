From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: Remove use of skeleton.dtsi from
 bcm283x.dtsi
Date: Wed, 3 Aug 2016 18:57:01 +0200 (CEST)
Message-ID: <914380166.36980.cd778509-7d01-4a7c-93d2-94401387c355.open-xchange@email.1und1.de>
References: <1470233565-30154-1-git-send-email-ijc@hellion.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470233565-30154-1-git-send-email-ijc@hellion.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ijc@hellion.org.uk>, linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will.deacon@arm.com>, Lee Jones <lee@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, Eric Anholt <eric@anholt.net>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, arm@kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Mark Rutland <mark.rutland@arm.com>, linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ian,

> Ian Campbell <ijc@hellion.org.uk> hat am 3. August 2016 um 16:12 geschrieben:
> 
> 
> This file is included from DTS files under arch/arm64 too (via
> broadcom/bcm2837-rpi-3-b.dts and broadcom/bcm2837.dtsi). There is a desire
> not to have skeleton.dtsi for ARM64. See commit 3ebee5a2e141 ("arm64: dts:
> kill skeleton.dtsi") for rationale for its removal.
> 
> As well as the addition of #*-cells also requires adding the device_type to
> the rpi memory node explicitly.
> 
> Note that this change results in the removal of an empty /aliases node from
> bcm2835-rpi-a.dtb and bcm2835-rpi-a-plus.dtb. I have no hardware to check
> if this is a problem or not.
> 
> It also results in some reordering of the nodes in the DTBs (the /aliases
> and /memory nodes come later). This isn't supposed to matter but, again,
> I've no hardware to check if it is true in this particular case.

i tested this patch with a Raspberry Pi Model B successfully.

Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
