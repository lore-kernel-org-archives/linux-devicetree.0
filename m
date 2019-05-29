From: Atish Patra <atish.patra@wdc.com>
Subject: [PATCH v6 7/7] MAINTAINERS: Add an entry for generic architecture topology
Date: Wed, 29 May 2019 14:13:40 -0700
Message-ID: <20190529211340.17087-8-atish.patra@wdc.com>
References: <20190529211340.17087-1-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529211340.17087-1-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will.deacon@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Juri Lelli <juri.lelli@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, Catalin Marinas <catalin.marinas@arm.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Morten Rasmussen <morten.rasmussen@arm.com>, Otto Sabart <ottosabart@seberm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsl>
List-Id: devicetree@vger.kernel.org

From: Sudeep Holla <sudeep.holla@arm.com>

arm and arm64 shared lot of CPU topology related code. This was
consolidated under driver/base/arch_topology.c by Juri. Now RISC-V
is also started sharing the same code pulling more code from arm64
into arch_topology.c

Since I was involved in the review from the beginning, I would like
to assume maintenance for the same.

Cc: Will Deacon <will.deacon@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Juri Lelli <juri.lelli@redhat.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 429c6c624861..f0b72ed51e22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6583,6 +6583,13 @@ W:	https://linuxtv.org
 S:	Maintained
 F:	drivers/media/radio/radio-gemtek*
 
+GENERIC ARCHITECTURE TOPOLOGY
+M:	Sudeep Holla <sudeep.holla@arm.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	drivers/base/arch_topology.c
+F:	include/linux/arch_topology.h
+
 GENERIC GPIO I2C DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 S:	Supported
-- 
2.21.0
