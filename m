Return-Path: <robherring2@gmail.com>
Date: Wed, 7 Mar 2018 20:13:28 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: unittest: fix an error test in
 of_unittest_overlay_8()
Message-ID: <20180308021328.asjkacqmqtjwlwoa@rob-hp-laptop>
References: <20180307061808.GA15765@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180307061808.GA15765@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 07, 2018 at 09:18:08AM +0300, Dan Carpenter wrote:
> We changed this from of_overlay_apply() to overlay_data_apply().  The 
> overlay_data_apply() function returns 1 on success and 0 on error so
> the check for less than zero needs to be updated.
> 
> Fixes: 39a751a4cb7e ("of: change overlay apply input data from unflattened to FDT")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

Rob
