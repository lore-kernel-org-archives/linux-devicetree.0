From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: fdt: add missing allocation-failure check
Date: Wed, 17 May 2017 11:37:54 -0500
Message-ID: <20170517163754.j3dmtu5skav47qm6@rob-hp-laptop>
References: <20170517152909.13553-1-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170517152909.13553-1-johan@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 17, 2017 at 05:29:09PM +0200, Johan Hovold wrote:
> The memory allocator passed to __unflatten_device_tree() (e.g. a wrapped
> kzalloc) can fail so add the missing sanity check to avoid dereferencing
> a NULL pointer.
> 
> Fixes: fe14042358fa ("of/flattree: Refactor unflatten_device_tree and add fdt_unflatten_tree")
> Cc: stable <stable@vger.kernel.org>     # 2.6.38
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/of/fdt.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Rob
