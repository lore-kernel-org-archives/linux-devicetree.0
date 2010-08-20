From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 07/14] drivers/smsc911x: add DT support
Date: Fri, 20 Aug 2010 15:14:42 -0600
Message-ID: <AANLkTi=6t8_-NOzzW5CbS_JZFV4O1nwCcFeQogQ3Ye5i@mail.gmail.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
	<AANLkTinK9PFm_XBgYQwWdCEtBAernkwdH2CcpftW4b=B@mail.gmail.com>
	<-4137939526196482437@unknownmsgid>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <-4137939526196482437@unknownmsgid>
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
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Philippe Robin <Philippe.Robin-5wv7dgnIgG8@public.gmane.org>, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 20, 2010 at 4:24 AM, Lorenzo Pieralisi
<Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
>> -----Original Message-----
>> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of
>> Grant Likely
>> Sent: 18 August 2010 22:17
>> To: Lorenzo Pieralisi
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Philippe Robin;
>> nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org; linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org; Catalin Marinas;
>> jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org; David Miller
>> Subject: Re: [RFC PATCH 07/14] drivers/smsc911x: add DT support
>>
>> [cc'ing networking maintainer David Miller to keep him in the loop]
>>
>> Hi Lorenzo,
>>
>> A number of comments below and some rework required, but in general
>> the approach looks good and impact on the core driver is limited to
>> the start of the .probe() routine.
>>
>> On Wed, Aug 18, 2010 at 12:59 PM, Lorenzo Pieralisi
>> <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
>> > When OF is enabled the device driver should initialize the match
>> table
>> > in order to be probable from the device tree. Furthermore, HW
>> properties
>> > should be retrieved from the device tree node, so a device tree probe
>> > function is required to parse node properties at run-time. To avoid
>> > preprocessor macros, open firmware functions are defined in a
>> separate
>> > C file that is optionally compiled-in.
>> >
>> > This patch adds the infrastructure needed to enable device tree
>> parsing
>> > to smsc911 platform driver, inclusive of Makefile and device tree
>> > parsing functions. Driver properties should be defined and retrieved
>> > from the device tree if OF is enabled, otherwise the driver would
>> fall
>> > back to platform data static initialization.
>> >
>> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
>> > ---
>> > =A0drivers/net/Makefile =A0 =A0 =A0| =A0 =A03 +-
>> > =A0drivers/net/smsc911x-of.c | =A0 53
>> +++++++++++++++++++++++++++++++++++++++++++++
>> > =A0drivers/net/smsc911x.c =A0 =A0| =A0 28 ++++++++++++++++-------
>> > =A0drivers/net/smsc911x.h =A0 =A0| =A0 =A08 ++++++
>> > =A04 files changed, 82 insertions(+), 10 deletions(-)
>> > =A0create mode 100644 drivers/net/smsc911x-of.c
>> >
>> > diff --git a/drivers/net/Makefile b/drivers/net/Makefile
>> > index 0a0512a..0d2faf9 100644
>> > --- a/drivers/net/Makefile
>> > +++ b/drivers/net/Makefile
>> > @@ -243,7 +243,8 @@ obj-$(CONFIG_VXGE) +=3D vxge/
>> > =A0obj-$(CONFIG_MYRI10GE) +=3D myri10ge/
>> > =A0obj-$(CONFIG_SMC91X) +=3D smc91x.o
>> > =A0obj-$(CONFIG_SMC911X) +=3D smc911x.o
>> > -obj-$(CONFIG_SMSC911X) +=3D smsc911x.o
>> > +smsc911x_of-$(CONFIG_OF) :=3D smsc911x-of.o
>> > +obj-$(CONFIG_SMSC911X) +=3D smsc911x.o $(smsc911x_of-y)
>> > =A0obj-$(CONFIG_BFIN_MAC) +=3D bfin_mac.o
>> > =A0obj-$(CONFIG_DM9000) +=3D dm9000.o
>> > =A0obj-$(CONFIG_PASEMI_MAC) +=3D pasemi_mac_driver.o
>> > diff --git a/drivers/net/smsc911x-of.c b/drivers/net/smsc911x-of.c
>> > new file mode 100644
>> > index 0000000..b8751cf
>> > --- /dev/null
>> > +++ b/drivers/net/smsc911x-of.c
>> > @@ -0,0 +1,53 @@
>> > +#include <linux/device.h>
>> > +#include <linux/platform_device.h>
>> > +#include <linux/of_platform.h>
>> > +#include <linux/of.h>
>> > +#include <linux/smsc911x.h>
>> > +#include <linux/kernel.h>
>> > +
>> > +#include "smsc911x.h"
>> > +
>> > +
>> > +int smsc911x_probe_dt(struct smsc911x_platform_config *cfg,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct platform_device *pdev)
>> > +{
>> > + =A0 =A0 =A0 struct device_node *node =3D pdev->dev.of_node;
>> > + =A0 =A0 =A0 int ret =3D -ENODEV;
>> > + =A0 =A0 =A0 const u32 *prop;
>> > +
>> > + =A0 =A0 =A0 if (!node)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
>>
>> Nothing is allocated or needs to be undone in this routine in the
>> event of failure. =A0Instead of "goto err", you can just "return
>> -ENODEV" in each error case.
>
> Right, it is just because all those "return -ENODEV;" do not look nice
> either,

Heh, I happen to think it looks *better* when all that needs to be
done is return, or at least easier to parse.  :-)  There's no
accounting for some tastes.

> it is clear there is no point in jumping to just pop out.
> But I agree, I will stick to the return approach.
> It may be worthwhile to code a loop with a struct containing the set
> of string properties, that's just cosmetic changes.

There is also Mitch's good suggestion to have a helper function for
reading simple single-cell properties.  That would simplify the code
too.  Eventually I'll get around to implementing that (unless someone
beats me to it).

