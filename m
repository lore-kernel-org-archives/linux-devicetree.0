From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Device Tree on ARM status report - Mar 20
Date: Mon, 21 Mar 2011 03:25:16 -0600
Message-ID: <AANLkTikZkfhA2Wu7_P_z5UX0Z5QeHa-W8TNksR1n4GV2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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

I had great hopes of doing these status reports once a week; but it
turns out to take more effort to get together that I estimated.
Here's the status of ARM device tree support as of today.  As always,
let me know if you have any corrections or additional information.

1 - Latest news
---------------
- The last vestiges of of_platform_bus_type are gone from Linus' tree
as of the 2.6.39 merge window.  Everything should be using
platform_device now.
- devicetree/arm on git://git.secretlab.ca/git/linux-2.6 has
everything needed to turn on basic device tree support for any
platform.
  - Support has been added for Versatile and Tegra in devicetree/arm
  - Support for Samsung s5pv310 and Freescale mx5 are in devicetree/test
- Similarly, u-boot needs to have the CONFIG_OF_LIBFDT and
CONFIG_SYS_BOOTMAPSZ defined to turn on device tree support.
  - I've also got patches that eliminate the need for
CONFIG_SYS_BOOTMAPSZ which I'll post shortly, but they're not quite
working yet.
  - I've also got a trivial patch that should enabled CONFIG_OF_LIBFDT
on a large set of boards, but it has had pretty much zero testing.
:-)
- Jason Hui has been making awesome progress on mx5, and some of their
patches are in devicetree/test.  Hopefully to move over to
devicetree/arm soon.
- Shawn Guo has also been making good progress on adding the clock
bindings to the mx5 support.  There are still questions up in the air
about the best way to handle clocks though.  While all the clocks
/can/ be converted to device tree data, there is also value in sharing
clock initialization data between DT and non-DT board support.  The
of_platform_device_prepare() work mentioned below will help with that.
 It will also be easier to work on the clock support when the common
struct clk patch series from Jeremy gets merged.  Until then there
ends up being a lot of duplication of code.
- Lennert has a series of virq patches for ARM patches completed.  He
is currently working on cleaning them up to get them posted.
- Patches posted for of_platform_prepare() which makes it easier for
static platform_device registrations to co-exist with device tree
data.  Patches are currently in devicetree/test, and will move to
devicetree/arm shortly.
- Basic DT support has been merged into Nicolas' Linaro kernel tree.
- DT is also working on Versatile Express, OMAP, and the new Xilinx
platform, but I don't have patches for either of those platforms in my
tree.
- Rob Herring's work on the early dtb mmu maping is mainlined and
makes it much nicer to work with dtbs.

Next steps:
--------------
At this point I'm putting on my Linaro hat.  Feel free to tune out
past this point if you're not interested how DT support will
materialize in the next release.

There are a number of very specific tasks that need to be completed
for the 11.05 release.  The goal is to have basic device tree support
turned on and working on all of the platforms supported in the
release.  There isn't a lot of time to get this pulled together, but
all the infrastructure is in places, so most of the work is turning on
the configuration options and testing the platforms.

For each board, I need an engineer to do the following:

1) Enable CONFIG_OF_LIBFDT and CONFIG_SYS_BOOTMAPSZ against the Linaro
u-boot tree.
2) Enable CONFIG_OF and CONFIG_PROC_DEVICETREE in the kernel
3) Add something like the following to the *existing* machine
definition.  For initial basic support, you don't need to create a
separate <soc>-dt.c board support file yet.

+static const char *omap4_panda_dt_match[] __initdata = {
+       "ti,omap4-panda",
+       NULL
+};
+
 MACHINE_START(OMAP4_PANDA, "OMAP4 Panda board")
[...]
+       .dt_compat      = omap4_panda_dt_match,
 MACHINE_END

    The string in the match table should be in the form "<vendor>,<board-name>"

4) Add a template .dts file for the board in
arch/arm/boot/dts/<board>.dts.  The following should be sufficient:

/dts-v1/;

/ {
        model = "TI OMAP4 PandaBoard";
        compatible = "ti,omap4-panda";
        #address-cells = <1>;
        #size-cells = <1>;

        aliases {
        };

        memory {
                device_type = "memory";
                reg = <0x80000000 0x08000000>;
        };

        chosen {
        };
};
5) test it  :-)
6) send patches to me for inclusion in the Linaro U-Boot and Kernel
trees.  I'll collect them to start and ask John and Nicolas to pull
them into their trees when they're ready.

This is enough for very basic device tree support and I expect it will
only take a day or so of effort to get completed.  It won't be
particularly useful, but it ensures that the infrastructure is enabled
and working.

Bonus points if you're also able to provide patches that add
of_platform_device_probe() and of_platform_bus_populate() calls to the
board support so that device nodes get attached to the devices and can
be used for attaching things like gpios, spi devices, and i2c devices.
 This is a nice to have for 11.05, but it isn't a requirement to have
it working on all boards.

Here is the list of hwpacks that should be supported to the best of my
knowledge.  Please reply with the hwpacks you can take responsibility
for:

efikamx
igep
imx51
omap3-x11-base
omap3
overo
panda
s5pv310
vexpress

There are also some specific cross-platform tasks that need some love.
 Let me know if you can take responsibility for any of these items.
- Eliminate CONFIG_SYS_BOOTMAPSZ dependency from U-Boot.  I've got a
patch series that does this, but it is untested.  I'll post the series
tomorrow.
- Add packaging of .dtb files into linux-image-linaro-* packages.
Loic and I discussed putting them under /lib/dtb/`uname -r`/, but
thinking about it more, it might make more sense to share the modules
directory and use /lib/modules/`uname -r`/dtbs.  The dtc tool needed
to build the .dtbs is included with the kernel tree.
- Add relevant dtb files to boot partition in linaro-image tools
- Add boot script which passes dtb as 3rd argument to 'bootm'

For purposes of tracking, I'll register bugs for the above items in
the Linaro bug tracker tomorrow.

Cheers,
g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
