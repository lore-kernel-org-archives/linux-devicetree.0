From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [patches] Re: [PATCH v9 03/12] dt-bindings: RISC-V CPU Bindings
Date: Mon, 20 Nov 2017 11:45:32 -0800 (PST)
Message-ID: <mhng-5bdbcbfc-d8aa-4c7e-ad08-c0a2ff786dd1@palmer-si-x1c4>
References: <20171120073528.xkv4cydyniuhzshf@latitude>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171120073528.xkv4cydyniuhzshf@latitude>
Sender: linux-kernel-owner@vger.kernel.org
To: j.neuschaefer@gmx.net, Mark Rutland <mark.rutland@arm.com>
Cc: patches@groups.riscv.org, Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, albert@sifive.com, yamada.masahiro@socionext.com, mmarek@suse.com, Will Deacon <will.deacon@arm.com>, peterz@infradead.org, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, devicetree@vger.kernel.org, rminnich@gmail.com
List-Id: devicetree@vger.kernel.org

On Sun, 19 Nov 2017 23:35:28 PST (-0800), j.neuschaefer@gmx.net wrote:
> Hi Palmer,
>
> On Thu, Oct 05, 2017 at 11:16:33AM +0100, Mark Rutland wrote:
> [...]
>> I would *strongly* recommend that from day one, you determine the SMP
>> bringup mechanism via an enable-method property, and document the
>> contract with FW/bootloader somewhere in the kernel tree.

Sorry, I forgot about this.  I've prepared a patch.

> Somewhat, but not quite related: Please consider making the availability
> of the Supervisor Binary Interface explicit in the devicetree.
> I understand that the general plan is to make the SBI a mandatory
> feature of every RISC-V system capable of running Linux, but I do want
> to explore the possibility of running without run-time resident firmware
> at some point in the future. Thus it would be nice if the devicetree
> would indicate the presence of the SBI from the start, to avoid having
> to invent a way to express its *absence* later on.
>
> It could look something like this (modelled after qcom,scm):
>
> / {
> 	firmware {
> 		sbi {
> 			compatible = "riscv,sbi";
> 		};
> 	};
> };
>
> This topic may warrant some discussion, because other people may have
> different opinions, and there hasn't been a discussion about it, AFAICS.

I don't think there's any penalty to putting it in the device tree, I'll send a 
patch.
