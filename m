From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: fsl: Fix I2C and SPI bus warnings
Date: Wed, 26 Sep 2018 17:09:18 +0800
Message-ID: <20180926090916.GC26692@dragon>
References: <20180913181245.25484-19-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180913181245.25484-19-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Li Yang <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 13, 2018 at 01:12:43PM -0500, Rob Herring wrote:
> dtc has new checks for I2C and SPI buses. Fix the SPI bus node names
> and warnings in unit-addresses.
> 
> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: Warning (i2c_bus_reg): /soc/i2c@2180000/eeprom@57: I2C bus unit address format error, expected "53"
> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: Warning (i2c_bus_reg): /soc/i2c@2180000/eeprom@56: I2C bus unit address format error, expected "52"
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Li Yang <leoyang.li@nxp.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied, thanks.
