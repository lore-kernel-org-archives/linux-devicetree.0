Return-Path: <robherring2@gmail.com>
Message-ID: <52157368.1000801@gmail.com>
Date: Wed, 21 Aug 2013 21:11:52 -0500
From: Rob Herring <robherring2@gmail.com>
MIME-Version: 1.0
Subject: [GIT PULL] Devicetree fix for 3.11
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Wladislav Wiebe <wladislav.kw@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-ID: <devicetree@vger.kernel.org>

Hi Linus,

Please pull this single fix for a missing memory initialization in DT 
unflattening code.

Rob

The following changes since commit d4e4ab86bcba5a72779c43dc1459f71fea3d89c8:

  Linux 3.11-rc5 (2013-08-11 18:04:20 -0700)

are available in the git repository at:

  git://sources.calxeda.com/kernel/linux.git tags/devicetree-fixes-for-3.11

for you to fetch changes up to 9e40127526e857fa3f29d51e83277204fbdfc6ba:

  of: fdt: fix memory initialization for expanded DT (2013-08-21 20:05:49 -0500)

----------------------------------------------------------------
For DT unflattening, add missing memory initialization. This is needed
for arches like PPC that use memblock_alloc. This appears to have been
an issue for some time, but is a somewhat limited usecase of OF_DYNAMIC.

----------------------------------------------------------------
Wladislav Wiebe (1):
      of: fdt: fix memory initialization for expanded DT

 drivers/of/fdt.c | 2 ++
 1 file changed, 2 insertions(+)
