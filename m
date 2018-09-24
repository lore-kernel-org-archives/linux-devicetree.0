From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] clk: qcom: Add Global Clock controller (GCC) driver for SDM660
Date: Mon, 24 Sep 2018 14:44:33 +0200
Message-ID: <9156720.4hgryJ20kK@phil>
References: <20180407135934.26122-1-ctatlor97@gmail.com> <69cf26ba-5dae-e84c-2fa8-15699fdd9986@codeaurora.org> <63F4E7C0-6925-4EC0-84B9-75B31AC664E4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <63F4E7C0-6925-4EC0-84B9-75B31AC664E4@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Craig Tatlor <ctatlor97@gmail.com>
Cc: Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Craig,

Am Montag, 13. August 2018, 09:45:09 CEST schrieb Craig Tatlor:
> On 13 August 2018 07:55:34 BST, Taniya Das <tdas@codeaurora.org> wrote:
> >Hello Craig,
> >
> >Could you please correct the authorship and also provide the reference 
> >to code where this is picked from?
> Okay, 
> Got code from here https://github.com/sonyxperiadev/kernel/blob/aosp/LA.UM.6.4.r1/drivers/clk/qcom/gcc-sdm660.c
> but changed it quite a bit for upstream,
> Should I change the commit author and add your signed off by and say I did cleanups on my signed off by.

yep, for something this huge it is really the correct way to keep the
original authorship intact as Taniya did the initial big work, and just
add you change-description, so something like

---- 8< ------
Add support for the global clock controller found on SDM660
based devices. This should allow most non-multimedia device
drivers to probe and control their clocks.
Based on CAF implementation.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
[ description of changes ... often seen in these brackets ]
Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
---- 8< ------

Also, do you plan to continue working on this, as I would be interessted
in the clock driver for a sdm660-based phone as well.


Thanks
Heiko
