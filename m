From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: imx6/7: Remove unit-address from anatop
 regulators
Date: Sun, 20 May 2018 20:23:54 +0800
Message-ID: <20180520122353.GT26863@dragon>
References: <1526304714-23821-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1526304714-23821-1-git-send-email-festevam@gmail.com>
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
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, May 14, 2018 at 10:31:54AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Remove unit-address and reg property from anatop regulators to fix
> the following DTC warnings with W=1:
> 
> arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (unique_unit_address): /soc/aips-bus@2000000/anatop@20c8000/regulator-vddcore@20c8140: duplicate unit-address (also used in node /soc/aips-bus@2000000/anatop@20c8000/regulator-vddpu@20c8140)
> arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (unique_unit_address): /soc/aips-bus@2000000/anatop@20c8000/regulator-vddcore@20c8140: duplicate unit-address (also used in node /soc/aips-bus@2000000/anatop@20c8000/regulator-vddsoc@20c8140)
> arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (unique_unit_address): /soc/aips-bus@2000000/anatop@20c8000/regulator-vddpu@20c8140: duplicate unit-address (also used in node /soc/aips-bus@2000000/anatop@20c8000/regulator-vddsoc@20c8140)
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Applied, thanks.
