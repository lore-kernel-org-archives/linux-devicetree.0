From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of/fdt: don't ignore errors from of_setup_earlycon
Date: Mon, 30 Sep 2019 09:19:04 -0500
Message-ID: <20190930141904.GA19392@bogus>
References: <20190910055833.28324-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190910055833.28324-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: robh+dt@kernel.org, frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 10 Sep 2019 07:58:33 +0200, Christoph Hellwig wrote:
> If of_setup_earlycon we should keep on iterating earlycon options
> instead of breaking out of the loop.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/of/fdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks.

Rob
