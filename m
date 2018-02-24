From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [RFC] ARM: dts: imx28-tx28: Pass the memory unit name
Date: Sat, 24 Feb 2018 16:29:27 +0800
Message-ID: <20180224082926.GJ3217@dragon>
References: <1518882103-17137-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1518882103-17137-1-git-send-email-festevam@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
List-Id: devicetree@vger.kernel.org

On Sat, Feb 17, 2018 at 01:41:43PM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Pass the memory unit name in order to fix the following
> dtc warning with W=1:
> 
> arch/arm/boot/dts/imx28-tx28.dtb: Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Applied, thanks.
