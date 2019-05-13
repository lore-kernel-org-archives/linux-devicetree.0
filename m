From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] RISC-V: Add DT documentation for SiFive L2 Cache
 Controller
Date: Mon, 13 May 2019 12:25:28 -0500
Message-ID: <20190513172528.GA9362@bogus>
References: <1557139720-12384-1-git-send-email-yash.shah@sifive.com>
 <1557139720-12384-2-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557139720-12384-2-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, palmer@sifive.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, mark.rutland@arm.com, robh+dt@kernel.org, sachin.ghadi@sifive.com, afd@ti.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

On Mon,  6 May 2019 16:18:39 +0530, Yash Shah wrote:
> Add device tree bindings for SiFive FU540 L2 cache controller driver
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
