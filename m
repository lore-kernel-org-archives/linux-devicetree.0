From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v2 2/4] clk: renesas: Add r8a7796 CPG Core Clock
 Definitions
Date: Thu, 9 Jun 2016 10:31:29 +0200
Message-ID: <94042cf8-5364-8426-a5de-b83fe291fee1@de.bosch.com>
References: <1464625737-6646-1-git-send-email-geert+renesas@glider.be>
 <1464625737-6646-3-git-send-email-geert+renesas@glider.be>
 <574C6C16.3020703@gmail.com>
 <6b57d59f-d17b-a6c3-41d5-e975db544adc@de.bosch.com>
 <CAMuHMdWByGTDcG62qTg5N69FACx4FiuVuRrF_woyFAoNOpbjSw@mail.gmail.com>
 <77a45dc7-59f0-23fc-f30d-b3daab34d689@de.bosch.com>
 <CAMuHMdW6kTMQoVO15Eve2Er5pfSiEc4LkwvQ72WU1LmdSK+CxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdW6kTMQoVO15Eve2Er5pfSiEc4LkwvQ72WU1LmdSK+CxQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk <linux-clk@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 07.06.2016 10:17, Geert Uytterhoeven wrote:
> Hi Dirk,
>
> On Tue, Jun 7, 2016 at 9:53 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> I think I just want to discuss if we have a clever idea to further improve
>> one detail. That is, if we have a clever idea to avoid the copy & paste
>> between the family members using anything like a hierarchical way of
>> defining the clocks in r8a779x-cpg-mssr.h.
>>
>>> Given the small amount of work needed to bootstrap r8a7796, I
>>> think they still hold on their promises.
>>
>> Well, regarding the r8a779x-cpg-mssr.h the small amount of work needed isn't
>> a really good argument if you are good with cp & sed for the copy & paste
>> done ;)
>
> They're not really created by cp & sed, as they must match the table in the
> datasheet (the latter may have been created by copy & paste though :-)
>
>> What I fear we end up the way we are doing the copy & paste
>> r8a779x-cpg-mssr.h is having 5 or 6 or even more of these files, all > 90%
>> identical. And once you have to change anything, you either have to change
>> all these files. Or you miss anything, ending up with subtle bugs when one
>> SoC does behave differently than an other one.
>
> The point is these files are stable ABI: no single value can be changed.
> No value can be reused. Only new values can be appended at the bottom
> (if a newer revision of the datasheet documents more clocks than the old
>  version, which happens from time to time).
>
> IMHO a hierarchical way of defining the clocks has more opportunity of
> accidentally referring to a clock that doesn't exist on a particular SoC.
>
> Furthermore, r8a779x-cpg-mssr.h is not a good name to be part of a DT binding,
> due to the wildcard.
> A future SoC may will match r8a779x and even be called (R-Car <something>3?),
> while using a completely different CPG block.


Just to give an example about what we are talking, I've done [1] below. 
This should just be an *example*, though. I'm sure that we might need a 
more clever way.

I'm interested in your opinion why it doesn't work this way ;)

Best regards

Dirk

[1]

  include/dt-bindings/clock/r8a7795-cpg-mssr.h |   51 ---------------------
  include/dt-bindings/clock/r8a7796-cpg-mssr.h |   61 
+++-----------------------
  include/dt-bindings/clock/rcar3-cpg-mssr.h   |   63 
+++++++++++++++++++++++++++
  3 files changed, 71 insertions(+), 104 deletions(-)

Index: b/include/dt-bindings/clock/r8a7795-cpg-mssr.h
===================================================================
--- a/include/dt-bindings/clock/r8a7795-cpg-mssr.h
+++ b/include/dt-bindings/clock/r8a7795-cpg-mssr.h
@@ -9,55 +9,6 @@
  #ifndef __DT_BINDINGS_CLOCK_R8A7795_CPG_MSSR_H__
  #define __DT_BINDINGS_CLOCK_R8A7795_CPG_MSSR_H__

