From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 1/3] dts: RISC-V vendor prefix
Date: Thu, 29 Jun 2017 16:45:29 -0700 (PDT)
Message-ID: <mhng-2736aef3-140f-497b-9870-29fbdadfdb88@palmer-si-x1c4>
References: <20170629203515.furw573zz2uu76pa@rob-hp-laptop>
Mime-Version: 1.0 (MHng)
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170629203515.furw573zz2uu76pa@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, jic23@kernel.org, treding@nvidia.com, maxime.ripard@free-electrons.com, marek.vasut@gmail.com, ccc94453@vip.cybercity.dk, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 29 Jun 2017 13:35:15 PDT (-0700), robh@kernel.org wrote:
> On Mon, Jun 26, 2017 at 10:21:22PM -0700, Palmer Dabbelt wrote:
>> RISC-V systems use device tree to specify the memory layout of the
>> system.  This patch reserves the "riscv" vendor prefix, which will be
>> used for devices that are specified by the various RISC-V ISA
>> specifications.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>  1 file changed, 1 insertion(+)
>
> Applied with subject fixup.

Thanks!
