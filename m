From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx7s: add spba-bus abstraction
Date: Wed, 28 Feb 2018 15:00:15 +0800
Message-ID: <20180228070014.GL3217@dragon>
References: <20180227163049.18809-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180227163049.18809-1-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Agner <stefan@agner.ch>
Cc: fabio.estevam@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Tue, Feb 27, 2018 at 05:30:49PM +0100, Stefan Agner wrote:
> According to the i.MX 7Solo/Dual Application Processor Reference
> Manual the ECSPI1/2/3, UART1/2/3 and SAI1/2/3 peripherals are
> connected through the SPBA bus. Other similar SoCs such as i.MX 6UL
> add this bus abstraction. This adds the bus also to the i.MX 7
> device tree.
> 
> The i.MX SDMA driver uses this abstraction to configure watermark
> levels slightly differently, so this might change behavior slightly.
> There have no issues been observed before or after the patch.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied, thanks.
