From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: RE: [PATCH 2/7] dt-bindings: devfreq: Add bindings for generic imx
 buses
Date: Tue, 13 Aug 2019 11:25:59 +0900
Message-ID: <20190813022559epcms1p22c4bf62a5ac36826c515e1f89887e071@epcms1p2>
References: <97b0bff95ddb85b06ef3d2f8079faa36562a956d.1565633880.git.leonard.crestez@nxp.com>
 <cover.1565633880.git.leonard.crestez@nxp.com>
 <CGME20190812185002epcas1p1c528b12d20771cf4887907fdfd716e22@epcms1p2>
Reply-To: myungjoo.ham@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <97b0bff95ddb85b06ef3d2f8079faa36562a956d.1565633880.git.leonard.crestez@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leonard Crestez <leonard.crestez@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Artur Swigon <a.swigon@partner.samsung.com>, Abel Vesa <abel.vesa@nxp.com>, Saravana Kannan <saravanak@google.com>, Anson Huang <Anson.Huang@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Will Deacon <will@kernel.org>, Alexandre Bailon <abailon@baylibre.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Georgi Djakov <georgi.djakov@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jacky Bai <ping.bai@nxp.co>
List-Id: devicetree@vger.kernel.org

>Add initial dt bindings for the interconnects inside i.MX chips.
>Multiple external IPs are involved but SOC integration means the
>software controllable interfaces are very similar.
>
>This is initially only for imx8mm but add an "fsl,imx8m-nic" fallback
>similar to exynos-bus.
>
>Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
>---
> .../devicetree/bindings/devfreq/imx.yaml      | 50 +++++++++++++++++++
> 1 file changed, 50 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/devfreq/imx.yaml

Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>
