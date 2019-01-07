From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v2 2/5] mfd: qcom-spmi-pmic: use devm_mfd_add_devices
 instead of devm_of_platform_populate
Date: Mon, 7 Jan 2019 06:30:07 -0500
Message-ID: <20190107113007.GA1284@basecamp>
References: <20190107021145.6370-1-masneyb@onstation.org>
 <20190107021145.6370-3-masneyb@onstation.org>
 <CACRpkdbLU_2JC1wT=M7EPsx6gPxL=poj2Ci8zTa++51K2qGZ4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbLU_2JC1wT=M7EPsx6gPxL=poj2Ci8zTa++51K2qGZ4A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Lee Jones <lee.jones@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 07, 2019 at 11:53:07AM +0100, Linus Walleij wrote:
> I suppose Lee can merge this in orthogonal in the MFD tree,
> the end result will be functional after the v5.1 merge window.

To keep git bisect happy, it would be nice if either all of the patches
go in through the same tree (with the proper ACKs), or if the first four
patches are applied during the v5.1 merge window, and the last patch is
applied during the v5.2 merge window.

Brian
