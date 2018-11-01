From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 01/21] of: Add cpu node iterator for_each_of_cpu_node()
Date: Thu, 01 Nov 2018 21:52:57 +1100
Message-ID: <87tvl1dq7q.fsf@concordia.ellerman.id.au>
References: <20180905193738.19325-1-robh@kernel.org> <20180905193738.19325-2-robh@kernel.org> <874ld3jz6v.fsf@concordia.ellerman.id.au> <871s87jz3g.fsf@concordia.ellerman.id.au> <CABGGisw_bd+bJedZ_T2e-dxmRnXf2N_gGBZj8u+QVGQxj_gc+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABGGisw_bd+bJedZ_T2e-dxmRnXf2N_gGBZj8u+QVGQxj_gc+Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Frank Rowand <frowand.list@gmail.com>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

Rob Herring <robh@kernel.org> writes:
> On Tue, Oct 30, 2018 at 9:20 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>> > Hi Rob,
>> >
>> > Sorry I missed this when you posted it.
>> >
>> > Rob Herring <robh@kernel.org> writes:
>> >> Iterating thru cpu nodes is a common pattern. Create a common iterator
>> >> which can find child nodes either by node name or device_type == cpu.
>> >> Using the former will allow for eventually dropping device_type
>> >> properties which are deprecated for FDT.
>> >
>> > Device trees we see on powerpc generally don't (never?) use "cpu" as the
>> > node name for CPU nodes. And many of those device trees come from
>> > firmware, so we can't update them.
>> >
>> > So dropping support for device_type is a non-starter from our POV.
>>
>> ps. presumably that's what you meant by deprecated *for FDT*.
>
> Right.
>
>> But anyway just wanted to make sure we are on the same page.
>
> Yes, I was aware at least older powerpc DTs don't use 'cpu' for node names.

Actually newer ones too, see below :)

And there's code out there that expects this, so we can't realistically
change it any time soon :/

  https://github.com/ibm-power-utilities/powerpc-utils/blob/master/src/drmgr/common_cpu.c#L186
  https://github.com/ibm-power-utilities/powerpc-utils/blob/master/src/ppc64_cpu.c#L344

cheers

$ ls -d1 /proc/device-tree/cpus/PowerPC\,POWER9@*
/proc/device-tree/cpus/PowerPC,POWER9@14
/proc/device-tree/cpus/PowerPC,POWER9@1c
/proc/device-tree/cpus/PowerPC,POWER9@34
/proc/device-tree/cpus/PowerPC,POWER9@3c
/proc/device-tree/cpus/PowerPC,POWER9@4
/proc/device-tree/cpus/PowerPC,POWER9@48
/proc/device-tree/cpus/PowerPC,POWER9@54
/proc/device-tree/cpus/PowerPC,POWER9@804
/proc/device-tree/cpus/PowerPC,POWER9@80c
/proc/device-tree/cpus/PowerPC,POWER9@814
/proc/device-tree/cpus/PowerPC,POWER9@81c
/proc/device-tree/cpus/PowerPC,POWER9@834
/proc/device-tree/cpus/PowerPC,POWER9@83c
/proc/device-tree/cpus/PowerPC,POWER9@844
/proc/device-tree/cpus/PowerPC,POWER9@84c
/proc/device-tree/cpus/PowerPC,POWER9@c
