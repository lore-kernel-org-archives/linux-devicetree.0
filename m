From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 0/3] of: functions to count number of elements and convert regulators
Date: Wed, 12 Feb 2014 00:59:25 +0100
Message-ID: <2573561.oCYNnnL0gm@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@linaro.org
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

In a different thread [0] Mark Rutland suggested that drivers should not
repeatedly open-code the counting of array elements in a property as well
as handling the format and endianes of the DTB, as these should be limited
to the of_ helper functions.

Therefore the first patch introduces a set of helper functions for counting
the number of u8,...,u64 elements in a property.

The second and third patch convert the two regulator drivers that use this
pattern to instead use both of_property_count_u32_elemens as well as
of_property_read_u32_index.

gpio-regulator change tested on a s3c2416-based device, ti-abb-regulator
compile-tested only.


[0] https://lkml.org/lkml/2014/1/16/172

Heiko Stuebner (3):
  of: add functions to count number of elements in a property
  regulator: gpio-regulator: do not open-code counting and access of dt array elements
  regulator: ti-abb-regulator: do not open-code counting and access of dt array elements

 drivers/of/base.c                    |   32 ++++++++++++++
 drivers/regulator/gpio-regulator.c   |   15 +++----
 drivers/regulator/ti-abb-regulator.c |   43 +++++++++----------
 include/linux/of.h                   |   76 ++++++++++++++++++++++++++++++++++
 4 files changed, 134 insertions(+), 32 deletions(-)

-- 
1.7.10.4
