From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: use correct function prototype for
 of_overlay_fdt_apply()
Date: Wed, 10 Apr 2019 08:59:25 -0500
Message-ID: <20190410135925.GA1627@bogus>
References: <20190322002342.24831-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190322002342.24831-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: frowand.list@gmail.com, Hamish Martin <hamish.martin@alliedtelesis.co.nz>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 22, 2019 at 01:23:41PM +1300, Chris Packham wrote:
> When CONFIG_OF_OVERLAY is not enabled the fallback stub for
> of_overlay_fdt_apply() does not match the prototype for the case when
> CONFIG_OF_OVERLAY is enabled. Update the stub to use the correct
> function prototype.
> 
> Fixes: commit 39a751a4cb7e ("of: change overlay apply input data from unflattened to FDT")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  include/linux/of.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied.

Rob
