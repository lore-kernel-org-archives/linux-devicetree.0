From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH 15/15] arm64: dts: allwinner: a64: bananapi-m64: Add
 Bluetooth device node
Date: Thu, 8 Nov 2018 09:35:57 +0100
Message-ID: <BB1D82EC-3F84-4C02-B230-32B331887F08@holtmann.org>
References: <20181107101308.7626-1-wens@csie.org>
 <20181107101308.7626-16-wens@csie.org>
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107101308.7626-16-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-sunxi@googlegroups.com, Loic Poulain <loic.poulain@gmail.com>, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Chen-Yu,

> The AP6212 is based on the Broadcom BCM43430 or BCM43438. The WiFi side
> identifies as BCM43430, while the Bluetooth side identifies as BCM43438.
> 
> The Bluetooth side is connected to UART1 in a 4 wire configuration. Same
> as the WiFi side, due to being the same chip and package, DLDO2 provides
> overall power via VBAT, and DLDO4 provides I/O power via VDDIO. The RTC
> clock output provides the LPO low power clock at 32.768 kHz.
> 
> This patch enables Bluetooth on this board, and also adds the missing
> LPO clock on the WiFi side. There is also a PCM connection for Bluetooth,
> but this is not covered here.

we need to figure out on how we want to describe the Bluetooth PCM settings in DT and how things are wired up. For the Bluetooth driver, we just have to send a few Broadcom commands to set up the Bluetooth side correctly.

Regards

Marcel
