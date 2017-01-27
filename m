From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCHv5 0/5] Support for Marvell switches with integrated CPUs
Date: Fri, 27 Jan 2017 10:47:45 -0800
Message-ID: <20170127184745.GD8801@codeaurora.org>
References: <20170127032546.14657-1-chris.packham@alliedtelesis.co.nz>
 <87wpdgwj72.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <87wpdgwj72.fsf@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, linux-clk@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Juri Lelli <juri.lelli@arm.com>, linux@armlinux.org.uk, Thierry Reding <treding@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>, Rob Herring <robh+dt@kernel.org>, Chris Brand <chris.brand@broadcom.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.>
List-Id: devicetree@vger.kernel.org

On 01/27, Gregory CLEMENT wrote:
> Hi all,
>  
>  On ven., janv. 27 2017, Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:
> 
> > The 98DX3236, 98DX3336 and 98DX4251 are a set of switch ASICs with
> > integrated CPUs. They CPU block is common within these product lines and
> > (as far as I can tell/have been told) is based on the Armada XP. There
> > are a few differences due to the fact they have to squeeze the CPU into
> > the same package as the switch.
> >
> > I've rebased this series against linux-pinctrl/devel to get access to
> > mvebu_mmio_mpp_ctrl. Everything else still applies cleanly to
> > v4.10.0-rc5.
> 
> Just to let you know that I plan to apply the 3 arm patch once Chris
> will have sent the new series with the minor fixes I asked on patch 3.
> 
> I already applied them in the for-next branch to benefit of some build
> test coverage.
> 
> Stephen,
> 
> you gave your Acked-by on the first patch, but don't you plan to apply
> it on the clk branch?

It must have not been clear if I should apply it, hence the ack.
I'll apply it now.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
