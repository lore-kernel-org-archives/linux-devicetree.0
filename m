From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 0/3] of: root #{size,address}-cells clean-ups
Date: Tue, 4 Sep 2018 18:56:18 -0700
Message-ID: <0941c9f1-abd2-0d4f-489c-108c3eff4298@gmail.com>
References: <20180830190523.31474-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830190523.31474-1-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On 08/30/18 12:05, Rob Herring wrote:
> This is a small restructuring and clean-up of handling root node
> #size-cells and #address-cells (or lack of). As only Sparc needs a 
> different default value and only for #address-cells, we can handle that 
> locally and remove one more dependency on asm/prom.h.
> 
> Rob
> 
> Rob Herring (3):
>   of/fdt: Scan the root node properties earlier
>   of/fdt: avoid re-parsing '#{address,size}-cells' in
>     of_fdt_limit_memory
>   of: make default address and size cells sizes private
> 
>  arch/sparc/include/asm/prom.h |  3 ---
>  drivers/of/fdt.c              | 30 +++++-------------------------
>  drivers/of/of_private.h       |  8 ++++++++
>  include/linux/of.h            |  6 ------
>  4 files changed, 13 insertions(+), 34 deletions(-)
> 

Nice cleanup!

-Frank
