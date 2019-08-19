Return-Path: <SRS0=5k37=WP=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: iio: light: isl29501: Rename bindings documentation file
Date: Mon, 19 Aug 2019 16:01:05 +0200
Message-Id: <20190819140105.18800-1-horms+renesas@verge.net.au>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Rename the bindings documentation file for Renesas ISL29501 Time-of-flight
sensor from isl29501.txt to renesas,isl29501.txt.

This is part of an ongoing effort to name bindings documentation files for
Renesas IP blocks consistently, in line with the compat strings they
document.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v5.3-rc1
---
 .../bindings/iio/light/{isl29501.txt => renesas,isl29501.txt}         | 0
 Makefile                                                              | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/iio/light/{isl29501.txt => renesas,isl29501.txt} (100%)

diff --git a/Documentation/devicetree/bindings/iio/light/isl29501.txt b/Documentation/devicetree/bindings/iio/light/renesas,isl29501.txt
similarity index 100%
rename from Documentation/devicetree/bindings/iio/light/isl29501.txt
rename to Documentation/devicetree/bindings/iio/light/renesas,isl29501.txt
diff --git a/Makefile b/Makefile
index fd6f7949bc1a..9be5834073f8 100644
--- a/Makefile
+++ b/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 VERSION = 5
-PATCHLEVEL = 2
+PATCHLEVEL = 3
 SUBLEVEL = 0
-EXTRAVERSION =
+EXTRAVERSION = -rc1
 NAME = Bobtail Squid
 
 # *DOCUMENTATION*
-- 
2.11.0
