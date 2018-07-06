From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: add 96boards RK3399 Ficus
 board
Date: Fri, 06 Jul 2018 15:49:41 +0200
Message-ID: <5173203.kQ7HMvCHTa@phil>
References: <20180705150818.29931-1-ezequiel@collabora.com>
 <20180705234124.GA32051@rob-hp-laptop>
 <cceccdfefbcf9a5dcc5d683e7c7d4a2d16949344.camel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cceccdfefbcf9a5dcc5d683e7c7d4a2d16949344.camel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 6. Juli 2018, 15:46:55 CEST schrieb Ezequiel Garcia:
> On Thu, 2018-07-05 at 17:41 -0600, Rob Herring wrote:
> > On Thu, Jul 05, 2018 at 12:08:18PM -0300, Ezequiel Garcia wrote:
> > > The RK3399 Ficus board is an Enterprise Edition board
> > > manufactured by Vamrs Ltd., based on the Rockchip RK3399 SoC.
> > > 
> > > The board exposes a bunch of nice peripherals, including
> > > SATA, HDMI, MIPI CSI, Ethernet, WiFi, and PCIe.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> > > 
> [snip]
> > > +
> > > +&i2c0 {
> > > +	clock-frequency = <400000>;
> > > +	i2c-scl-rising-time-ns = <168>;
> > > +	i2c-scl-falling-time-ns = <4>;
> > > +	status = "okay";
> > > +
> > > +	vdd_cpu_b: syr827@40 {
> > 
> > regulator@40
> > 
> 
> OK.
> 
> > > +		compatible = "silergy,syr827";
> > > +		reg = <0x40>;
> > > +		fcs,suspend-voltage-selector = <1>;
> > 
> > Strange to have a different vendor for this property...
> > 
> 
> It's because this driver has also a Fairchild compatible
> "fcs,fan53555".

The Silergy regulators seem to be some sort of clone of
the Fairchild fan53555.
