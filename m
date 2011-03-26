From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device Tree on ARM status report - Mar 20
Date: Sat, 26 Mar 2011 01:38:29 -0600
Message-ID: <AANLkTin8PuMP7y7LASpMS0h+_3hJkbw2m+fyc4VrbZxU@mail.gmail.com>
References: <AANLkTikZkfhA2Wu7_P_z5UX0Z5QeHa-W8TNksR1n4GV2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTikZkfhA2Wu7_P_z5UX0Z5QeHa-W8TNksR1n4GV2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linaro-dev <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, =?ISO-8859-1?Q?Lo=EFc_Minier?= <loic.minier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For those of you working on bringing up arm device tree support
against the Linaro u-boot * kernel trees, I've just pushed out a
couple of branches that work on Panda board.  It's not complete yet
because there are some bugs I found in both the kernel and in u-boot,
but it should be useful to base off of when working on the other
platforms:

U-boot tree based on u-boot-linaro-stable:
git://git.secretlab.ca/git/u-boot devicetree/linaro-stable

Kernet tree based on linux-linaro-2.6.38
git://git.secretlab.ca/git/linux-2.6 devicetree/arm-linaro-2.6.38

I'll post the patches that I've got in those branches after I clean
them up.  Probably Monday.

g.

On Mon, Mar 21, 2011 at 3:25 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> I had great hopes of doing these status reports once a week; but it
> turns out to take more effort to get together that I estimated.
> Here's the status of ARM device tree support as of today. =A0As always,
> let me know if you have any corrections or additional information.
>
> 1 - Latest news
> ---------------
> - The last vestiges of of_platform_bus_type are gone from Linus' tree
> as of the 2.6.39 merge window. =A0Everything should be using
> platform_device now.
> - devicetree/arm on git://git.secretlab.ca/git/linux-2.6 has
> everything needed to turn on basic device tree support for any
> platform.
> =A0- Support has been added for Versatile and Tegra in devicetree/arm
> =A0- Support for Samsung s5pv310 and Freescale mx5 are in devicetree/test
> - Similarly, u-boot needs to have the CONFIG_OF_LIBFDT and
> CONFIG_SYS_BOOTMAPSZ defined to turn on device tree support.
> =A0- I've also got patches that eliminate the need for
> CONFIG_SYS_BOOTMAPSZ which I'll post shortly, but they're not quite
> working yet.
> =A0- I've also got a trivial patch that should enabled CONFIG_OF_LIBFDT
> on a large set of boards, but it has had pretty much zero testing.
> :-)
> - Jason Hui has been making awesome progress on mx5, and some of their
> patches are in devicetree/test. =A0Hopefully to move over to
> devicetree/arm soon.
> - Shawn Guo has also been making good progress on adding the clock
> bindings to the mx5 support. =A0There are still questions up in the air
> about the best way to handle clocks though. =A0While all the clocks
> /can/ be converted to device tree data, there is also value in sharing
> clock initialization data between DT and non-DT board support. =A0The
> of_platform_device_prepare() work mentioned below will help with that.
> =A0It will also be easier to work on the clock support when the common
> struct clk patch series from Jeremy gets merged. =A0Until then there
> ends up being a lot of duplication of code.
> - Lennert has a series of virq patches for ARM patches completed. =A0He
> is currently working on cleaning them up to get them posted.
> - Patches posted for of_platform_prepare() which makes it easier for
> static platform_device registrations to co-exist with device tree
> data. =A0Patches are currently in devicetree/test, and will move to
> devicetree/arm shortly.
> - Basic DT support has been merged into Nicolas' Linaro kernel tree.
> - DT is also working on Versatile Express, OMAP, and the new Xilinx
> platform, but I don't have patches for either of those platforms in my
> tree.
> - Rob Herring's work on the early dtb mmu maping is mainlined and
> makes it much nicer to work with dtbs.
>
> Next steps:
> --------------
> At this point I'm putting on my Linaro hat. =A0Feel free to tune out
> past this point if you're not interested how DT support will
> materialize in the next release.
>
> There are a number of very specific tasks that need to be completed
> for the 11.05 release. =A0The goal is to have basic device tree support
> turned on and working on all of the platforms supported in the
> release. =A0There isn't a lot of time to get this pulled together, but
> all the infrastructure is in places, so most of the work is turning on
> the configuration options and testing the platforms.
>
> For each board, I need an engineer to do the following:
>
> 1) Enable CONFIG_OF_LIBFDT and CONFIG_SYS_BOOTMAPSZ against the Linaro
> u-boot tree.
> 2) Enable CONFIG_OF and CONFIG_PROC_DEVICETREE in the kernel
> 3) Add something like the following to the *existing* machine
> definition. =A0For initial basic support, you don't need to create a
> separate <soc>-dt.c board support file yet.
>
> +static const char *omap4_panda_dt_match[] __initdata =3D {
> + =A0 =A0 =A0 "ti,omap4-panda",
> + =A0 =A0 =A0 NULL
> +};
> +
> =A0MACHINE_START(OMAP4_PANDA, "OMAP4 Panda board")
> [...]
> + =A0 =A0 =A0 .dt_compat =A0 =A0 =A0=3D omap4_panda_dt_match,
> =A0MACHINE_END
>
> =A0 =A0The string in the match table should be in the form "<vendor>,<boa=
rd-name>"
>
> 4) Add a template .dts file for the board in
> arch/arm/boot/dts/<board>.dts. =A0The following should be sufficient:
>
> /dts-v1/;
>
> / {
> =A0 =A0 =A0 =A0model =3D "TI OMAP4 PandaBoard";
> =A0 =A0 =A0 =A0compatible =3D "ti,omap4-panda";
> =A0 =A0 =A0 =A0#address-cells =3D <1>;
> =A0 =A0 =A0 =A0#size-cells =3D <1>;
>
> =A0 =A0 =A0 =A0aliases {
> =A0 =A0 =A0 =A0};
>
> =A0 =A0 =A0 =A0memory {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device_type =3D "memory";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x80000000 0x08000000>;
> =A0 =A0 =A0 =A0};
>
> =A0 =A0 =A0 =A0chosen {
> =A0 =A0 =A0 =A0};
> };
> 5) test it =A0:-)
> 6) send patches to me for inclusion in the Linaro U-Boot and Kernel
> trees. =A0I'll collect them to start and ask John and Nicolas to pull
> them into their trees when they're ready.
>
> This is enough for very basic device tree support and I expect it will
> only take a day or so of effort to get completed. =A0It won't be
> particularly useful, but it ensures that the infrastructure is enabled
> and working.
>
> Bonus points if you're also able to provide patches that add
> of_platform_device_probe() and of_platform_bus_populate() calls to the
> board support so that device nodes get attached to the devices and can
> be used for attaching things like gpios, spi devices, and i2c devices.
> =A0This is a nice to have for 11.05, but it isn't a requirement to have
> it working on all boards.
>
> Here is the list of hwpacks that should be supported to the best of my
> knowledge. =A0Please reply with the hwpacks you can take responsibility
> for:
>
> efikamx
> igep
> imx51
> omap3-x11-base
> omap3
> overo
> panda
> s5pv310
> vexpress
>
> There are also some specific cross-platform tasks that need some love.
> =A0Let me know if you can take responsibility for any of these items.
> - Eliminate CONFIG_SYS_BOOTMAPSZ dependency from U-Boot. =A0I've got a
> patch series that does this, but it is untested. =A0I'll post the series
> tomorrow.
> - Add packaging of .dtb files into linux-image-linaro-* packages.
> Loic and I discussed putting them under /lib/dtb/`uname -r`/, but
> thinking about it more, it might make more sense to share the modules
> directory and use /lib/modules/`uname -r`/dtbs. =A0The dtc tool needed
> to build the .dtbs is included with the kernel tree.
> - Add relevant dtb files to boot partition in linaro-image tools
> - Add boot script which passes dtb as 3rd argument to 'bootm'
>
> For purposes of tracking, I'll register bugs for the above items in
> the Linaro bug tracker tomorrow.
>
> Cheers,
> g.
>
> --
> Grant Likely, B.Sc., P.Eng.
> Secret Lab Technologies Ltd.
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
