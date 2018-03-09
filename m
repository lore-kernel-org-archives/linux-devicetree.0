From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v6 0/5] Add coupled regulators mechanism
Date: Fri, 09 Mar 2018 13:22:02 +0100
Message-ID: <1520598128-11768-1-git-send-email-m.purski@samsung.com>
References: <CGME20180309122231eucas1p1b8e0a85a73b31aa07eac08f809face6e@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Maciej Purski <m.purski@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi all,

this patchset adds a new mechanism to the framework - regulators' coupling.

On Odroid XU3/4 and other Exynos5422 based boards there is a case, that
different devices on the board are supplied by different regulators
with non-fixed voltages. If one of these devices temporarily requires 
higher voltage, there might occur a situation that the spread between 
devices' voltages is so high, that there is a risk of changing
'high' and 'low' states on the interconnection between devices powered
by those regulators. 

Algorithmicaly the problem was solved by: 
Inderpal Singh <inderpal.s@samsung.com>
Doug Anderson <dianders@chromium.org>

The discussion on that subject can be found here:
https://lkml.org/lkml/2014/4/29/28

Therefore this patchset is an attempt to apply the idea to regulators core
as concluded in the discussion by Mark Brown and Doug Anderson.

This feature is required to enable support for generic CPUfreq 
and devfreq drivers for the mentioned boards. 

The current assumption is that an uncoupled regulator is a special case
of a coupled one, so they should share a common voltage setting path.

The previous version caused locking problems on some boards. The discussion
can be found here:
https://lkml.org/lkml/2018/3/5/965

Current idea, which should solve the locking issues is making it possible to try
to lock a mutex multiple times by a single task just like it is done in clk/clk.c.
This should handle all possible coupling-supply combinations except coupling with
a supply.

I would like to kindly ask Fabio Estevam and Tony Lindgren to test the patch
series on their boards.

Best regards,

	Maciej Purski

---
Changes in v6:
- change locking model
- fix build errors on non-of architectures
- update bindings

Changes in v5:
- rebase against current Mark Brown's regulators next

Changes in v4:
- make paths for coupled and uncoupled regulators common
- coupling descriptors are now always present in regulator_dev
- fail to probe if data inconsistency is detected
- retry to resolve coupling regultors in late init call
- rebase on top of linux-next 20180119
- fix commit messages
- split patches to make the patchset easier to review

Changes in v3:
- move dts parsing code to of_regulator.c, in order to the so,
  add a new commit in which of_regulator_find_by_node() is moved
  to of_regulator.c as well
- improve error messages
- move max_spread variable to constraints
- perform resolving of coupled regulators under a list mutex
- remove useless locking functions
- some minor refactorization
- improve commit messages

Changes in RFC v2:
- allow coupling n regulators (in fact up to constant value, now
  set to 10)
- change algorithm to be more readable
- introduce better locking
- add more comments
- split first patch into two
- update commit messages
- change sequence of the patches

Maciej Purski (6):
  regulator: core: Make locks re-entrant
  regulator: bindings: Add properties for coupled regulators
  regulator: core: Parse coupled regulators properties
  regulator: core: Resolve coupled regulators
  regulator: core: Add voltage balancing mechanism
  regulator: core: Change voltage setting path

 .../devicetree/bindings/regulator/regulator.txt    |   5 +
 drivers/regulator/core.c                           | 549 ++++++++++++++++++---
 drivers/regulator/internal.h                       |  28 +-
 drivers/regulator/of_regulator.c                   | 151 ++++++
 include/linux/regulator/driver.h                   |  20 +
 include/linux/regulator/machine.h                  |   4 +
 6 files changed, 677 insertions(+), 80 deletions(-)

-- 
2.7.4
