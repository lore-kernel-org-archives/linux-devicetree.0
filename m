From: Vineet Gupta <vineet.gupta1@synopsys.com>
Subject: Re: [PATCH v4 6/6] arch: Move initrd= parsing into
 do_mounts_initrd.c
Date: Tue, 13 Nov 2018 00:40:08 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075013A592A0B@us01wembx1.internal.synopsys.com>
References: <20181105225431.24485-1-f.fainelli@gmail.com>
 <20181105225431.24485-7-f.fainelli@gmail.com>
 <C2D7FE5348E1B147BCA15975FBA23075013A5929ED@us01wembx1.internal.synopsys.com>
 <05f56763-1530-933d-2ce3-3653ad4c685f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Vineet Gupta <vineet.gupta1@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <rmk+kernel@armlinux.org.uk>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrey Konovalov <andreyknvl@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stefan Agner <stefan@agner.ch>, Johannes Weiner <hannes@cmpxchg.org>, Greg Hackmann <ghackmann@android.com>, Kristina Martsenko <kristina.martsenko@arm.com>, CHANDAN VN <chandan.vn@samsung.com>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lis>
List-Id: devicetree@vger.kernel.org

On 11/12/18 4:38 PM, Florian Fainelli wrote:=0A=
>>>  #ifdef CONFIG_BLK_DEV_INITRD=0A=
>>> -	if (initrd_start)=0A=
>>> -		memblock_reserve(__pa(initrd_start), initrd_end - initrd_start);=0A=
>>> +	if (phys_initrd_size) {=0A=
>>> +		memblock_reserve(phys_initrd_start, phys_initrd_size);=0A=
>>> +		initrd_start =3D (unsigned long)__va(phys_initrd_start);=0A=
>>> +		initrd_end =3D initrd_start + phys_initrd_size;=0A=
>>> +	}=0A=
>>>  #endif=0A=
>> The common code now uses phys_initrd*, and you also use the same in ARC =
code, do=0A=
>> we still need the initrd_* setting here ?=0A=
>> ARC semantics was using them as PA anyways.=0A=
> Yes, the generic initrd code expects initrd_start/end to be virtual=0A=
> addresses, which we now directly derive from phys_initrd_start, that=0A=
> should really be equivalent.=0A=
=0A=
So we can skip this explicit setting above - ARC arch code doesn't access t=
he virt=0A=
initrd_start=0A=