-#include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-/* r8a7795 CPG Core Clocks */
-#define R8A7795_CLK_Z			0
-#define R8A7795_CLK_Z2			1
-#define R8A7795_CLK_ZR			2
-#define R8A7795_CLK_ZG			3
-#define R8A7795_CLK_ZTR			4
-#define R8A7795_CLK_ZTRD2		5
-#define R8A7795_CLK_ZT			6
-#define R8A7795_CLK_ZX			7
-#define R8A7795_CLK_S0D1		8
-#define R8A7795_CLK_S0D4		9
-#define R8A7795_CLK_S1D1		10
-#define R8A7795_CLK_S1D2		11
-#define R8A7795_CLK_S1D4		12
-#define R8A7795_CLK_S2D1		13
-#define R8A7795_CLK_S2D2		14
-#define R8A7795_CLK_S2D4		15
-#define R8A7795_CLK_S3D1		16
-#define R8A7795_CLK_S3D2		17
-#define R8A7795_CLK_S3D4		18
-#define R8A7795_CLK_LB			19
-#define R8A7795_CLK_CL			20
-#define R8A7795_CLK_ZB3			21
-#define R8A7795_CLK_ZB3D2		22
-#define R8A7795_CLK_CR			23
-#define R8A7795_CLK_CRD2		24
-#define R8A7795_CLK_SD0H		25
-#define R8A7795_CLK_SD0			26
-#define R8A7795_CLK_SD1H		27
-#define R8A7795_CLK_SD1			28
-#define R8A7795_CLK_SD2H		29
-#define R8A7795_CLK_SD2			30
-#define R8A7795_CLK_SD3H		31
-#define R8A7795_CLK_SD3			32
-#define R8A7795_CLK_SSP2		33
-#define R8A7795_CLK_SSP1		34
-#define R8A7795_CLK_SSPRS		35
-#define R8A7795_CLK_RPC			36
-#define R8A7795_CLK_RPCD2		37
-#define R8A7795_CLK_MSO			38
-#define R8A7795_CLK_CANFD		39
-#define R8A7795_CLK_HDMI		40
-#define R8A7795_CLK_CSI0		41
-#define R8A7795_CLK_CSIREF		42
-#define R8A7795_CLK_CP			43
-#define R8A7795_CLK_CPEX		44
-#define R8A7795_CLK_R			45
-#define R8A7795_CLK_OSC			46
+#include <dt-bindings/clock/rcar3-cpg-mssr.h>

  #endif /* __DT_BINDINGS_CLOCK_R8A7795_CPG_MSSR_H__ */
Index: b/include/dt-bindings/clock/r8a7796-cpg-mssr.h
===================================================================
--- a/include/dt-bindings/clock/r8a7796-cpg-mssr.h
+++ b/include/dt-bindings/clock/r8a7796-cpg-mssr.h
@@ -9,61 +9,14 @@
  #ifndef __DT_BINDINGS_CLOCK_R8A7796_CPG_MSSR_H__
  #define __DT_BINDINGS_CLOCK_R8A7796_CPG_MSSR_H__

-#include <dt-bindings/clock/renesas-cpg-mssr.h>
+#include <dt-bindings/clock/rcar3-cpg-mssr.h>

  /* r8a7796 CPG Core Clocks */
-#define R8A7796_CLK_Z			0
-#define R8A7796_CLK_Z2			1
-#define R8A7796_CLK_ZR			2
-#define R8A7796_CLK_ZG			3
-#define R8A7796_CLK_ZTR			4
-#define R8A7796_CLK_ZTRD2		5
-#define R8A7796_CLK_ZT			6
-#define R8A7796_CLK_ZX			7
-#define R8A7796_CLK_S0D1		8
-#define R8A7796_CLK_S0D2		9
-#define R8A7796_CLK_S0D3		10
-#define R8A7796_CLK_S0D4		11
-#define R8A7796_CLK_S0D6		12
-#define R8A7796_CLK_S0D8		13
-#define R8A7796_CLK_S0D12		14
-#define R8A7796_CLK_S1D1		15
-#define R8A7796_CLK_S1D2		16
-#define R8A7796_CLK_S1D4		17
-#define R8A7796_CLK_S2D1		18
-#define R8A7796_CLK_S2D2		19
-#define R8A7796_CLK_S2D4		20
-#define R8A7796_CLK_S3D1		21
-#define R8A7796_CLK_S3D2		22
-#define R8A7796_CLK_S3D4		23
-#define R8A7796_CLK_LB			24
-#define R8A7796_CLK_CL			25
-#define R8A7796_CLK_ZB3			26
-#define R8A7796_CLK_ZB3D2		27
-#define R8A7796_CLK_ZB3D4		28
-#define R8A7796_CLK_CR			29
-#define R8A7796_CLK_CRD2		30
-#define R8A7796_CLK_SD0H		31
-#define R8A7796_CLK_SD0			32
-#define R8A7796_CLK_SD1H		33
-#define R8A7796_CLK_SD1			34
-#define R8A7796_CLK_SD2H		35
-#define R8A7796_CLK_SD2			36
-#define R8A7796_CLK_SD3H		37
-#define R8A7796_CLK_SD3			38
-#define R8A7796_CLK_SSP2		39
-#define R8A7796_CLK_SSP1		40
-#define R8A7796_CLK_SSPRS		41
-#define R8A7796_CLK_RPC			42
-#define R8A7796_CLK_RPCD2		43
-#define R8A7796_CLK_MSO			44
-#define R8A7796_CLK_CANFD		45
-#define R8A7796_CLK_HDMI		46
-#define R8A7796_CLK_CSI0		47
-#define R8A7796_CLK_CSIREF		48
-#define R8A7796_CLK_CP			49
-#define R8A7796_CLK_CPEX		50
-#define R8A7796_CLK_R			51
-#define R8A7796_CLK_OSC			52
+#define R8A7796_CLK_ZB3D4		47
+#define R8A7796_CLK_S0D2		48
+#define R8A7796_CLK_S0D3		49
+#define R8A7796_CLK_S0D6		50
+#define R8A7796_CLK_S0D8		51
+#define R8A7796_CLK_S0D12		53

  #endif /* __DT_BINDINGS_CLOCK_R8A7796_CPG_MSSR_H__ */