>
>>
>> > +
>> > + =A0 =A0 =A0 prop =3D of_get_property(node, "flags", NULL);
>> > + =A0 =A0 =A0 if (!prop)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
>> > +
>> > + =A0 =A0 =A0 cfg->flags =3D of_read_number(prop, 1);
>>
>> Looks like Linux-specific implementation details are being encoded
>> into the device tree. =A0What is the intended meaning for the "flags"
>> property?
>>
>
> Well, looks like you are right. It is to define if a 16-bit bus or
> 32-bit bus (to force atomicity of burst of write/read) is used to
> access the device, plus flags to force external or internal phy and
> an option to save the MAC address.
>
> What's the approach to be followed in this case ?

Usually there is a separate node for the MDIO bus, and then a node on
the MDIO bus for each PHY.  A phy-device property is used to link the
MAC to the PHY node.  Search for mdio in arch/powerpc/boot/dts/* for
examples. For the internal PHY, that might not use MDIO at all, so it
may be appropriate to have a device-specific property in that use
case.

>> > + =A0 =A0 =A0 return 0;
>> > +err:
>> > + =A0 =A0 =A0 return ret;
>> > +}
>>
>> I don't think it is necessary to have a separate .c file for this one
>> function. =A0I don't see any problem with it living in
>> drivers/net/smsc911x.c. =A0I'd rather have everything contained in a
>> single place.
>
> The point Grant is that the dt probe function requires access to CONFIG_OF
> dependent members (of_node). If the need for #ifdef CONFIG_OF will go
> I am more than happy to just merge it all in one file.
> This is valid for all the drivers and the match table init macro as well.

The of_device_id match table already need to be wrapped with #ifdef
CONFIG_OF, so I think it is no worse to also include the decode
function inside that #ifdef block.  As for the setting .of_node, I
have been wrapping it with #ifdef, just like CONFIG_PM is often done,
but I agree it is stinky.  I'll probably make a macro that can be used
in the static initializer.

>
>>
>> > diff --git a/drivers/net/smsc911x.c b/drivers/net/smsc911x.c
>> > index cc55974..c56b8f7 100644
>> > --- a/drivers/net/smsc911x.c
>> > +++ b/drivers/net/smsc911x.c
>> > @@ -50,6 +50,7 @@
>> > =A0#include <linux/phy.h>
>> > =A0#include <linux/smsc911x.h>
>> > =A0#include <linux/device.h>
>> > +
>> > =A0#include "smsc911x.h"
>>
>> Unrelated whitespace change.
>>
>
> Ok.
>
>> >
>> {
>> > =A0/* Entry point for loading the module */
>> > =A0static int __init smsc911x_init_module(void)
>> > =A0{
>> > + =A0 =A0 =A0 platform_init_match(&smsc911x_driver, smsc911x_matches);
>>
>> the match table should be statically initialized into the driver
>> structure. =A0Right now that does require wrapping the line with #ifdef
>> CONFIG_OF which is a little stinky, but I'm working on a solution for
>> that. =A0Regardless, I don't like having to use a macro to set the
>> pointer at probe time when it can be done statically.
>>
>
> Point taken, but to be precise it is not set at probe time, it is set at
> init time (insmod or initcalls). Again, it is just to avoid ifdefs,
> if the #ifdefs go away, I will do it statically with nary a problem.

Heh; typo.  sorry.

Cheers,
g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
