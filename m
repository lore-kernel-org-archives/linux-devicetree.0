From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] drivers: dma-coherent: Add support for default DMA
 coherent pool
Date: Sun, 9 Jul 2017 19:36:08 -0500
Message-ID: <20170710003608.b4fw35r4bastahr7@rob-hp-laptop>
References: <1499093475-29859-1-git-send-email-vitaly_kuzmichev@mentor.com>
 <1499093475-29859-2-git-send-email-vitaly_kuzmichev@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1499093475-29859-2-git-send-email-vitaly_kuzmichev@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vitaly_kuzmichev@mentor.com
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, george_davis@mentor.com
List-Id: devicetree@vger.kernel.org

On Mon, Jul 03, 2017 at 05:51:14PM +0300, vitaly_kuzmichev@mentor.com wrote:
> From: "George G. Davis" <george_davis@mentor.com>
> 
> Use concept similar to the default CMA region for DMA coherent pools.

Why do we need this in DT? CMA is a carveout and has to be reserved 
early, but DMA coherent memory is just different MMU attributes, right?

Also, does this still apply with DMA mapping changes in 4.13?

> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> Signed-off-by: Mark Craske <Mark_Craske@mentor.com>
> Signed-off-by: Vitaly Kuzmichev <Vitaly_Kuzmichev@mentor.com>
> ---
>  .../bindings/reserved-memory/reserved-memory.txt   |  2 ++
>  drivers/base/dma-coherent.c                        | 29 ++++++++++++++++------
>  2 files changed, 24 insertions(+), 7 deletions(-)
