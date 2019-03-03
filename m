From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: enable HDMI CEC on rk3328
Date: Sun, 03 Mar 2019 14:53:14 +0100
Message-ID: <1731736.AI9y7MdPiA@phil>
References: <AM3PR03MB0966D220C0FEB19CBAE0D913AC770@AM3PR03MB0966.eurprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM3PR03MB0966D220C0FEB19CBAE0D913AC770@AM3PR03MB0966.eurprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonas Karlman <jonas@kwiboo.se>
Cc: "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Samstag, 2. März 2019, 17:37:09 CET schrieb Jonas Karlman:
> This patch enables HDMI CEC on RK3328 devices
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

applied for 5.2. I've added another sentence to the commit messsage for the
origin of the (unusual) cec clock, marking the vendor-kernel as source.

Heiko
