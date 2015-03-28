From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [Patch 1/5] dt: unittest: early return from test skips tests
Date: Fri, 27 Mar 2015 20:58:42 -0700
Message-ID: <20150328035842.C5B62C40BA8@trevor.secretlab.ca>
References: <5503C65F.4030000@gmail.com> <5503DBE4.8030006@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5503DBE4.8030006@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com, Rob Herring <robh+dt@kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 13 Mar 2015 23:57:40 -0700
, Frank Rowand <frowand.list@gmail.com>
 wrote:
> From: Frank Rowand <frank.rowand@sonymobile.com>
> 
> Fix bugs pointed out by checkpatch.
> 
> Mis-coding of two if statements caused early return from function.
> 
> Number of tests completed increased from 102 to 107.
> Number of tests failed increased from 0 to 2.

I was going to send this to Linus right away, but on second thought, it
isn't actually a regression fix. I'm going to queue it up for v4.1 with
the rest of the series instead.

I've also got a bug fix for the new warnings that I'll put in at the
same time.

g.

> 
> Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>
> ---
>  drivers/of/unittest.c |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> Index: b/drivers/of/unittest.c
> ===================================================================
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -762,12 +762,14 @@ static void __init of_selftest_platform_
>  	irq = platform_get_irq(pdev, 0);
>  	selftest(irq < 0 && irq != -EPROBE_DEFER, "device parsing error failed - %d\n", irq);
>  
> -	if (selftest(np = of_find_node_by_path("/testcase-data/platform-tests"),
> -		     "No testcase data in device tree\n"));
> +	np = of_find_node_by_path("/testcase-data/platform-tests");
> +	selftest(np, "No testcase data in device tree\n");
> +	if (!np)
>  		return;
>  
> -	if (selftest(!(rc = device_register(&test_bus)),
> -		     "testbus registration failed; rc=%i\n", rc));
> +	rc = device_register(&test_bus);
> +	selftest(!rc, "testbus registration failed; rc=%i\n", rc);
> +	if (rc)
>  		return;
>  
>  	for_each_child_of_node(np, child) {
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
