From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drivers: of: increase MAX_RESERVED_REGIONS to 32
Date: Thu, 12 Oct 2017 12:25:19 -0500
Message-ID: <CAL_JsqJCoc7AdRNZnR0wp6SB8f_w49ORpCe0g-rWPUwLHMYJZg@mail.gmail.com>
References: <CAL_JsqL29j59wJtmOAuD=N7Tccv2rxEMav90yxTyGTfhwHQUsw@mail.gmail.com>
 <20170926084000.29105-1-stewart@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170926084000.29105-1-stewart@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: obh+dt@kernel.org, Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 26, 2017 at 3:40 AM, Stewart Smith
<stewart@linux.vnet.ibm.com> wrote:
> There are two types of memory reservations firmware can ask the kernel
> to make in the device tree: static and dynamic.
> See Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>
> If you have greater than 16 entries in /reserved-memory (as we do on
> POWER9 systems) you would get this scary looking error message:
>  [    0.000000] OF: reserved mem: not enough space all defined regions.
>
> This is harmless if all your reservations are static (which with OPAL on
> POWER9, they are).
>
> It is not harmless if you have any dynamic reservations after the 16th.
>
> In the first pass over the fdt to find reservations, the child nodes of
> /reserved-memory are added to a static array in of_reserved_mem.c so that
> memory can be reserved in a 2nd pass. The array has 16 entries. This is why,
> on my dual socket POWER9 system, I get that error 4 times with 20 static
> reservations.
>
> We don't have a problem on ppc though, as in arch/powerpc/kernel/prom.c
> we look at the new style /reserved-ranges property to do reservations,
> and this logic was introduced in 0962e8004e974 (well before any powernv
> system shipped).
>
> A Google search shows up no occurances of that exact error message, so we're
> probably safe in that no machine that people use has memory not being reserved
> when it should be.
>
> The simple fix is to bump the length of the array to 32 which "should be
> enough for everyone(TM)". The simple fix of not recording static allocations
> in the array would cause problems for devices with "memory-region" properties.
> A more future-proof fix is likely possible, although more invasive and this
> simple fix is perfectly suitable in the meantime while a more future-proof
> fix is developed.
>
> Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
> ---
>  drivers/of/of_reserved_mem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Rob
