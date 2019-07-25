From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v8 0/7] Unify CPU topology across ARM & RISC-V
Date: Wed, 24 Jul 2019 18:24:22 -0700
Message-ID: <ea88d4f4-eff8-adba-3135-0d480f501d48@wdc.com>
References: <20190627195302.28300-1-atish.patra@wdc.com>
 <alpine.DEB.2.21.9999.1907121012050.2267@viisi.sifive.com>
 <alpine.DEB.2.21.9999.1907221224170.23563@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1907221224170.23563@viisi.sifive.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Catalin Marinas <catalin.marinas@arm.com>, "David S. Miller" <davem@davemloft.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Mark Rutland <Mark.Rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Morten Rasmussen <morten.rasmussen@arm.com>, Otto Sabart <ottosabart@seberm.com>, Palmer Dabbelt <palmer@sifive.com>, Peter Zijlstr
List-Id: devicetree@vger.kernel.org

On 7/22/19 12:25 PM, Paul Walmsley wrote:
> On Fri, 12 Jul 2019, Paul Walmsley wrote:
> 
>> On Thu, 27 Jun 2019, Atish Patra wrote:
>>
>>> The cpu-map DT entry in ARM can describe the CPU topology in much better
>>> way compared to other existing approaches. RISC-V can easily adopt this
>>> binding to represent its own CPU topology. Thus, both cpu-map DT
>>> binding and topology parsing code can be moved to a common location so
>>> that RISC-V or any other architecture can leverage that.
>>> different config for the architectures that do not support them.
>>
>> Once v5.3-rc1 is released, let's plan to get these patches rebased and
>> reposted and into linux-next as soon as possible.
> 
> These CPU topology patches are now queued for v5.4-rc1.  They should enter
> linux-next shortly.
> 
> 
> - Paul
> 

Thanks!!

-- 
Regards,
Atish
