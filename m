From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [RFCv4 3/7] dt-bindings: devfreq: imx: Describe interconnect
 properties
Date: Tue, 24 Sep 2019 14:39:27 +0000
Message-ID: <VI1PR04MB7023FEED855FAA9707790B3AEE840@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <cover.1566570260.git.leonard.crestez@nxp.com>
 <3f27038292c09c8bf07a086eac759132c100aedb.1566570260.git.leonard.crestez@nxp.com>
 <20190917201956.GA10780@bogus>
 <VI1PR04MB70237046A8DF88936C7A83F8EE850@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <CAL_JsqLj9FdoSwt7HZwoX42GS9RJ6Zeze=bUZs-tia2oS+OzUA@mail.gmail.com>
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
To: Rob Herring <robh@kernel.org>, Georgi Djakov <georgi.djakov@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, =?iso-8859-2?Q?Artur_=A6wigo=F1?= <a.swigon@partner.samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Saravana Kannan <saravanak@google.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Alexandre Bailon <abailon@baylibre.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 24.09.2019 00:04, Rob Herring wrote:
> On Mon, Sep 23, 2019 at 12:42 PM Leonard Crestez
> <leonard.crestez@nxp.com> wrote:
>>
>> On 17.09.2019 23:20, Rob Herring wrote:
>>> On Fri, Aug 23, 2019 at 05:36:56PM +0300, Leonard Crestez wrote:
>>>> The interconnect-node-id property is parsed by the imx interconnect
>>>> driver to find nodes on which frequencies can be adjusted.
>>>>
>>>> Add #interconnect-cells so that device drivers can request paths from
>>>> bus nodes instead of requiring a separate "virtual" node to represent
>>>> the interconnect itself.
>>>>
>>>> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/devfreq/imx-ddrc.yaml | 5 +++++
>>>>    Documentation/devicetree/bindings/devfreq/imx.yaml      | 5 +++++
>>>>    2 files changed, 10 insertions(+)
>>>
>>> Please combine this with the other series for devfreq support.
>>
>> I understand that having two series which add to the same bindings file
>> is odd but the devfreq and interconnect parts are independent to a very
>> large degree and devfreq can be useful on it's own.
> 
> To start with, I'm suspicious of any 'devfreq' binding because that's
> a Linux thing. I somewhat expect that the interconnect binding should
> replace the devfreq binding, but I haven't been able to investigate.
> 
> Design something that matches the structure of the h/w not how Linux
> drivers happen to be structured. I can't tell what that is without any
> context around adding a couple of properties. Nor do I have the time
> to dig into each SoC vendor's bus structure if it's even documented
> publicly.

Device tree binding files are organized based on linux subsystems but 
otherwise there's little particularly specific to "devfreq" in this new 
binding.

An imx NIC or NOC is a physical component of a SOC which can run at a 
variable clock speed. The device binding uses standard clk and opp 
tables in meaningful ways so that first part is reasonable.

I also want to implement an interconnect provider but an "interconnect" 
is not a single device but rather a graph of discrete buses. Some options:
* Add a custom virtual device, easy but not upstreamable.
* Have a single icc provider device use the individual buses as 
"proxies" for OF parting. Implemented in this series but not very pretty.
* Pick the "main noc" as the single interconnect provider?

Alternatively the approach of defining the graph in the driver could be 
dropped and everything could be described in DT (quite verbose). This 
seems to be what Samsung is doing:

https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=176291

It might even possible to use of_graph; this is complicated but the NICs 
and NOCs do in fact have discrete ports with assignable properties.

 > I also don't follow why you need 'interconnect-node-id' and if you do,
 > it should be a common property.

The "interconnect-node-id" property in devicetree identifies nodes from 
the interconnect graph; for example the DDRC node identifies itself as 
IMX8MM_ICS_DRAM.

--
Regards,
Leonard
