From: Rob Herring <robh@kernel.org>
Subject: Re: [RFCv4 3/7] dt-bindings: devfreq: imx: Describe interconnect
 properties
Date: Mon, 23 Sep 2019 16:03:46 -0500
Message-ID: <CAL_JsqLj9FdoSwt7HZwoX42GS9RJ6Zeze=bUZs-tia2oS+OzUA@mail.gmail.com>
References: <cover.1566570260.git.leonard.crestez@nxp.com>
 <3f27038292c09c8bf07a086eac759132c100aedb.1566570260.git.leonard.crestez@nxp.com>
 <20190917201956.GA10780@bogus>
 <VI1PR04MB70237046A8DF88936C7A83F8EE850@VI1PR04MB7023.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <VI1PR04MB70237046A8DF88936C7A83F8EE850@VI1PR04MB7023.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Saravana Kannan <saravanak@google.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Alexandre Bailon <abailon@baylibre.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Georgi Djakov <georgi.djakov@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nx>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 23, 2019 at 12:42 PM Leonard Crestez
<leonard.crestez@nxp.com> wrote:
>
> On 17.09.2019 23:20, Rob Herring wrote:
> > On Fri, Aug 23, 2019 at 05:36:56PM +0300, Leonard Crestez wrote:
> >> The interconnect-node-id property is parsed by the imx interconnect
> >> driver to find nodes on which frequencies can be adjusted.
> >>
> >> Add #interconnect-cells so that device drivers can request paths from
> >> bus nodes instead of requiring a separate "virtual" node to represent
> >> the interconnect itself.
> >>
> >> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> >> ---
> >>   Documentation/devicetree/bindings/devfreq/imx-ddrc.yaml | 5 +++++
> >>   Documentation/devicetree/bindings/devfreq/imx.yaml      | 5 +++++
> >>   2 files changed, 10 insertions(+)
> >
> > Please combine this with the other series for devfreq support.
>
> I understand that having two series which add to the same bindings file
> is odd but the devfreq and interconnect parts are independent to a very
> large degree and devfreq can be useful on it's own.

To start with, I'm suspicious of any 'devfreq' binding because that's
a Linux thing. I somewhat expect that the interconnect binding should
replace the devfreq binding, but I haven't been able to investigate.

> The only reason devfreq bindings are updated is to avoid adding a
> "virtual" node for interconnect. Since DT is a big source of confusion
> here can you read https://patchwork.kernel.org/cover/11111865/#22883457
> and maybe offer some advice?

Design something that matches the structure of the h/w not how Linux
drivers happen to be structured. I can't tell what that is without any
context around adding a couple of properties. Nor do I have the time
to dig into each SoC vendor's bus structure if it's even documented
publicly.

I also don't follow why you need 'interconnect-node-id' and if you do,
it should be a common property.

Rob
