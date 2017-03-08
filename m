From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: imx6q-cm-fx6: add analog audio support
Date: Wed, 8 Mar 2017 12:49:26 +0100
Message-ID: <20170308114925.GE12997@x250>
References: <c53afd927fae4a1dbd84ab8122e6c794@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <c53afd927fae4a1dbd84ab8122e6c794@rwthex-s1-b.rwth-ad.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: christopher.spinrath@rwth-aachen.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Valentin Raevsky <valentin@compulab.co.il>, linux@armlinux.org.uk, robh+dt@kernel.org, grinberg@compulab.co.il, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 08, 2017 at 09:44:04PM +0100, christopher.spinrath@rwth-aachen.de wrote:
> From: Valentin Raevsky <valentin@compulab.co.il>
> 
> The cm-fx6 module has an onboard Wolfson wm8731 codec which is muxed
> to the ssi2 controller. Unlike most (all?) supported i.MX6 board/codec
> combinations the wm8731 is operated in slave mode and the clock setup
> is static.
> 
> Add support for it.
> 
> Signed-off-by: Valentin Raevsky <valentin@compulab.co.il>
> [christopher.spinrath@rwth-aachen.de: enhanced commit message, ported
>   to upstream and some cleanup]
> Signed-off-by: Christopher Spinrath <christopher.spinrath@rwth-aachen.de>
> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>

Applied, thanks.
