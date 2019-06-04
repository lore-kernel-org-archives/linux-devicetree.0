From: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH v3 4/5] riscv: dts: add initial support for the SiFive FU540-C000 SoC
Date: Tue, 04 Jun 2019 16:38:51 +0200
Message-ID: <86sgsph0uc.fsf@baylibre.com>
References: <20190602080500.31700-1-paul.walmsley@sifive.com> <20190602080500.31700-5-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190602080500.31700-5-paul.walmsley@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>, ShihPo Hung <shihpo.hung@sifive.com>
List-Id: devicetree@vger.kernel.org

On Sun 02 Jun 2019 at 01:04, Paul Walmsley <paul.walmsley@sifive.com> wrote:

> Add initial support for the SiFive FU540-C000 SoC.  This is a 28nm SoC
> based around the SiFive U54-MC core complex and a TileLink
> interconnect.
>
> This file is expected to grow as more device drivers are added to the
> kernel.
>
> This patch includes a fix to the QSPI memory map due to a
> documentation bug, found by ShihPo Hung <shihpo.hung@sifive.com>, adds
> entries for the I2C controller, and merges all DT changes that
> formerly were made dynamically by the riscv-pk BBL proxy kernel.
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
Tested-by: Loys Ollivier <lollivier@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: ShihPo Hung <shihpo.hung@sifive.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