Index: b/include/dt-bindings/clock/rcar3-cpg-mssr.h
===================================================================
--- /dev/null
+++ b/include/dt-bindings/clock/rcar3-cpg-mssr.h
@@ -0,0 +1,63 @@
+/*
+ * Copyright (C) 2015 Renesas Electronics Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+#ifndef __DT_BINDINGS_CLOCK_RCAR3_CPG_MSSR_H__
+#define __DT_BINDINGS_CLOCK_RCAR3_CPG_MSSR_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* RCar3 CPG Core Clocks */
+#define RCAR3_CLK_Z		0
+#define RCAR3_CLK_Z2		1
+#define RCAR3_CLK_ZR		2
+#define RCAR3_CLK_ZG		3
+#define RCAR3_CLK_ZTR		4
+#define RCAR3_CLK_ZTRD2		5
+#define RCAR3_CLK_ZT		6
+#define RCAR3_CLK_ZX		7
+#define RCAR3_CLK_S0D1		8
+#define RCAR3_CLK_S0D4		9
+#define RCAR3_CLK_S1D1		10
+#define RCAR3_CLK_S1D2		11
+#define RCAR3_CLK_S1D4		12
+#define RCAR3_CLK_S2D1		13
+#define RCAR3_CLK_S2D2		14
+#define RCAR3_CLK_S2D4		15
+#define RCAR3_CLK_S3D1		16
+#define RCAR3_CLK_S3D2		17
+#define RCAR3_CLK_S3D4		18
+#define RCAR3_CLK_LB		19
+#define RCAR3_CLK_CL		20
+#define RCAR3_CLK_ZB3		21
+#define RCAR3_CLK_ZB3D2		22
+#define RCAR3_CLK_CR		23
+#define RCAR3_CLK_CRD2		24
+#define RCAR3_CLK_SD0H		25
+#define RCAR3_CLK_SD0		26
+#define RCAR3_CLK_SD1H		27
+#define RCAR3_CLK_SD1		28
+#define RCAR3_CLK_SD2H		29
+#define RCAR3_CLK_SD2		30
+#define RCAR3_CLK_SD3H		31
+#define RCAR3_CLK_SD3		32
+#define RCAR3_CLK_SSP2		33
+#define RCAR3_CLK_SSP1		34
+#define RCAR3_CLK_SSPRS		35
+#define RCAR3_CLK_RPC		36
+#define RCAR3_CLK_RPCD2		37
+#define RCAR3_CLK_MSO		38
+#define RCAR3_CLK_CANFD		39
+#define RCAR3_CLK_HDMI		40
+#define RCAR3_CLK_CSI0		41
+#define RCAR3_CLK_CSIREF	42
+#define RCAR3_CLK_CP		43
+#define RCAR3_CLK_CPEX		44
+#define RCAR3_CLK_R		45
+#define RCAR3_CLK_OSC		46
+
+#endif /* __DT_BINDINGS_CLOCK_RCAR3_CPG_MSSR_H__ */
