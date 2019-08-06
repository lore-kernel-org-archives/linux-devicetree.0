From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v4 1/4] RISC-V: Remove per cpu clocksource
Date: Tue, 6 Aug 2019 14:37:58 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1908061437000.13971@viisi.sifive.com>
References: <20190803042723.7163-1-atish.patra@wdc.com>
 <20190803042723.7163-2-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190803042723.7163-2-atish.patra@wdc.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Atish Patra <atish.patra@wdc.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>, Alan Kao <alankao@andestech.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Johan Hovold <johan@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, Enrico Weigelt <info@metux.net>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, 2 Aug 2019, Atish Patra wrote:

> There is only one clocksource in RISC-V. The boot cpu initializes
> that clocksource. No need to keep a percpu data structure.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Thanks, queued for v5.3-rc4.


- Paul
