From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/11] RISC-V: Support per-hart timebase-frequency
Date: Sat, 4 Aug 2018 11:58:51 +0200
Message-ID: <20180804095851.GA12794@lst.de>
References: <20180802115008.4031-1-hch@lst.de> <20180802115008.4031-10-hch@lst.de> <fef973e1-6efc-0eff-2789-4a4b5b01900b@wdc.com> <20180803123357.GC18301@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180803123357.GC18301@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: Christoph Hellwig <hch@lst.de>, "tglx@linutronix.de" <tglx@linutronix.de>, "palmer@sifive.com" <palmer@sifive.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "anup@brainfault.org" <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "shorne@gmail.com" <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

Actually I had a slight change of heart: I'm going to drop both
timebase frequence patches and the enable method documentation one
from this series as they aren't strictly required to get a booting
qemu kernel.
