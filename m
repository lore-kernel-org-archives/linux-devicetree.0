From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v7 3/3] ARM: dts: rk3288: add VOP iommu nodes
Date: Wed, 05 Nov 2014 21:30:30 +0100
Message-ID: <1838591.iyIlAuCyiq@diego>
References: <1414983209-2472-1-git-send-email-djkurtz@chromium.org> <1414983209-2472-4-git-send-email-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414983209-2472-4-git-send-email-djkurtz@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Joerg Roedel <joro@8bytes.org>, Simon Xue <xxm@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/Rockchip SoC..." <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Montag, 3. November 2014, 10:53:29 schrieb Daniel Kurtz:
> Add device nodes for the VOP iommus.
> Device nodes for other iommus will be added in later patches.
> 
> The iommu nodes use the #iommu-cells property as described in:
>   Documentation/devicetree/bindings/iommu/iommu.txt
> 
> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
> Signed-off-by: Simon Xue <xxm@rock-chips.com>

I've applied this patch to my dts branch for 3.19
