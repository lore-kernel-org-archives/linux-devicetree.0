From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mq-evk: Unbypass audio_pll1
Date: Sat, 3 Aug 2019 16:56:45 +0200
Message-ID: <20190803145644.GO8870@X250.getinternet.no>
References: <20190728140817.12509-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190728140817.12509-1-daniel.baluta@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: devicetree@vger.kernel.org, baruch@tkos.co.il, abel.vesa@nxp.com, ccaione@baylibre.com, andrew.smirnov@gmail.com, s.hauer@pengutronix.de, angus@akkea.ca, linux-kernel@vger.kernel.org, linux-imx@nxp.com, festevam@gmail.com, shengjiu.wang@nxp.com, linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Sun, Jul 28, 2019 at 05:08:17PM +0300, Daniel Baluta wrote:
> Making audio_pll1 parent of audio_pll1_bypass, will allow
> setting rates multiple of 8000 for children.
> 
> After unbypass clk hierarchy looks like this:
>  * osc_25m
>    * audio_pll1
>      * audio_pll1_bypass
>        * audio_pll1_out
>          * sai2
>            * sai2_root_clk
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Applied, thanks.
