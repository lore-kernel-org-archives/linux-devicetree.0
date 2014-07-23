From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND v2] bus: ARM CCN PMU driver
Date: Wed, 23 Jul 2014 23:29:33 +0200
Message-ID: <39594081.3C5fmmXpMJ@wuerfel>
References: <1406050379-15199-1-git-send-email-pawel.moll@arm.com> <201407232223.39341.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201407232223.39341.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, Stephane Eranian <eranian@google.com>, Jiri Olsa <jolsa@redhat.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 23 July 2014 22:23:38 Arnd Bergmann wrote:
> On Tuesday 22 July 2014, Pawel Moll wrote:
> > Driver providing perf backend for ARM Cache Coherent Network
> > interconnect. Supports counting all hardware events and crosspoint
> > watchpoints.
> > 
> > Currently works with CCN-504 only, although there should be
> > no changes required for CCN-508 (just impossible to test it now).
> > 
> > Signed-off-by: Pawel Moll <pawel.moll@arm.com>
> 
> Applied to next/drivers, thanks!

I'm getting build errors with CONFIG_PERF_EVENTS disabled. 
Is the patch below the right answer, or should we still load
the driver and #ifdef the perf-events code?

It seems to me that the driver doesn't do anything besides
perf events, but I could be missing something.

	Arnd

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 5c0c2764839f..603eb1be4f6a 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -53,6 +53,7 @@ config ARM_CCI
 config ARM_CCN
 	bool "ARM CCN driver support"
 	depends on ARM || ARM64
+	depends on PERF_EVENTS
 	help
 	  PMU (perf) driver supporting the ARM CCN (Cache Coherent Network)
 	  interconnect.
