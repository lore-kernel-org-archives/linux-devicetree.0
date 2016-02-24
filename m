From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 0/2] ARM: dts: rockchip: fix some interrupts on rk3288
Date: Wed, 24 Feb 2016 14:37:05 +0100
Message-ID: <2022698.P5dgKXtQhu@phil>
References: <1456234860-18832-1-git-send-email-john@metanate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456234860-18832-1-git-send-email-john@metanate.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Keeping <john@metanate.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 23. Februar 2016, 13:40:58 schrieb John Keeping:
> None of these are used by drivers so these don't fix any bugs but maybe
> they'll save someone debugging time in the future.
> 
> John Keeping (2):
>   ARM: dts: rockchip: fix MIPI interrupt on rk3288
>   ARM: dts: rockchip: fix audio interrupts on rk3288

applied both to my dts32 branch for 4.6 after verifying against the TRM as 
well.

Thanks for catching these
Heiko
