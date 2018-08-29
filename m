From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: perfection vop property define for px30
Date: Wed, 29 Aug 2018 14:57:13 +0200
Message-ID: <7278966.mqSsajnGxb@phil>
References: <1535512642-81253-1-git-send-email-hjc@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535512642-81253-1-git-send-email-hjc@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sandy Huang <hjc@rock-chips.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liang Chen <cl@rock-chips.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 29. August 2018, 05:17:13 CEST schrieb Sandy Huang:
> Add display ports for display-subsystem and add reset property
> for vop node, if missing this two define, drm driver can't
> probe sucess.
> 
> Signed-off-by: Sandy Huang <hjc@rock-chips.com>

with a bit of cleanup applied for 4.20

Thanks
Heiko
