From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4] MAINTAINERS: Add file patterns for x86 device tree
 bindings
Date: Fri, 22 Jun 2018 17:57:07 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1806221753560.2402@nanos.tec.linutronix.de>
References: <20180622100820.29616-1-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180622100820.29616-1-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 22 Jun 2018, Geert Uytterhoeven wrote:

> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v3:
>   - Update for next-20180622,
> 
> v2:
>   - No changes.
> 
> Impact on "scripts/get_maintainer.pl -f Documentation/devicetree/bindings/x86/":
> 
> -Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:1/1=100%)
> +Thomas Gleixner <tglx@linutronix.de> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))

I assume there is no way to make sure that Rob and the device tree folks
are on top of that list? While it's somehow x86 related most of the
devicetree details are way over my head. :)

I'll pick it up nevertheless

Thanks,

	tglx
