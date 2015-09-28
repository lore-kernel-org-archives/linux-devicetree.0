From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] memory: pl17x: add support of PL175 and PL176 controllers
Date: Mon, 28 Sep 2015 19:50:43 +0300
Message-ID: <1443459043-24144-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The change adds support of ARM PrimeCell PL175 MPMC and PL176 MPMC,
the static memory controllers on devices are similar to one found on
ARM PrimeCell PL172, add support to the existing driver.

Vladimir Zapolskiy (4):
  memory: pl172: correct MPMC peripheral ID register bits
  memory: pl172: add ARM PrimeCell PL175 MPMC support
  memory: pl172: add ARM PrimeCell PL176 MPMC support
  doc: dt: arm,pl172: add description of PL175 and PL176 controllers

 .../bindings/memory-controllers/arm,pl172.txt      |  8 ++++---
 drivers/memory/pl172.c                             | 26 +++++++++++++++++++---
 2 files changed, 28 insertions(+), 6 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
