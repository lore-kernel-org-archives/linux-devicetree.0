From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm: dts: imx: Add missing #sound-dai-cells for sgtl5000
 codec
Date: Thu, 8 Mar 2018 16:33:01 +0800
Message-ID: <20180308083300.GU3217@dragon>
References: <20180301202537.30571-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180301202537.30571-1-robh@kernel.org>
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
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, arm@kernel.org, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 01, 2018 at 02:25:33PM -0600, Rob Herring wrote:
> dtc now warns about missing #sound-dai-cells:
> 
> arch/arm/boot/dts/imx6ul-geam.dtb: Warning (sound_dai_property): /sound/simple-audio-card,codec: Missing property '#sound-dai-cells' in node /soc/aips-bus@2100000/i2c@21a0000/codec@a or bad phandle (referred from sound-dai[0])
> arch/arm/boot/dts/imx6ul-isiot-emmc.dtb: Warning (sound_dai_property): /sound/simple-audio-card,codec: Missing property '#sound-dai-cells' in node /soc/aips-bus@2100000/i2c@21a0000/codec@a or bad phandle (referred from sound-dai[0])
> arch/arm/boot/dts/imx6ul-isiot-nand.dtb: Warning (sound_dai_property): /sound/simple-audio-card,codec: Missing property '#sound-dai-cells' in node /soc/aips-bus@2100000/i2c@21a0000/codec@a or bad phandle (referred from sound-dai[0])
> 
> Lots of i.MX boards use the SGTL5000 codec, but not all get the warning
> because only some reference the codec with "sound-dai" property. However,
> the codec should always provide #sound-dai-cells regardless, so fix all
> the occurrences.
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied, thanks.
