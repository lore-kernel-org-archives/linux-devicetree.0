From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 4/5] RISC-V: Export few kernel symbols
Date: Thu, 1 Aug 2019 08:56:33 -0700
Message-ID: <20190801155633.GA366@infradead.org>
References: <20190801005843.10343-1-atish.patra@wdc.com>
 <20190801005843.10343-5-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190801005843.10343-5-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Anup Patel <anup.patel@wdc.com>, Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@sifive.com>, Gary Guo <gary@garyguo.net>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Enrico Weigelt <info@metux.net>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 05:58:42PM -0700, Atish Patra wrote:
> Export few symbols used by kvm module. Without this, kvm can not
> be compiled as a module.

Please add this to the kvm series instead as we don't merge exports
without their users in the same series.
