From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/4] arm64: dts: ls1088a: Fix incorrect I2C clock divider
Date: Mon, 19 Aug 2019 09:43:28 +0200
Message-ID: <20190819074327.GD5999@X250>
References: <20190806084223.23543-1-chuanhua.han@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190806084223.23543-1-chuanhua.han@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanhua Han <chuanhua.han@nxp.com>
Cc: leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 06, 2019 at 04:42:20PM +0800, Chuanhua Han wrote:
> Ls1088a platform, the i2c input clock is actually platform pll CLK / 8
> (this is the hardware connection), other clock divider can not get the
> correct i2c clock, resulting in the output of SCL pin clock is not
> accurate.
> 
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>

Applied all, thanks.
