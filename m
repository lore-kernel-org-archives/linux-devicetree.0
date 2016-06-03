From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: irq: fix of_irq_get[_byname]() kernel-doc
Date: Fri, 3 Jun 2016 07:08:10 -0500
Message-ID: <20160603120810.GA8472@rob-hp-laptop>
References: <4469041.XrtPizO4V9@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4469041.XrtPizO4V9@wasted.cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: grant.likely@linaro.org, devicetree@vger.kernel.org, frowand.list@gmail.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, May 28, 2016 at 11:02:50PM +0300, Sergei Shtylyov wrote:
> The kernel-doc for the of_irq_get[_byname]()  is clearly inadequate in
> describing the return values -- of_irq_get_byname() is documented better
> than of_irq_get() but it  still doesn't mention that 0 is returned iff
> irq_create_of_mapping() fails (it doesn't return an error code in this
> case). Document all possible return value variants, making the writing
> of the word "IRQ" consistent, while at it...
> 
> Fixes: 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
> Fixes: ad69674e73a1 ("of/irq: do irq resolution in platform_get_irq_byname()")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> CC: stable@vger.kernel.org
> 
> ---
> The patch is against Linus' 'linux.git' repo (Grant Likely's repo is outdated).
> 
>  drivers/of/irq.c |   19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

Applied, thanks.

Rob
