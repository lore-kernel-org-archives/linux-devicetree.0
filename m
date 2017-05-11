From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Partially Revert "of: fix sparse warnings in fdt, irq,
 reserved mem, and resolver code"
Date: Thu, 11 May 2017 17:44:34 +0200
Message-ID: <CAK8P3a3Y=x6o17cSGoFJN1K0qk1+ydpVOHAVSFxPguS4USB_8Q@mail.gmail.com>
References: <20170511153048.3586-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170511153048.3586-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 11, 2017 at 5:30 PM, Rob Herring <robh@kernel.org> wrote:
> A change to function pointers that was meant to address a sparse warning
> turned out to cause hundreds of new gcc-7 warnings:
>
> include/linux/of_irq.h:11:13: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
> drivers/of/of_reserved_mem.c: In function '__reserved_mem_init_node':
> drivers/of/of_reserved_mem.c:200:7: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
>    int const (*initfn)(struct reserved_mem *rmem) = i->data;
>
> Turns out the sparse warnings were spurious and have been fixed in
> upstream sparse since 0.5.0 in commit "sparse: treat function pointers
> as pointers to const data".
>
> This partially reverts commit 17a70355ea576843a7ac851f1db26872a50b2850.
>
> Fixes: 17a70355ea57 ("of: fix sparse warnings in fdt, irq, reserved mem, and resolver code")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Arnd,
>
> Doing this as a partial revert instead and added sparse version
> information to the commit msg.

Looks good, thanks!

      Arnd
