From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH 7/7] xtensa: remove arch specific early DT functions
Date: Mon, 15 Jan 2018 01:13:26 -0800
Message-ID: <CAMo8BfKm351tBtsYeY2M==AufLe+nds5zfkTR+zrUgGUpj2XBQ@mail.gmail.com>
References: <20180105232054.27394-1-robh@kernel.org> <20180105232054.27394-8-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180105232054.27394-8-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chris Zankel <chris@zankel.net>, linux-xtensa@linux-xtensa.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Fri, Jan 5, 2018 at 3:20 PM, Rob Herring <robh@kernel.org> wrote:
> Now that the DT core code handles bootmem arches, we can remove the xtensa
> specific early_init_dt_alloc_memory_arch function. The common
> early_init_dt_add_memory_arch can be used too now that xtensa switched to
> memblock.
>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> This is dependent on patch 1. Please ack and I'll take or apply after
> 4.16-rc1.
>
>  arch/xtensa/kernel/setup.c | 12 ------------
>  1 file changed, 12 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
