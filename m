From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 3/3] edac: sifive: Add EDAC platform driver for SiFive SoCs
Date: Thu, 18 Apr 2019 14:50:15 +0200
Message-ID: <20190418125015.GI27160@zn.tnic>
References: <1555328443-30874-1-git-send-email-yash.shah@sifive.com>
 <1555328443-30874-4-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1555328443-30874-4-git-send-email-yash.shah@sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Yash Shah <yash.shah@sifive.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com, robh+dt@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, mchehab@kernel.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 15, 2019 at 05:10:43PM +0530, Yash Shah wrote:
> This initial ver of EDAC driver supports:
> - ECC event monitoring and reporting through the EDAC framework for SiFive
>   L2 cache controller.
> 
> This driver registers for notifier events from the L2 cache controller
> driver (arch/riscv/mm/sifive_l2_cache.c) for L2 ECC events
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  arch/riscv/Kconfig         |   1 +
>  drivers/edac/Kconfig       |   6 +++
>  drivers/edac/Makefile      |   1 +
>  drivers/edac/sifive_edac.c | 121 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 129 insertions(+)
>  create mode 100644 drivers/edac/sifive_edac.c

Please add a MAINTAINERS entry like the other EDAC drivers do so that
you can get CCed on patches/bug reports.

The rest looks ok to me.

I'd still like for James to have a look too, when he gets to it.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
