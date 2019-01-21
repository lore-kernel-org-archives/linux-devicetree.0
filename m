From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v3 06/10] dt-bindings: phy: mvebu-utmi: add UTMI PHY
 bindings
Date: Mon, 21 Jan 2019 16:47:37 +0100
Message-ID: <87r2d6ko6e.fsf@FE-laptop>
References: <20190121112336.23489-1-miquel.raynal@bootlin.com>
 <20190121112336.23489-7-miquel.raynal@bootlin.com>
 <20190121154451.GA28183@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190121154451.GA28183@bogus> (Rob Herring's message of "Mon, 21
 Jan 2019 09:44:51 -0600")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Alan Stern <stern@rowland.harvard.edu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,
 
 On lun., janv. 21 2019, Rob Herring <robh@kernel.org> wrote:

> On Mon, 21 Jan 2019 12:23:32 +0100, Miquel Raynal wrote:
>> Add bindings for Marvell Armada 3700 USB2 UTMI+ PHY.
>> 
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>  .../bindings/phy/phy-mvebu-utmi.txt           | 38 +++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/phy-mvebu-utmi.txt
>>

I found "marvell,usb2-host-miscellaneous" too generic, I would prefer
that we call it "marvell,armada-3700-usb2-host-miscellaneous" as we do
for all the other IP.

Gregory

>
> Reviewed-by: Rob Herring <robh@kernel.org>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
