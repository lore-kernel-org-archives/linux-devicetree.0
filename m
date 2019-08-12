Return-Path: <robherring2@gmail.com>
Date: Mon, 12 Aug 2019 16:52:28 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: resolver: Add of_node_put() before return and break
Message-ID: <20190812225228.GA21794@bogus>
References: <20190716054331.2775-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716054331.2775-1-nishkadg.linux@gmail.com>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc: pantelis.antoniou@konsulko.com, frowand.list@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, 16 Jul 2019 11:13:30 +0530, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return or break from the middle of the loop, there is no
> put, thus causing a memory leak. Hence add an of_node_put before the
> return or break in three places.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/of/resolver.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 

Applied, thanks.

Rob
