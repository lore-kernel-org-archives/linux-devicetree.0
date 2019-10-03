From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 5/6] arm64: dts: rockchip: Rename vcc12v_sys into dc_12v for roc-rk3399-pc
Date: Fri, 04 Oct 2019 00:49:42 +0200
Message-ID: <2645663.MEMbyMBloX@phil>
References: <20190919052822.10403-1-jagan@amarulasolutions.com> <20190919052822.10403-6-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919052822.10403-6-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Levin Du <djw@t-chip.com.cn>, Akash Gajjar <akash@openedev.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Da Xue <da@lessconfused.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 19. September 2019, 07:28:21 CEST schrieb Jagan Teki:
> It is always better practice to follow regulator naming conventions
> as per the schematics for future references.
> 
> This would indeed helpful to review and check the naming convention
> directly on schematics, both for the code reviewers and the developers.
> 
> So, rename vcc12v_sys into dc_12v as per rk3399 power tree as per
> roc-rk3399-pc schematics.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

applied for 5.5 (with the filename changed to the current one of course)

Thanks
Heiko
