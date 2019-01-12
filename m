From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v3 2/6] spmi: pmic-arb: convert to v2 irq interfaces to
 support hierarchical IRQ chips
Date: Fri, 11 Jan 2019 20:34:10 -0500
Message-ID: <20190112013410.GA6726@basecamp>
References: <20190110011258.17227-1-masneyb@onstation.org>
 <20190110011258.17227-3-masneyb@onstation.org>
 <154724442941.169631.5308212449003169927@swboyd.mtv.corp.google.com>
 <20190111230004.GA5805@basecamp>
 <154724996786.169631.3834576842560322500@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154724996786.169631.3834576842560322500@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: andy.gross@linaro.org, bjorn.andersson@linaro.org, linus.walleij@linaro.org, marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 11, 2019 at 03:39:27PM -0800, Stephen Boyd wrote:
> Ok sounds good. Can you also fix all the spmi-gpio specifying dts files?
> There are more than just two PMIC dts files that need changes (per my
> grep results sent to the list earlier).

Yes, I'll take care of all of them in the next version.

Brian
