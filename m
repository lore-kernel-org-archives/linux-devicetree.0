From: Maciej Purski <m.purski@samsung.com>
Subject: [RFC PATCH v2 0/3] Add coupled regulators mechanism
Date: Wed, 18 Oct 2017 14:46:59 +0200
Message-ID: <1508330822-8039-1-git-send-email-m.purski@samsung.com>
References: <CGME20171018124722eucas1p23aa3280d33bfd38650783ac7f52b9909@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Maciej Purski <m.purski@samsung.com>
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

Open question - which locking model should be used, because
during balancing voltages we need to lock all coupled regulators
and their parents. Unfortunately, some coupled regulators might
have common parents. I can see three possibilities here:
1. (current implementation) Always lock all coupled regulators and additionally
   lock parents only for changing voltage of the individual regulator
2. Always lock all coupled regulators and their parents - to avoid deadlock
   on common parent, first enumerate locks, then sort them and remove double
   entries
3. Always lock all coupled regulators and their parents - to avoid deadlock
   on common parent, introduce so called reentrant locks (lock which might
   be taken multiple times by the same process).


Best regards,

	Maciej Purski

--
Changes in RFC v2:
- allow coupling n regulators (in fact up to constant value, now
  set to 10)
- change algorithm to be more readable
- introduce better locking
- add more comments
- split first patch into two
- update commit messages
- change sequence of the patches

Maciej Purski (3):
  regulator: bindings: Add properties for coupled regulators
  regulator: core: Parse coupled regulators properties
  regulator: core: Balance coupled regulators voltages

 .../devicetree/bindings/regulator/regulator.txt    |   4 +
 drivers/regulator/core.c                           | 487 ++++++++++++++++++++-
 include/linux/regulator/driver.h                   |  17 +
 3 files changed, 492 insertions(+), 16 deletions(-)

-- 
2.7.4
