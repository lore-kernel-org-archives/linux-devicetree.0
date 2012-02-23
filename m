From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/3 v4] arm: kirkwood: add dreamplug (fdt) support.
Date: Thu, 23 Feb 2012 11:56:46 -0700
Message-ID: <CACxGe6veKy3eA=GCp9eZWG1h8UgEYwAP9aicJhwm90=m4Z33xg@mail.gmail.com>
References: <cover.1329936660.git.jason@lakedaemon.net>
 <8532afcdc4adbb3771e6f742bcc33ef9c0347858.1329936660.git.jason@lakedaemon.net>
 <4F45B043.1080302@gmail.com> <201202230734.33583.arnd@arndb.de>
 <20120223161210.GN23524@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120223161210.GN23524-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 23, 2012 at 9:12 AM, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> On Thu, Feb 23, 2012 at 07:34:33AM +0000, Arnd Bergmann wrote:
>> On Thursday 23 February 2012, Rob Herring wrote:
>> > On 02/22/2012 01:18 PM, Jason Cooper wrote:
>>
>> > > diff --git a/arch/arm/mach-kirkwood/Kconfig b/arch/arm/mach-kirkwood=
/Kconfig
>> > > index 7fc603b..6095884 100644
>> > > --- a/arch/arm/mach-kirkwood/Kconfig
>> > > +++ b/arch/arm/mach-kirkwood/Kconfig
>> > > @@ -44,6 +44,20 @@ config MACH_GURUPLUG
>> > > =A0 =A0 Say 'Y' here if you want your kernel to support the
>> > > =A0 =A0 Marvell GuruPlug Reference Board.
>> > >
>> > > +config ARCH_KIRKWOOD_DT
>> > > + bool "Marvell Kirkwood Flattened Device Tree"
>> > > + select USE_OF
>> > > + help
>> > > + =A0 Say 'Y' here if you want your kernel to support the
>> > > + =A0 Marvell Kirkwood using flattened device tree.
>> > > +
>> > > +config MACH_DREAMPLUG_DT
>> > > + bool "Marvell DreamPlug (Flattened Device Tree)"
>> > > + depends on ARCH_KIRKWOOD_DT
>> > > + help
>> > > + =A0 Say 'Y' here if you want your kernel to support the
>> > > + =A0 Marvell DreamPlug (Flattened Device Tree).
>> >
>> > Why do you need 2 entries?
>>
>> The first one is used to build the board file for all DT based machines,
>> the second one is used to select the dts file. I would be enough to have=
 just
>> the first one, but that makes it harder to find for people looking for
>> dreamplug.
>>
>> Maybe change the text to "Generic Marvell Kirkwood DT based (e.g. DreamP=
lug)"?
>
> I was thinking about this more, and had, I hope, a better idea: =A0change
> the 'depends on ARCH_KIRKWOOD_DT' to 'selects ARCH_KIRKWOOD_DT' and
> remove the first entry. =A0This way, the logic remains the same and the
> word 'Dreamplug' is always visible. =A0Any objections?
>
>> > > +
>> > > +static unsigned int dreamplug_mpp_config[] __initdata =3D {
>> > > + MPP0_SPI_SCn,
>> > > + MPP1_SPI_MOSI,
>> > > + MPP2_SPI_SCK,
>> > > + MPP3_SPI_MISO,
>> > > + MPP47_GPIO, =A0 =A0 /* Bluetooth LED */
>> > > + MPP48_GPIO, =A0 =A0 /* Wifi LED */
>> > > + MPP49_GPIO, =A0 =A0 /* Wifi AP LED */
>> > > + 0
>> > > +};
>> >
>> > Do you need this to boot? All this data should come from the dtb.
>>
>> Putting this into the dtb would require converting kirkwood to use the
>> pinctrl subsystem first, if we want to have proper bindings. When I
>> did the hands-on review of the code with Jason during ELC, we decided
>> to leave this being done the legacy way for now, which also matches
>> how Tegra does it until we have the pinctrl bindings.
>>
>> Also note how the patch description says "Driver porting will start
>> with the uart (see next patch), and progress from there. =A0Possibly,
>> spi/flash/partitions will be next." I think this is the best approach
>> indeed and I'd probably leave the pinctrl stuff until the end.
>
> Agreed.
>
>> > > +
>> > > +static void __init kirkwood_dt_init(void)
>> > > +{
>> > > + kirkwood_init();
>> > > +
>> > > + if (!of_machine_is_compatible("kirkwood,dreamplug"))
>> >
>> > Huh? Your string doesn't match your dts file.
>> >
>> > You've already matched against "marvell,dreamplug", so is this check
>> > necessary?
>>
>> It's wrong, and the condition is negated. It should be
>>
>> =A0 =A0 =A0 if (of_machine_is_compatible("marvell,dreamplug"))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 dreamplug_init();
>>
>> The idea is that there is one init function for all dt based
>> kirkwood machines, which contains special setup functions for
>> those boards that don't (yet) describe all the hardware in the
>> dt.
>
> Good catch, will fix in v5.
>
>> > > +
>> > > +static const char *kirkwood_dt_board_compat[] =3D {
>> > > + "marvell,dreamplug",
>> > > + NULL
>> > > +};
>>
>> Since you mention the name, it should probably be "globalscale,dreamplug"
>> because the device is made by GlobalScale instead of Marvell.
>
> hmm, Globalscale Tech is, as I understand it, a turn-key manufacturer.
> They are simply building Marvell's development platforms for them,
> handling sales, etc. =A0My impression was that Marvell designed the board
> and contracted Globalscale to build and distribute it.
>
> I don't care which we use, but is the convention to use the SoC designer
> (marvell,dreamplug), the SoC (kirkwood,dreamplug), or the brand
> (globalscale,dreamplug)?
>
> If there is no set standard, I think the SoC is most accurate, as
> nothing prevents a manufacturer from swapping out ICs/SoCs between
> manufacturing runs of the same make/model. =A0Look at certain wifi USB
> devices for examples.

convention is to use the vendor of the device.  If it is marketed as a
Marvell product, then use "marvell,...".  If it is Globalscale, then
"globalscale,...".  The actual SoC on the device is irrelevant for the
top level compatible property name.

g.
