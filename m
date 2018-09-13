From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] arm64: dts: broadcom: Fix I2C and SPI bus warnings
Date: Thu, 13 Sep 2018 15:06:28 -0700
Message-ID: <e86d75f7-d4b8-079b-9b95-b30501665078@gmail.com>
References: <20180913181245.25484-18-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180913181245.25484-18-robh@kernel.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Scott Branden <sbranden@broadcom.com>
List-Id: devicetree@vger.kernel.org



On 09/13/18 11:12, Rob Herring wrote:
> dtc has new checks for I2C and SPI buses. Fix the warnings in node names
> and unit-addresses.
> 
> arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb: Warning (i2c_bus_reg): /hsls/i2c@e0000/pcf8574@20: I2C bus unit address format error, expected "27"
> arch/arm64/boot/dts/broadcom/stingray/bcm958742t.dtb: Warning (i2c_bus_reg): /hsls/i2c@e0000/pcf8574@20: I2C bus unit address format error, expected "27"
> arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb: Warning (spi_bus_bridge): /hsls/ssp@180000: node name for SPI buses should be 'spi'
> arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb: Warning (spi_bus_bridge): /hsls/ssp@190000: node name for SPI buses should be 'spi'
> 
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: Jon Mason <jonmason@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to devicetree-arm64/next, thanks Rob!

-- 
Florian
