From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] clk: imx: imx7d: add the Keypad Port module clock
Date: Mon, 5 Mar 2018 16:22:44 -0600
Message-ID: <20180305222244.xa42gzjru2ysezyu@rob-hp-laptop>
References: <20180227160544.11446-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180227160544.11446-1-stefan@agner.ch>
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
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 27, 2018 at 05:05:43PM +0100, Stefan Agner wrote:
> According to the i.MX7D Reference Manual, the Keypad Port module
> (KPP) requires this clock gate to be enabled.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/clk/imx/clk-imx7d.c             | 1 +
>  include/dt-bindings/clock/imx7d-clock.h | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
