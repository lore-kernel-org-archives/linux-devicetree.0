From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 06/10] dt-bindings: phy: mvebu-utmi: add UTMI PHY
 bindings
Date: Tue, 22 Jan 2019 10:08:41 -0600
Message-ID: <CAL_JsqLQ+7VZ--n17aDAFS4v1fMOKKPprs9fVVASy9yt=_mR2w@mail.gmail.com>
References: <20190121112336.23489-1-miquel.raynal@bootlin.com>
 <20190121112336.23489-7-miquel.raynal@bootlin.com>
 <20190121154451.GA28183@bogus> <87r2d6ko6e.fsf@FE-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87r2d6ko6e.fsf@FE-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux USB List <linux-usb@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Alan Stern <stern@rowland.harvard.edu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 9:49 AM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:
>
> Hi Rob,
>
>  On lun., janv. 21 2019, Rob Herring <robh@kernel.org> wrote:
>
> > On Mon, 21 Jan 2019 12:23:32 +0100, Miquel Raynal wrote:
> >> Add bindings for Marvell Armada 3700 USB2 UTMI+ PHY.
> >>
> >> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >> ---
> >>  .../bindings/phy/phy-mvebu-utmi.txt           | 38 +++++++++++++++++++
> >>  1 file changed, 38 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/phy/phy-mvebu-utmi.txt
> >>
>
> I found "marvell,usb2-host-miscellaneous" too generic, I would prefer
> that we call it "marvell,armada-3700-usb2-host-miscellaneous" as we do
> for all the other IP.

Ah yes, you are right. Perhaps just '-misc' to shorten it a little bit.

Rob
