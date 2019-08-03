From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] bus: imx-weim: optionally enable burst clock mode
Date: Sat, 3 Aug 2019 10:19:25 +0200
Message-ID: <20190803081924.GE8870@X250.getinternet.no>
References: <20190712204316.16783-1-TheSven73@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190712204316.16783-1-TheSven73@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 12, 2019 at 04:43:15PM -0400, Sven Van Asbroeck wrote:
> To enable burst clock mode, add the fsl,burst-clk-enable
> property to the weim bus's devicetree node.
> 
> Example:
> weim: weim@21b8000 {
> 	compatible = "fsl,imx6q-weim";
> 	reg = <0x021b8000 0x4000>;
> 	clocks = <&clks 196>;
> 	#address-cells = <2>;
> 	#size-cells = <1>;
> 	ranges = <0 0 0x08000000 0x08000000>;
> 	fsl,weim-cs-gpr = <&gpr>;
> 	fsl,burst-clk-enable;
> 
> 	client-device@0,0 {
> 		compatible = "something";
> 		reg = <0 0 0x02000000>;
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		bank-width = <2>;
> 		fsl,weim-cs-timing = <0x00620081 0x00000001 0x1c022000
> 				0x0000c000 0x1404a38e 0x00000000>;
> 	};
> };
> 
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>

Applied both, thanks.
