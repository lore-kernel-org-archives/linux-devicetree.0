From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/3] ARM64: dts: meson-gxl: Enable Ethernet
Date: Mon, 14 Nov 2016 09:28:13 -0800
Message-ID: <7h60nq7yz6.fsf@baylibre.com>
References: <20161107104357.24428-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161107104357.24428-1-narmstrong@baylibre.com> (Neil
        Armstrong's message of "Mon, 7 Nov 2016 11:43:54 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: carlo@caione.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The Amlogic Meson GXL SoCs have an internal RMII PHY that is muxed with the
> external RGMII pins.
>
> The internal PHY is added in the GXL dtsi and support for each
> board is added in intermediate board family dtsi or final dts.

Tested external phy and internal phy (using p231 DT) on my p230 board.

Applied to v4.10/dt64

Kevin
