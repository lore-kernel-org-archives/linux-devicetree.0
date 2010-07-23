From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Respinning my test-devicetree branch
Date: Fri, 23 Jul 2010 02:16:30 -0600
Message-ID: <AANLkTimsJRHchDJPemDkz6wkXgTzYtS_c0eDru6uQXt-@mail.gmail.com>
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
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jeremy,

I've respun my test-devicetree branch and dropped a bunch of patches
in preference for ones in your arm-dt branch.  Here are my notes as I
was working on it.

- skipped 94b9eca arm/dt: Allow CONFIG_OF on ARM
   The version in my tree reflects changes to the drivers/of code
- cherry picked 5769648 arm/dt: postpone mdesc lookup until setup_arch
when booting with a DT
  - qemu would no longer boot on normal versatilepb with this patch.
Had to change compare to use "beq" to get it to boot.
- cherry picked 79e501e arm/dt: save device tree pointer in early boot code

- cherry picked 4ac36ea arm/dt: allow bootmem reservation for device tree blob
  - Please add my s-o-b line to this patch.  A chunk of that patch
seems to be based on one of the patches I wrote ("arm/devicetree:
Reserve memory used by dtb blob".  Correct me if I'm not remembering
correctly).

- cherry picked fbdf9cf arm/dt: hook device tree setup into boot code
- cherry picked 47ae655 arm/dt: probe for platforms via the device tree
- cherry picked f528a85 drivers/amba: separate periphid probe logic
from amba_device_register
- cherry picked bf5ef5c drivers/amba: probe via device tree


I cherry picked the generic clock stuff, but I should probably merge
in your clock tree instead.  None of this is stuff that I will be
carrying in my tree over the long term:
- cherry picked b156e35 Add a common struct clk
- cherry picked 0a2e3d8 clk: Generic support for fixed-rate clocks
- cherry picked 122a467 arm/clkdev: Allow common struct clk usage
- cherry picked 8a9c892 arm/plat-versatile: convert to common struct clk

For the of-clocks I've cherry picked the following and then made some
changes on top:
- cherry picked 0177ef5 of: add clock providers
  - Fixed up Kconfig conflicts
- cherry picked 6bdbbd7 of/clk: parse fixed clocks
- cherry picked c0e03fa arm/clkdev: lookup clocks from OF clock providers
- Added patch "of/clock: rework to new binding"
  - I'm still working on this.  I'll post to the ML it I've tested it.

Finally I've cherry picked the modified versatile platform, and made a
few changes for my own purpose.
- cherry picked 91eb8b8 arm/versatile: add a device tree versatile platform
- squashed into 91eb8b8:  b1e67d2 arm/versatile: probe devices from device tree

Also have a couple of patches on top to fix a phandle endian issue and
to fix booting of versatilepb when the dt patches are applied:

Everything seems to be working, and I've pushed it out to my tree.
I'll hack on it some more tomorrow.

Cheers,
g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
