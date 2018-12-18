From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 05/13] clk: qcom: apcs-msm8916: get parent clock names
 from DT
Date: Tue, 18 Dec 2018 09:37:29 +0100
Message-ID: <57ef23b0-9c6b-cdd4-9a1a-41c6d5b3aa93@linaro.org>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-6-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <154508986359.19322.1555129141976726505@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154508986359.19322.1555129141976726505@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, andy.gross@linaro.org, david.brown@linaro.org, jassisinghbrar@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com
Cc: bjorn.andersson@linaro.org, vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/18/18 00:37, Stephen Boyd wrote:
> Quoting Jorge Ramirez-Ortiz (2018-12-17 01:46:22)
>> Allow accessing the parent clock names required for the driver
>> operation by using the device tree node.
>>
>> This permits extending the driver to other platforms without having to
>> modify its source code.
>>
>> For backwards compatibility leave previous values as default.
> Why do we need to maintain backwards compatibility? Isn't is required
> that the nodes have clocks properties?
>
>

this driver -apcs clock controller- uses platform data (not DT) and 
therefore it uses the DT from the parent node (mailbox).
And for the mailbox the clock property is optional.

So the APCS clock controller requires that the parent provides at least 
one clock but the clock is not mandatory in the parent DT node.
For instance in the case of the msm8916, the parent only provides one 
clock, just the pll.

am I required to modify that platform instead of maintaining backwards 
compatibility?
