From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PULL] Devicetree for 3.3
Date: Wed, 28 Dec 2011 08:45:30 -0600
Message-ID: <4EFB2B8A.9010902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Grant,

Please pull device tree updates for 3.3. Pretty much a random collection
of minor changes. I'm including i2c-designware DT binding support here
as I've gotten no response from Ben.

Rob

The following changes since commit 384703b8e6cd4c8ef08512e596024e028c91c339:

  Linux 3.2-rc6 (2011-12-16 18:36:26 -0800)

are available in the git repository at:
  git://sources.calxeda.com/kernel/linux.git for-grant

Benoit Cousson (1):
      of/base: Take NULL string into account for property with multiple
strings

David Daney (1):
      OF/device-tree: Add some entries to vendor-prefixes.txt

Dong Aisheng (1):
      dt: reform for_each_property to for_each_property_of_node

Olof Johansson (1):
      dt/i2c: Enumerate some of the known trivial i2c devices

Rob Herring (3):
      i2c-designware: add OF binding support
      dt: add empty of_get_node/of_put_node functions
      irq: check domain hwirq range for DT translate

Sam Ravnborg (1):
      of/pdt: fix section mismatch warning

Uwe Kleine-K=F6nig (1):
      ARM/of: allow *machine_desc.dt_compat to be const

 .../devicetree/bindings/i2c/i2c-designware.txt     |   22 ++++++++
 .../devicetree/bindings/i2c/trivial-devices.txt    |   58
++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |    3 +
 arch/arm/include/asm/mach/arch.h                   |    2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c        |   12 ++++
 drivers/of/base.c                                  |   10 ++--
 drivers/of/fdt.c                                   |    4 +-
 drivers/of/pdt.c                                   |    2 +-
 include/linux/of.h                                 |   33 ++++++------
 include/linux/of_fdt.h                             |    4 +-
 kernel/irq/irqdomain.c                             |    3 +
 11 files changed, 124 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-designware.txt
 create mode 100644
Documentation/devicetree/bindings/i2c/trivial-devices.txt
