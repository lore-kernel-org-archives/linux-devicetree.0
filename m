From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 05/13] clk: qcom: apcs-msm8916: get parent clock names
 from DT
Date: Mon, 31 Dec 2018 09:42:33 +0100
Message-ID: <45a9e033-16e8-e0f9-36cf-3b892af1bd8f@linaro.org>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-6-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <154508986359.19322.1555129141976726505@swboyd.mtv.corp.google.com>
 <20181218143503.GA32562@centauri.ideon.se>
 <72bc192f-b60a-1209-7818-78a2fed07831@linaro.org>
 <154603613437.179992.1170701312259011363@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <154603613437.179992.1170701312259011363@swboyd.mtv.corp.google.com>
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
To: Stephen Boyd <sboyd@kernel.org>, Niklas Cassel <niklas.cassel@linaro.org>
Cc: mark.rutland@arm.com, heiko@sntech.de, mturquette@baylibre.com, will.deacon@arm.com, bjorn.andersson@linaro.org, david.brown@linaro.org, linux-clk@vger.kernel.org, jassisinghbrar@gmail.com, sibis@codeaurora.org, andy.gross@linaro.org, jagan@amarulasolutions.com, devicetree@vger.kernel.org, arnd@arndb.de, olof@lixom.net, robh+dt@kernel.org, horms+renesas@verge.net.au, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, vkoul@kernel.org, enric.balletbo@collabora.com, georgi.djakov@linaro.org
List-Id: devicetree@vger.kernel.org

On 12/28/18 23:28, Stephen Boyd wrote:
> Quoting Jorge Ramirez (2018-12-26 01:20:07)
>> On 12/18/18 15:35, Niklas Cassel wrote:
>>> On Mon, Dec 17, 2018 at 03:37:43PM -0800, Stephen Boyd wrote:
>>>> Quoting Jorge Ramirez-Ortiz (2018-12-17 01:46:22)
>>>>> Allow accessing the parent clock names required for the driver
>>>>> operation by using the device tree node.
>>>>>
>>>>> This permits extending the driver to other platforms without having to
>>>>> modify its source code.
>>>>>
>>>>> For backwards compatibility leave previous values as default.
>>>>
>>>> Why do we need to maintain backwards compatibility? Isn't is required
>>>> that the nodes have clocks properties?
>>>>
>>>
>>> Hello Stephen,
>>>
>>>
>>> This is the existing DT nodes for msm8916:
>>>
>>>                  a53pll: clock@b016000 {
>>>                           compatible = "qcom,msm8916-a53pll";
>>>                           reg = <0xb016000 0x40>;
>>>                           #clock-cells = <0>;
>>>                   };
>>>
>>>                   apcs: mailbox@b011000 {
>>>                           compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
>>>                           reg = <0xb011000 0x1000>;
>>>                           #mbox-cells = <1>;
>>>                           clocks = <&a53pll>;
>>>                           #clock-cells = <0>;
>>>                   };
>>>
>>>
>>> This is the (suggested) DT nodes for qcs404:
>>>
>>>                   apcs_hfpll: clock-controller@0b016000 {
>>>                           compatible = "qcom,hfpll";
>>>                           reg = <0x0b016000 0x30>;
>>>                           #clock-cells = <0>;
>>>                           clock-output-names = "apcs_hfpll";
>>>                           clocks = <&xo_board>;
>>>                           clock-names = "xo";
>>>                   };
>>>
>>>                   apcs_glb: mailbox@b011000 {
>>>                           compatible = "qcom,qcs404-apcs-apps-global", "syscon";
>>>                           reg = <0x0b011000 0x1000>;
>>>                           #mbox-cells = <1>;
>>>                           clocks = <&gcc GCC_GPLL0_AO_OUT_MAIN>, <&apcs_hfpll>;
>>>                           clock-names = "aux", "pll";
>>>                           #clock-cells = <0>;
>>>                   };
>>>
>>> qcs404 specifies two clocks, with an accompanied clock-name for each clock.
>>>
>>> msm8916 specifies a single clock, without an accompanied clock-name.
>>>
>>> It is possible to append clock-names = "pll" for the existing clock,
>>> as well as to define the aux clock in the apcs node in the msm8916 DT:
>>> clocks = <&gcc GPLL0_VOTE>;
>>> clock-names = "aux";
>>>
>>> However, since the DT is treated as an ABI, the existing DT for msm8916 must
>>> still work, so I don't think that it is possible to ignore having backwards
>>> compability in the apcs clock driver.
>>
>>
>> so where are we with this?
>>
>> do we remove backwards compatibility (see below] for v2 or is the DT
>> really an ABI and therefore the patch under review is good as is?
>>
> 
> Breaking compatibility is up to the platform maintainers. If anything, I
> would make the DTS and driver changes in parallel and then remove the
> driver's backwards compatibility logic later on.
> 
> 

I am not completely sure of what you mean. are you saying that the 
original patch is good and we should just provide another patch (not 
part of the current patch series) to remove the compatibility?

TIA
