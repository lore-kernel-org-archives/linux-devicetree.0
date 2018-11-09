From: Matheus Tavares <matheus.bernardino@usp.br>
Subject: [PATCH 5/6] staging:iio:ad2s90: Add SPDX license identifier
Date: Fri,  9 Nov 2018 20:00:43 -0200
Message-ID: <20181109220044.24843-6-matheus.bernardino@usp.br>
References: <20181109220044.24843-1-matheus.bernardino@usp.br>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181109220044.24843-1-matheus.bernardino@usp.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Ardelean <alexandru.ardelean@analog.com>, kernel-usp@googlegroups.com, victorcolombo@gmail.com
List-Id: devicetree@vger.kernel.org

This patch adds the SPDX GPL-2.0-only license identifier to ad2s90.c,
which solves the checkpatch.pl warning:
"WARNING: Missing or malformed SPDX-License-Identifier tag in line 1".

Signed-off-by: Matheus Tavares <matheus.bernardino@usp.br>
---
 drivers/staging/iio/resolver/ad2s90.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/iio/resolver/ad2s90.c b/drivers/staging/iio/resolver/ad2s90.c
index 949ff55ac6b0..f439da721df8 100644
--- a/drivers/staging/iio/resolver/ad2s90.c
+++ b/drivers/staging/iio/resolver/ad2s90.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * ad2s90.c simple support for the ADI Resolver to Digital Converters: AD2S90
  *
-- 
2.18.0
