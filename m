From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: imx53-qsb: disable 1.2GHz OPP
Date: Wed, 12 Sep 2018 14:45:51 +0800
Message-ID: <20180912064548.GB28239@dragon>
References: <20180910125056.30813-1-s.hauer@pengutronix.de>
 <20180912062301.3972-1-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180912062301.3972-1-s.hauer@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 12, 2018 at 08:23:01AM +0200, Sascha Hauer wrote:
> The maximum CPU frequency for the i.MX53 QSB is 1GHz, so disable the
> 1.2GHz OPP. This makes the board work again with configs that have
> cpufreq enabled like imx_v6_v7_defconfig on which the board stopped
> working with the addition of cpufreq-dt support.
> 
> Fixes: 791f416608 ("ARM: dts: imx53: add cpufreq-dt support")
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied, thanks.
