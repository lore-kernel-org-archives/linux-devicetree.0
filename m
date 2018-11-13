From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 6/6] arch: Move initrd= parsing into do_mounts_initrd.c
Date: Mon, 12 Nov 2018 16:52:37 -0800
Message-ID: <04d6d0cb-8e60-88a0-061e-62c7c70024c5@gmail.com>
References: <20181105225431.24485-1-f.fainelli@gmail.com>
 <20181105225431.24485-7-f.fainelli@gmail.com>
 <C2D7FE5348E1B147BCA15975FBA23075013A5929ED@us01wembx1.internal.synopsys.com>
 <05f56763-1530-933d-2ce3-3653ad4c685f@gmail.com>
 <C2D7FE5348E1B147BCA15975FBA23075013A592A0B@us01wembx1.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075013A592A0B@us01wembx1.internal.synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vineet Gupta <vineet.gupta1@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <rmk+kernel@armlinux.org.uk>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrey Konovalov <andreyknvl@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stefan Agner <stefan@agner.ch>, Johannes Weiner <hannes@cmpxchg.org>, Greg Hackmann <ghackmann@android.com>, Kristina Martsenko <kristina.martsenko@arm.com>, CHANDAN VN <chandan.vn@samsung.com>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.i>
List-Id: devicetree@vger.kernel.org

On 11/12/18 4:40 PM, Vineet Gupta wrote:
> On 11/12/18 4:38 PM, Florian Fainelli wrote:
>>>>  #ifdef CONFIG_BLK_DEV_INITRD
>>>> -	if (initrd_start)
>>>> -		memblock_reserve(__pa(initrd_start), initrd_end - initrd_start);
>>>> +	if (phys_initrd_size) {
>>>> +		memblock_reserve(phys_initrd_start, phys_initrd_size);
>>>> +		initrd_start = (unsigned long)__va(phys_initrd_start);
>>>> +		initrd_end = initrd_start + phys_initrd_size;
>>>> +	}
>>>>  #endif
>>> The common code now uses phys_initrd*, and you also use the same in ARC code, do
>>> we still need the initrd_* setting here ?
>>> ARC semantics was using them as PA anyways.
>> Yes, the generic initrd code expects initrd_start/end to be virtual
>> addresses, which we now directly derive from phys_initrd_start, that
>> should really be equivalent.
> 
> So we can skip this explicit setting above - ARC arch code doesn't access the virt
> initrd_start

OK, you are saying we could just have the generic initrd code do this
assignment instead of having each architecture do it, is that a correct
understanding? If so, I suppose it could be done, whether as of this
patch series or as a follow-up, either way is fine with me.

One possible caveat is if __va() and __phys_to_virt() behave differently
(e.g: because of CONFIG_DEBUG_VIRTUAL or other things).
-- 
Florian
