From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 06/13] ARM: dts: rv1108: Add GMAC support
Date: Mon, 26 Nov 2018 10:14:02 +0100
Message-ID: <1588360.6TRC2vKZya@phil>
References: <20181125211907.9895-1-otavio@ossystems.com.br> <20181125211907.9895-6-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181125211907.9895-6-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Am Sonntag, 25. November 2018, 22:19:00 CET schrieb Otavio Salvador:
> Add GMAC support for RV1108.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

applied for 4.21 after modifying the subject a bit and adding
a comment explaining that the rv1108 only has that rmii interface.

While the dwmac is definitly a big improvement over the arc-emac
it is still surprising that the gbit mac only gets a 100mbit phy interface.


Heiko
