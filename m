From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of/fdt: pass early_init_dt_reserve_memory_arch() with
 bool type nomap
Date: Mon, 8 Jul 2019 15:28:23 -0600
Message-ID: <20190708212823.GA28550@bogus>
References: <20190530103927.20952-1-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190530103927.20952-1-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 30 May 2019 19:39:27 +0900, Masahiro Yamada wrote:
> The third argument 'nomap' of early_init_dt_reserve_memory_arch() is
> bool. It is preferred to pass it with a bool type parameter.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/of/fdt.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Applied, thanks.

Rob
