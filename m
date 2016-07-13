From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 1/3] Documentation: dt: net: add ath9k
	wireless device binding
Date: Wed, 13 Jul 2016 09:47:36 +0200
Message-ID: <4498290.rJrZT5XFlG@wuerfel>
References: <20160624123430.4097-1-martin.blumenstingl@googlemail.com>
	<20160709232834.31654-2-martin.blumenstingl@googlemail.com>
	<87a8hmauls.fsf@purkki.adurom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ath9k-devel-bounces@lists.ath9k.org>
In-Reply-To: <87a8hmauls.fsf@purkki.adurom.net>
List-Unsubscribe: <https://lists.ath9k.org/mailman/listinfo/ath9k-devel>,
	<mailto:ath9k-devel-request@lists.ath9k.org?subject=unsubscribe>
List-Archive: <http://lists.ath9k.org/pipermail/ath9k-devel>
List-Post: <mailto:ath9k-devel@lists.ath9k.org>
List-Help: <mailto:ath9k-devel-request@lists.ath9k.org?subject=help>
List-Subscribe: <https://lists.ath9k.org/mailman/listinfo/ath9k-devel>,
	<mailto:ath9k-devel-request@lists.ath9k.org?subject=subscribe>
Sender: ath9k-devel-bounces@lists.ath9k.org
Errors-To: ath9k-devel-bounces@lists.ath9k.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arend.vanspriel@broadcom.com, pawel.moll@arm.com, mcgrof@do-not-panic.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, julian.calaby@gmail.com, ijc+devicetree@hellion.org.uk, linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com, robh+dt@kernel.org, ath9k-devel@lists.ath9k.org, galak@codeaurora.org, chunkeey@googlemail.com
List-Id: devicetree@vger.kernel.org

On Wednesday, July 13, 2016 10:02:39 AM CEST Kalle Valo wrote:
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
> 
> > Add documentation how devicetree can be used to configure ath9k based
> > devices.
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  .../devicetree/bindings/net/wireless/qca,ath9k.txt | 59 ++++++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt
> >
> > diff --git a/Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt b/Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt
> > new file mode 100644
> > index 0000000..7c62c59
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt
> > @@ -0,0 +1,59 @@
> > +* Qualcomm Atheros ath9k wireless devices
> > +
> > +This node provides properties for configuring the ath9k wireless device. The
> > +node is expected to be specified as a child node of the PCI controller to
> > +which the wireless chip is connected.
> > +
> > +Required properties:
> > +- compatible: Should be "qca,ath9k"
> 
> Isn't this supposed to use the chipset name? ath9k is the driver name
> and something like ar9462 is the chip name. I know in ath10k we used
> "qca,ath10k" but I'm starting to suspect that was a mistake.
> 

You are right, but it's actually more complicated than that. For PCI
devices, the format of the compatible strings is defined in
http://www.o3one.org/hwdocs/openfirmware/pci_supplement_2_1.pdf
and it doesn't use the "vendor,device" syntax at all but instead
uses pciVVVV,DDDD where VVVV and DDDD are the hexadecimal (without
leading 0x) vendor and device ID numbers. The document also specifies
seven other formats and in theory you should list them all, but
that really only makes sense for Open Firmware that programatically
creates those strings.

For a hand-written DTS source, I'd just use the shortest one of those.
Linux actually doesn't care at all, as PCI drivers don't use the
compatible string but instead look at the config register values
that were read by the PCI core.

For USB, we do basically the same thing, but have very few examples
of that as Linux only recently started supporting this.

For SDIO devices we should have done the same thing but screwed up
when we made the generic binding and we have no policy, the example
even lists one that makes no sense at all ("brcm,bcm43xx-fmac")
as it is neither a specific device nor something derived from the IDs.

For on-chip devices, we should follow the common policy for on-chip
devices and use the "vendor,chip-funcion" with fallbacks for
compatible devices such as:

	compatible = "tplink,tp9343-wifi", "qca,qca9561-wifi", "atheros,ar9001-wifi";

For a chip that is branded by TP-Link and derived from a Qualcomm Atheros
chip it is 100% compatible with, and in turn derived from an older
implementation (just guessing which one was the original ath9k).


	Arnd
