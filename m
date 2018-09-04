MIME-Version: 1.0
Date: Tue, 4 Sep 2018 10:01:46 -0500
References: <20180831173928.bbt6a5ttrtgzbabk@kili.mountain>
In-Reply-To: <20180831173928.bbt6a5ttrtgzbabk@kili.mountain>
Message-ID: <CAL_JsqJ2E_xe82Ez0wDCbgtsbP9sUw1=-qr9RCLL2zsQ_5t+LQ@mail.gmail.com>
Subject: Re: [bug report] of/unittest: remove use of node name pointer in
 overlay high level test
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 31, 2018 at 12:39 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Rob Herring,
>
> The patch 4785d169abd5: "of/unittest: remove use of node name pointer
> in overlay high level test" from Aug 27, 2018, leads to the following
> static checker warning:
>
>         drivers/of/unittest.c:2356 of_unittest_overlay_high_level()
>         info: ignoring unreachable code.
>
> drivers/of/unittest.c
>   2354          for_each_child_of_node(overlay_base_root, np) {
>   2355                  struct device_node *base_child;
>   2356                  for_each_child_of_node(of_root, base_child) {
>   2357                          if (!strcmp(np->full_name, base_child->full_name))
>   2358                                  unittest(0, "illegal node name in overlay_base %pOFn",
>   2359                                          np);
>   2360                          return;
>
> You wanted to only return on error probably?  Smatch is complaining
> that we don't iterate through the inside loop more than once.

Indeed. Fixed.

Thanks,
Rob
