From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/9] gpio: mvebu: fix regmap_update_bits usage
Date: Fri, 16 Jun 2017 11:18:38 +0200
Message-ID: <CACRpkdZ2LuT50EMMOuT_FO0pz0nmO_fWhoBJd+Q76STWOpPNFA@mail.gmail.com>
References: <cover.d003a5e862e6d732d901a61d1765a349c9a89eef.1497281623.git-series.gregory.clement@free-electrons.com>
 <9a098130daa8daeef89fd6c1e80d982699d5c175.1497281623.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9a098130daa8daeef89fd6c1e80d982699d5c175.1497281623.git-series.gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Omri Itach <omrii@marvell.com>, Shadi Ammouri <shadi@marvell.com>, Chris Packham <Chris.Packh>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 12, 2017 at 5:34 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> In some place in the driver regmap_update_bits was misused. Indeed the
> last argument is not the value of the bit (or group of bits) itself but
> the mask value inside the register.
>
> So when setting the bit N, then the value must be BIT(N) and not 1.
>
> CC: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
> CC: Ralph Sennhauser <ralph.sennhauser@gmail.com>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Tested-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
> Tested-by: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Already applied this patch, sorry for missing the resend in the series.

Yours,
Linus Walleij
