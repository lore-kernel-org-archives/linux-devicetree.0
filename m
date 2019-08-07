From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 1/4] RISC-V: Remove per cpu clocksource
Date: Wed, 7 Aug 2019 10:04:01 +0200
Message-ID: <5687851a-2cdb-95a2-708f-30f6c14ba817@linaro.org>
References: <20190803042723.7163-1-atish.patra@wdc.com>
 <20190803042723.7163-2-atish.patra@wdc.com>
 <alpine.DEB.2.21.9999.1908061437000.13971@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1908061437000.13971@viisi.sifive.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Alan Kao <alankao@andestech.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, devicetree@vger.kernel.org, Enrico Weigelt <info@metux.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On 06/08/2019 23:37, Paul Walmsley wrote:
> On Fri, 2 Aug 2019, Atish Patra wrote:
> 
>> There is only one clocksource in RISC-V. The boot cpu initializes
>> that clocksource. No need to keep a percpu data structure.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> 
> Thanks, queued for v5.3-rc4.

Please, in the future wait for my:

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
