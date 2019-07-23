From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH v2 03/19] phy: mvebu-cp110-comphy: Add SMC call support
Date: Tue, 23 Jul 2019 10:48:49 +0200
Message-ID: <20190723104849.7158f634@bootlin.com>
References: <20190627095104.22529-1-miquel.raynal@bootlin.com>
 <20190627095104.22529-4-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190627095104.22529-4-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Miquel,

Thanks for this, I gave it a quick test and it looks good.

On Thu, 27 Jun 2019 11:50:48 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

>From: Grzegorz Jaszczyk <jaz@semihalf.com>
>
>Keep the exact same list of supported configurations but first try to
>use the firmware's implementation. If it fails, try the legacy method:
>Linux implementation.
>
>Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
>[miquel.raynal@bootlin.com: adapt the content to the mainline driver]
>Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

[...]

>+	dev_warn(priv->dev,
>+		 "Firmware could not configure PHY %d with mode %d (ret: %d), trying legacy method\n",
>+		 ret, lane->id, lane->mode);

Small nit, you've got your parameters in the wrong order in that
dev_warn.

Besides that,

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
