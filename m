From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 3/4] ARM: dts: rockchip: Add UART DMA support for rv1108
Date: Tue, 27 Nov 2018 01:12:05 +0100
Message-ID: <2153234.84VALTjZKd@phil>
References: <20181126173506.24068-1-otavio@ossystems.com.br> <20181126173506.24068-3-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181126173506.24068-3-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Am Montag, 26. November 2018, 18:35:05 CET schrieb Otavio Salvador:
> Pass the 'dmas' property to the UART ports so that DMA can
> be supported.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Tested-by: Fabio Berton <fabio.berton@ossystems.com.br>

applied for 4.21 after moving the dma-* below the clock*
alphabetical ordering and such :-)

Thanks
Heiko
