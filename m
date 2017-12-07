From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 0/4] Add coupled regulators mechanism
Date: Thu, 07 Dec 2017 10:46:11 +0100
Message-ID: <1512639975-22241-1-git-send-email-m.purski@samsung.com>
References: <CGME20171207094720eucas1p1eb1c8c2d0e222082ce6918807c4ad492@eucas1p1.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
Inderpal Singh <inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

The discussion on that subject can be found here:
https://lkml.org/lkml/2014/4/29/28

Therefore this patchset is an attempt to apply the idea to regulators core
as concluded in the discussion by Mark Brown and Doug Anderson.

This feature is required to enable support for generic CPUfreq 
and devfreq drivers for the mentioned boards. 

Note on the locking model:
When balancing voltage of a group of coupled regulators, we lock all
of them for the whole operation. When voltage of an individual regulator
is about to change, its suppliers are additionally locked.


Best regards,

	Maciej Purski

---
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

Maciej Purski (4):
  regulator: core: Move of_find_regulator_by_node() to of_regulator.c
  regulator: bindings: Add properties for coupled regulators
  regulator: core: Parse coupled regulators properties
  regulator: core: Balance coupled regulators voltages

 .../devicetree/bindings/regulator/regulator.txt    |   5 +
 drivers/regulator/core.c                           | 424 +++++++++++++++++++--
 drivers/regulator/internal.h                       |  16 +
 drivers/regulator/of_regulator.c                   |  74 ++++
 include/linux/regulator/driver.h                   |  16 +
 include/linux/regulator/machine.h                  |   4 +
 6 files changed, 501 insertions(+), 38 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
