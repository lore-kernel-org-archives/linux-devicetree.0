From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [RFCv3 1/3] dt-bindings: interconnect: Add bindings for imx
Date: Wed, 7 Aug 2019 22:35:07 +0000
Message-ID: <VI1PR04MB7023CE6687A6D31D8BCB3E4EEED40@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <cover.1565088423.git.leonard.crestez@nxp.com>
 <90561b14af66655ca859d387b3808a84641eea4e.1565088423.git.leonard.crestez@nxp.com>
 <123536fc-c3ce-5bfe-fbd6-20cde0c13cc0@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, =?iso-8859-2?Q?Artur_=A6wigo=F1?= <a.swigon@partner.samsung.com>, Jacky Bai <ping.bai@nxp.com>, Saravana Kannan <saravanak@google.com>, Anson Huang <anson.huang@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Alexandre Bailon <abailon@baylibre.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>d
List-Id: devicetree@vger.kernel.org

On 8/7/2019 6:16 PM, Georgi Djakov wrote:

> Please put some commit text.

Will fix

>> +properties:
>> +  compatible:
>> +    contains:
>> +      enum:
>> +        - fsl,imx8mm-interconnect
> 
> Maybe fsl,imx8mm-busfreq? I thought it's called busfreq in downstream, but it's
> up to you.

In the vendor tree busfreq is effectively its own subsystem with its own 
API calls used by imx drivers. As part of replacing this with standard 
devfreq + interconnect in upstream the old name should go away.

--
Regards,
Leonard
