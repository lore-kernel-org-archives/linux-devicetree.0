From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH 04/15] phy: mvebu-cp110-comphy: Add RXAUI support
Date: Tue, 2 Apr 2019 10:43:49 +0200
Message-ID: <20190402104349.2d61ed39@bootlin.com>
References: <20190401165131.23370-1-miquel.raynal@bootlin.com>
 <20190401165131.23370-5-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190401165131.23370-5-miquel.raynal@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Miquel,

On Mon,  1 Apr 2019 18:51:20 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

>Add support for RXAUI mode by adding an entry in the COMPHY modes list.
>
>There is nothing more to handle besides avoiding to return an error to
>the caller: someone using a DT updated with the right 'phys' property
>with an old firmware would get an error when initializing the lanes in
>RXAUI mode, while it could have already been initialized by eg. the
>bootloader. It would prevent the interface to work with no reason.

However, this would mask-away errors that could occur when we have a
correct firmware and DT.

Maybe we should simply return the error, this mode isn't supported in
PPv2 yet so I don't expect this to break any existing setups.

Maxime
