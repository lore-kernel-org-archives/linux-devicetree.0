From: Steve.Glendinning-sdUf+H5yV5I@public.gmane.org
Subject: Re: [RFC] smsc911x device tree binding questions
Date: Sun, 29 Aug 2010 12:59:55 +0100
Message-ID: <OFD2329EF8.8EA10F32-ON8025778E.0040004D-8025778E.0041E981@smsc.com>
References: <7948893881024232337@unknownmsgid>
	<AANLkTinC64uvCMzMnso5Bkvut0H3yFekG8SgwGWwX_qY@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTinC64uvCMzMnso5Bkvut0H3yFekG8SgwGWwX_qY-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Ian.Saturley-sdUf+H5yV5I@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lorenzo,

> > - the SMSC911x host bus size can be retrieved from the chip idrev (for
> > chip idrev having just 16-bit bus IF) or for controllers like 9118 
that
> > can have both (32/16), there is a D32/D16 HW strap readable from 
HW_CFG.
> > The problem with these flags is that they define bus size from a CPU
> > perspective if I got it right, in particular if the CPU can access
> > the SMSC with 32-bit load/store to access 32 bit registers or
> > have to resort to two "locked" 16-bit accesses to ensure
> > atomicity. I think it is possible on some architectures to use a 
32-bit
> > load/store even if the smsc911x IF is 16-bit (e.g. bus downsize 
converters,
> > which ensure 16-bit load/store locking).
> > It depends on the bus interconnect architecture. I think we
> > need a property to define this, thoughts much appreciated.

Absolutely right - this flag defines whether the DRIVER has to use 16
or 32 bit accesses in order to succesfully access the chip.  If the bus
hardware is capable of performing atomic pairs of 16-bit operations
when we make a 32-bit read then this is very much preferred.  The 16-bit
path is MUCH slower as it has to take a spinlock on every access to
ensure the two reads/writes are atomic.  It's there as a last resort,
and its use is discouraged if avoidable.

Autodetecting the bus width from register values is interesting, you'd
have to test that you can reliably read the registers in all of the above
modes.  It's my understanding that if the device is strapped for 16-bit
access it expects to see atomic pairs of reads, so I guess you could make
a pair of 32-bit reads (of something known like BYTE_TEST) and analyse
what you get back to determine how you're connected?
 
> > * forcing internal/ext PHY
> >
> > #define SMSC911X_FORCE_INTERNAL_PHY             (BIT(2))
> > #define SMSC911X_FORCE_EXTERNAL_PHY     (BIT(3))
> >
> > - The device tree allows to describe the mdio bus and all PHYs which 
are present
> > on a given controller. Again for controllers having just an internal 
PHY there
> > is nothing to force, just use the internal PHY and that's it, that's 
what
> > the driver does. If the controller supports both EXT and internal PHY,
> > since the internal PHY is always at address 0x1 (am I correct ?), we 
may define
> > something like:
> > if the tree defines a PHY @ 0x1 ("reg" property) let's use it (force 
it or at
> > least higher priority than ext phy if both are defined), otherwise if 
the tree
> > defines a PHY which is not @ 0x1 let's use it (force ext).
> > If no PHY is specified in the tree, let's resort to HW probing 
(EXT_PHY_DET in
> > HW_CFG reg).
> 
> I'd say, if there is no phy data provided in the tree then default to
> the internal phy.  Otherwise, use the phy pointed to by the phy-device
> property.  It is also possible to specify a phy in the tree without an
> address to make the kernel probe for the address (although I need to
> double check that the support for it has actually been merged).
> 
> > All in all, this means: just use the info from the tree, if there are 
no
> > PHYs specified resort to HW probing for EXT PHY, if it fails use 
internal.
> >
> > Acceptable ?

Yes, bearing in mind that the majority of users do use the internal PHY 
this
sounds like a sensible plan.

> > * save MAC ADDRESS
> >
> > #define SMSC911X_SAVE_MAC_ADDRESS               (BIT(4))
> >
> > -  Since we can encode the mac address in the device tree 
("local-mac-address"
> > property) I am not sure this flag is useful if probing from the tree 
is enabled.
> > It is used if the chip is not fitted with an EEPROM, to save the MAC 
address
> > set by a boot-loader before resetting the chip (at probe). Since we 
can still
> > retrieve the MAC from the tree and reprogram it when the content of 
the
> > registers is gone at reset, maybe there is no point in using the 
option
> > (if probing from the tree) or at least no point in defining the flag 
in
> > the tree.
> 
> I'd agree, this isn't really useful in the device tree use case; but a
> property can be added for it if it was really necessary.

Yes, this is just a workaround for a specific use case: the bootloader 
"owns" the
MAC address configuration data and it's relatively hard to access this 
storage once
Linux boots.

--
Steve
