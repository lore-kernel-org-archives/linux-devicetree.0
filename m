From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: unittest: fix an error code in
 of_unittest_apply_overlay()
Date: Sun, 18 Mar 2018 07:52:01 -0500
Message-ID: <20180318125201.aezip6bgycmvgbqa@rob-hp-laptop>
References: <20180314200828.GA10588@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180314200828.GA10588@mwanda>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 14, 2018 at 11:08:28PM +0300, Dan Carpenter wrote:
> We accidentally return zero on failure instead of a negative error code.
> 
> Fixes: 39a751a4cb7e ("of: change overlay apply input data from unflattened to FDT")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.

Rob
