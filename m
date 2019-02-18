From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 1/4] dt-bindings: perf: imx8-ddr: add imx8qxp ddr
 performance monitor
Date: Mon, 18 Feb 2019 10:56:44 -0600
Message-ID: <20190218165644.GA20200@bogus>
References: <1550253761-26841-1-git-send-email-Frank.Li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1550253761-26841-1-git-send-email-Frank.Li@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Frank Li <frank.li@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, 15 Feb 2019 18:03:08 +0000, Frank Li wrote:
> Added binding doc for imx8qxp ddr performance monitor
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v4 to v4
> * remove "standard xxx"
> 
> Change from v2 to v3
> * ddr_pmu0 -> ddr-pmu
> 
>  .../devicetree/bindings/perf/fsl-imx-ddr.txt       | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/fsl-imx-ddr.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
