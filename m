From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH RESEND V4 1/2] dt-bindings: firmware: imx-scu: remove
 unused resources from scu resource table
Date: Mon, 4 Mar 2019 09:40:06 +0800
Message-ID: <20190304014005.GU26041@dragon>
References: <1551228502-1535-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1551228502-1535-1-git-send-email-Anson.Huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 27, 2019 at 12:53:04AM +0000, Anson Huang wrote:
> Removes below resources which were defined during
> pre-silicon phase and the real silicons do NOT have
> them, they have never been used, latest system
> controller firmware also removed them:
> 
> 	IMX_SC_R_DC_0_CAPTURE0
> 	IMX_SC_R_DC_0_CAPTURE1
> 	IMX_SC_R_DC_0_INTEGRAL0
> 	IMX_SC_R_DC_0_INTEGRAL1
> 	IMX_SC_R_DC_0_FRAC1
> 	IMX_SC_R_DC_1_CAPTURE0
> 	IMX_SC_R_DC_1_CAPTURE1
> 	IMX_SC_R_DC_1_INTEGRAL0
> 	IMX_SC_R_DC_1_INTEGRAL1
> 	IMX_SC_R_DC_1_FRAC1
> 	IMX_SC_R_GPU_3_PID0
> 	IMX_SC_R_M4_0_SIM
> 	IMX_SC_R_M4_0_WDOG
> 	IMX_SC_R_M4_1_SIM
> 	IMX_SC_R_M4_1_WDOG
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Applied both, thanks.
