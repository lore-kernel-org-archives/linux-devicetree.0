From: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: add 96boards RK3399 Ficus
 board
Date: Fri, 06 Jul 2018 10:46:55 -0300
Message-ID: <cceccdfefbcf9a5dcc5d683e7c7d4a2d16949344.camel@collabora.com>
References: <20180705150818.29931-1-ezequiel@collabora.com>
 <20180705150818.29931-3-ezequiel@collabora.com>
 <20180705234124.GA32051@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180705234124.GA32051@rob-hp-laptop>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 2018-07-05 at 17:41 -0600, Rob Herring wrote:
> On Thu, Jul 05, 2018 at 12:08:18PM -0300, Ezequiel Garcia wrote:
> > The RK3399 Ficus board is an Enterprise Edition board
> > manufactured by Vamrs Ltd., based on the Rockchip RK3399 SoC.
> > 
> > The board exposes a bunch of nice peripherals, including
> > SATA, HDMI, MIPI CSI, Ethernet, WiFi, and PCIe.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > 
[snip]
> > +
> > +&i2c0 {
> > +	clock-frequency = <400000>;
> > +	i2c-scl-rising-time-ns = <168>;
> > +	i2c-scl-falling-time-ns = <4>;
> > +	status = "okay";
> > +
> > +	vdd_cpu_b: syr827@40 {
> 
> regulator@40
> 

OK.

> > +		compatible = "silergy,syr827";
> > +		reg = <0x40>;
> > +		fcs,suspend-voltage-selector = <1>;
> 
> Strange to have a different vendor for this property...
> 

It's because this driver has also a Fairchild compatible
"fcs,fan53555".

> Otherwise,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Thanks Rob!
