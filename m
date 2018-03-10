From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] of: unittest: remove unneeded local return value
 variables
Date: Fri, 9 Mar 2018 18:02:13 -0600
Message-ID: <20180310000213.tonovc6n7jtknycj@rob-hp-laptop>
References: <1520548745-25021-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1520548745-25021-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 08, 2018 at 02:39:04PM -0800, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> A common pattern in many unittest functions is to save the return
> value of a function in a local variable, then test the value of
> the local variable, without using that return value for any further
> purpose.  Remove the local return value variable for these cases.
> 
> A second common pattern is:
> 
>    ret = some_test_function(many, parameters, ...);
>    if (unittest(ret == 0, "error message format", ...))
>       return;
> 
> This pattern is more clear when the local variable 'ret' is used, due
> to the long lines caused by the parameters to the test function and
> the long format and data parameters of unittest().  The local
> variable is retained in these cases.
> 
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
>  drivers/of/unittest.c | 89 ++++++++++++++-------------------------------------
>  1 file changed, 24 insertions(+), 65 deletions(-)

Doesn't apply. What's it based on?

Rob
