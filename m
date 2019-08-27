Return-Path: <robherring2@gmail.com>
Date: Tue, 27 Aug 2019 11:21:58 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: unittest: Add of_node_put() before return
Message-ID: <20190827162158.GA14084@bogus>
References: <20190815062218.5428-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815062218.5428-1-nishkadg.linux@gmail.com>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc: robh+dt@kernel.org, frowand.list@gmail.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, 15 Aug 2019 11:52:18 +0530, Nishka Dasgupta wrote:
> The local variable np in function of_unittest_platform_populate takes
> the return value of of_find_node_by_path, which gets a node but does not
> put it. If np is not put before return it may cause a memory leak. Hence
> put np before a return statement.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/of/unittest.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Applied, thanks.

Rob
