From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v6 00/15] qcom: spmi: add support for hierarchical IRQ
 chip
Date: Tue, 22 Jan 2019 15:13:46 -0600
Message-ID: <20190122211346.GA30582@hector.attlocal.net>
References: <20190119204252.18370-1-masneyb@onstation.org>
 <CACRpkdap+AJ+eDVusg=ShwRKXOuR=tAyNLBeCxsxuu28DSfisQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdap+AJ+eDVusg=ShwRKXOuR=tAyNLBeCxsxuu28DSfisQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Brian Masney <masneyb@onstation.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 22, 2019 at 04:31:20PM +0100, Linus Walleij wrote:
> On Sat, Jan 19, 2019 at 9:43 PM Brian Masney <masneyb@onstation.org> wrote:
> 
> > This patch series adds hierarchical IRQ chip support to spmi-gpio so
> > that device tree consumers can request an IRQ directly from the GPIO
> > block rather than having to request an IRQ from the underlying PMIC.
> 
> I have applied all these patches including the DTS patches to the GPIO
> tree and pushed for linux-next.
> 
> If all works out well I will solidify the branch, pull it into the pin control
> tree as well and offer the branch to ARM SoC.

Thanks Linus!
