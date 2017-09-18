From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] Add coupled regulators mechanism
Date: Mon, 18 Sep 2017 10:39:50 +0200
Message-ID: <1505723992-11772-1-git-send-email-m.purski@samsung.com>
References: <CGME20170918084017eucas1p1a15a561f2b207f49ed05909a518e1bf5@eucas1p1.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

this patchset adds a new mechanism to the framework - regulators' coupling.

On Odroid XU3/4 and other Exynos5422 based boards there is a case, that
different devices on the board are supplied by different regulators
with non-fixed voltages. If one of these devices temporarily requires 
higher voltage, there might occur a situation that the spread between 
two devices' voltages is so high, that there is a risk of changing
'high' and 'low' states on the interconnection between devices powered
by those two regulators. 

Algorithmicaly the problem was solved by: 
Inderpal Singh <inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

The discussion on that subject can be found here:
https://lkml.org/lkml/2014/4/29/28

Therefore this patchset is an attempt to apply the idea to regulators core
as concluded in the discussion by Mark Brown and Doug Anderson.

This feature is required to enable support for generic CPUfreq 
and devfreq drivers for the mentioned boards. 

Best regards,

	Maciej Purski

Maciej Purski (2):
  regulator: core: Add coupled regulators mechanism
  regulator: bindings: Add properties for coupled regulators

 .../devicetree/bindings/regulator/regulator.txt    |   3 +
 drivers/regulator/core.c                           | 274 +++++++++++++++++++--
 include/linux/regulator/driver.h                   |  16 ++
 3 files changed, 275 insertions(+), 18 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
