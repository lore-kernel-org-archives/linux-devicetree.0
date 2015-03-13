From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of/selftest: remove the duplicate of_changeset_init
Date: Fri, 13 Mar 2015 10:27:49 -0500
Message-ID: <CAL_JsqLFG9BOjgHxuF17g2T3nkNBW+mh2L1kgKHu6JE5scBL2w@mail.gmail.com>
References: <1425278961-29678-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425278961-29678-1-git-send-email-long.wanglong@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wang Long <long.wanglong@huawei.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, peifeiyue@huawei.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 2, 2015 at 12:49 AM, Wang Long <long.wanglong@huawei.com> wrote:
> Remove the duplicate of_changeset_init. In of_selftest_changeset
> testcase, the "struct of_changeset chgset" is initialized twice,
> but only once is enough. so, drop the first initializtion code.
>
> Signed-off-by: Wang Long <long.wanglong@huawei.com>

Applied for 4.0. Thanks.

Rob

> ---
>  drivers/of/unittest.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 0cf9a23..199fb23 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -478,7 +478,6 @@ static void __init of_selftest_changeset(void)
>         struct device_node *n1, *n2, *n21, *nremove, *parent, *np;
>         struct of_changeset chgset;
>
> -       of_changeset_init(&chgset);
>         n1 = __of_node_dup(NULL, "/testcase-data/changeset/n1");
>         selftest(n1, "testcase setup failure\n");
>         n2 = __of_node_dup(NULL, "/testcase-data/changeset/n2");
> --
> 1.8.3.4
>
