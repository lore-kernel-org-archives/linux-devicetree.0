From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [GIT PULL] devicetree changes for v3.3
Date: Thu, 5 Jan 2012 00:11:25 -0700
Message-ID: <CACxGe6udggDJ2QCRXGKzPwHUwzPsFLPZ1Ogc-Negx9z=UHEntg@mail.gmail.com>
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
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull the following device tree changes queued up for 3.3.

There is a signed tag for this pull request: devicetree-for-linus-20120104

The following changes since commit 805a6af8dba5dfdd35ec35dc52ec0122400b2610:

  Linux 3.2 (2012-01-04 15:55:44 -0800)

are available in the git repository at:
  git://git.secretlab.ca/git/linux-2.6 devicetree/merge

Benoit Cousson (1):
      of/base: Take NULL string into account for property with multiple str=
ings

David Daney (1):
      OF/device-tree: Add some entries to vendor-prefixes.txt

Dong Aisheng (1):
      dt: reform for_each_property to for_each_property_of_node

Fabio Estevam (1):
      ARM: prom.h: Fix build error by removing unneeded header file

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
 .../devicetree/bindings/i2c/trivial-devices.txt    |   58 ++++++++++++++++=
++++
 .../devicetree/bindings/vendor-prefixes.txt        |    3 +
 arch/arm/include/asm/mach/arch.h                   |    2 +-
 arch/arm/include/asm/prom.h                        |    1 -
 drivers/i2c/busses/i2c-designware-platdrv.c        |   12 ++++
 drivers/of/base.c                                  |   10 ++--
 drivers/of/fdt.c                                   |    5 +-
 drivers/of/pdt.c                                   |    2 +-
 include/linux/of.h                                 |   33 ++++++------
 include/linux/of_fdt.h                             |    4 +-
 kernel/irq/irqdomain.c                             |    3 +
 12 files changed, 125 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-designware.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/trivial-devices.t=
xt


-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
