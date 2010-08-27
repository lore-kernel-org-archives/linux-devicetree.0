From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] smsc911x device tree binding questions
Date: Fri, 27 Aug 2010 12:44:04 -0600
Message-ID: <AANLkTinC64uvCMzMnso5Bkvut0H3yFekG8SgwGWwX_qY@mail.gmail.com>
References: <7948893881024232337@unknownmsgid>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <7948893881024232337@unknownmsgid>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: steve.glendinning-sdUf+H5yV5I@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 27, 2010 at 5:01 AM, Lorenzo Pieralisi
<Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi Steve, all
>
> I am in the process of defining a binding and relative code to parse it,
> in order to initialize the smsc911x series of controllers through the dev=
ice
> tree instead of resorting to static data instantiated within the platform
> device struct (of course static config will still be there for platforms =
which
> do not rely on device tree probing, no worries, it is not disruptive at a=
ll).
> I have a couple of questions on the flags passed with the platform_data p=
ointer
> (smsc911x_platform_config - flags member) and the way we may encode these=
 bits
> of information in the tree:
>
> /* Constants for flags */
> #define SMSC911X_USE_16BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(BI=
T(0))
> #define SMSC911X_USE_32BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(BI=
T(1))
> #define SMSC911X_FORCE_INTERNAL_PHY =A0 =A0 =A0 =A0 =A0 =A0 (BIT(2))
> #define SMSC911X_FORCE_EXTERNAL_PHY =A0 =A0 =A0 =A0 =A0 =A0 (BIT(3))
> #define SMSC911X_SAVE_MAC_ADDRESS =A0 =A0 =A0 =A0 =A0 =A0 =A0 (BIT(4))
>
> * 16-32bit bus IF
>
> #define SMSC911X_USE_16BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0(BIT(0))
> #define SMSC911X_USE_32BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0(BIT(1))
>
> - the SMSC911x host bus size can be retrieved from the chip idrev (for
> chip idrev having just 16-bit bus IF) or for controllers like 9118 that
> can have both (32/16), there is a D32/D16 HW strap readable from HW_CFG.
> The problem with these flags is that they define bus size from a CPU
> perspective if I got it right, in particular if the CPU can access
> the SMSC with 32-bit load/store to access 32 bit registers or
> have to resort to two "locked" 16-bit accesses to ensure
> atomicity. I think it is possible on some architectures to use a 32-bit
> load/store even if the smsc911x IF is 16-bit (e.g. bus downsize converter=
s,
> which ensure 16-bit load/store locking).
> It depends on the bus interconnect architecture. I think we
> need a property to define this, thoughts much appreciated.

On other devices we've has a single property to describe the access
width.  It would be appropriate to have an empty property named
"smsc,access-width-16bit", that when present selects 16 bit access,
but defaults to 32 when it isn't present.  For an example, see
drivers/block/xsysace.c and search for "8-bit".

>
> * forcing internal/ext PHY
>
> #define SMSC911X_FORCE_INTERNAL_PHY =A0 =A0 =A0 =A0 =A0 =A0 (BIT(2))
> #define SMSC911X_FORCE_EXTERNAL_PHY =A0 =A0 (BIT(3))
>
> - The device tree allows to describe the mdio bus and all PHYs which are =
present
> on a given controller. Again for controllers having just an internal PHY =
there
> is nothing to force, just use the internal PHY and that's it, that's what
> the driver does. If the controller supports both EXT and internal PHY,
> since the internal PHY is always at address 0x1 (am I correct ?), we may =
define
> something like:
> if the tree defines a PHY @ 0x1 ("reg" property) let's use it (force it o=
r at
> least higher priority than ext phy if both are defined), otherwise if the=
 tree
> defines a PHY which is not @ 0x1 let's use it (force ext).
> If no PHY is specified in the tree, let's resort to HW probing (EXT_PHY_D=
ET in
> HW_CFG reg).

I'd say, if there is no phy data provided in the tree then default to
the internal phy.  Otherwise, use the phy pointed to by the phy-device
property.  It is also possible to specify a phy in the tree without an
address to make the kernel probe for the address (although I need to
double check that the support for it has actually been merged).

> All in all, this means: just use the info from the tree, if there are no
> PHYs specified resort to HW probing for EXT PHY, if it fails use internal.
>
> Acceptable ?
>
> * save MAC ADDRESS
>
> #define SMSC911X_SAVE_MAC_ADDRESS =A0 =A0 =A0 =A0 =A0 =A0 =A0 (BIT(4))
>
> - =A0Since we can encode the mac address in the device tree ("local-mac-a=
ddress"
> property) I am not sure this flag is useful if probing from the tree is e=
nabled.
> It is used if the chip is not fitted with an EEPROM, to save the MAC addr=
ess
> set by a boot-loader before resetting the chip (at probe). Since we can s=
till
> retrieve the MAC from the tree and reprogram it when the content of the
> registers is gone at reset, maybe there is no point in using the option
> (if probing from the tree) or at least no point in defining the flag in
> the tree.

I'd agree, this isn't really useful in the device tree use case; but a
property can be added for it if it was really necessary.

g.
