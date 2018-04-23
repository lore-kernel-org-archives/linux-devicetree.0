From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v7 0/6] Add coupled regulators mechanism
Date: Mon, 23 Apr 2018 16:33:36 +0200
Message-ID: <1524494022-22260-1-git-send-email-m.purski@samsung.com>
References: <CGME20180423143353eucas1p1d417b5995e380f6a7b168a98a76ecf40@eucas1p1.samsung.com>
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

The previous patchset should have fixed the locking issue
encountered by Fabio, but unfortunately it hasn't fixed Tony's problems with mmc.
I hope this patch fixes it, as the regulator enable path should remain the same.
I'd be very grateful for any feedback from Fabio Estevam or Tony Lindgren.

Best regards,

	Maciej Purski

---
Changes in v7:
- do not call regulator_balance_voltage(),
  when enabling a non-coupled regulator
- rebase against linux-next 20180423

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
 drivers/regulator/core.c                           | 553 ++++++++++++++++++---
 drivers/regulator/internal.h                       |  28 +-
 drivers/regulator/of_regulator.c                   | 151 ++++++
 include/linux/regulator/driver.h                   |  20 +
 include/linux/regulator/machine.h                  |   4 +
 6 files changed, 681 insertions(+), 80 deletions(-)

-- 
2.7.4
