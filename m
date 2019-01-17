From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 05/13] clk: qcom: apcs-msm8916: get parent clock names
 from DT
Date: Wed, 16 Jan 2019 22:54:34 -0800
Message-ID: <20190117065434.GL25498@builder>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-6-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <154508986359.19322.1555129141976726505@swboyd.mtv.corp.google.com>
 <20181218143503.GA32562@centauri.ideon.se>
 <72bc192f-b60a-1209-7818-78a2fed07831@linaro.org>
 <154603613437.179992.1170701312259011363@swboyd.mtv.corp.google.com>
 <45a9e033-16e8-e0f9-36cf-3b892af1bd8f@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <45a9e033-16e8-e0f9-36cf-3b892af1bd8f@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Niklas Cassel <niklas.cassel@linaro.org>, andy.gross@linaro.org, david.brown@linaro.org, jassisinghbrar@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com, vkoul@kernel.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 31 Dec 00:42 PST 2018, Jorge Ramirez wrote:

[..]
> I am not completely sure of what you mean. are you saying that the original
> patch is good and we should just provide another patch (not part of the
> current patch series) to remove the compatibility?
> 

You're expected to make sure that db410c continues to function on
existing DTBs, at least for a considerable amount of time.

Regards,
Bjorn
