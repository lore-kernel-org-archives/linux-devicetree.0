From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: irqchip: Add driver for Loongson-1 intc v6
Date: Fri,  1 Feb 2019 14:22:34 +0800
Message-ID: <20190201062236.17903-1-jiaxun.yang@flygoat.com>
References: <20190122154557.22689-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122154557.22689-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

v1->v2: Fix SPDX-License-Identifier
v2->v3: Rework according suggestions from Marc Zyngier, Thanks.
v3->v4: Rework the driver into a single chip driver.
v4->v5: Fix minor issues.
v5->v6: Fix doc and collect Rob's review tag.
