From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of/unittest: Fix the wrong expected value in of_selftest_property_string
Date: Fri, 13 Mar 2015 10:28:00 -0500
Message-ID: <CAL_JsqK3wiWpD09ZVvonOv21UMqX8NEJXihSHNXX_9q9RJxtWw@mail.gmail.com>
References: <1425354638-55819-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425354638-55819-1-git-send-email-long.wanglong@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wang Long <long.wanglong@huawei.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, peifeiyue@huawei.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 2, 2015 at 9:50 PM, Wang Long <long.wanglong@huawei.com> wrote:
> This patch fix the wrong expected value of of_property_match_string
> in of_selftest_property_string.
>
> Signed-off-by: Wang Long <long.wanglong@huawei.com>

Applied for 4.0. Thanks.

Rob

> ---
>  drivers/of/unittest.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 199fb23..00ddce7 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -378,9 +378,9 @@ static void __init of_selftest_property_string(void)
>         rc = of_property_match_string(np, "phandle-list-names", "first");
>         selftest(rc == 0, "first expected:0 got:%i\n", rc);
>         rc = of_property_match_string(np, "phandle-list-names", "second");
> -       selftest(rc == 1, "second expected:0 got:%i\n", rc);
> +       selftest(rc == 1, "second expected:1 got:%i\n", rc);
>         rc = of_property_match_string(np, "phandle-list-names", "third");
> -       selftest(rc == 2, "third expected:0 got:%i\n", rc);
> +       selftest(rc == 2, "third expected:2 got:%i\n", rc);
>         rc = of_property_match_string(np, "phandle-list-names", "fourth");
>         selftest(rc == -ENODATA, "unmatched string; rc=%i\n", rc);
>         rc = of_property_match_string(np, "missing-property", "blah");
> --
> 1.8.3.4
>
