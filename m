From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of/unittest: Remove obsolete code
Date: Tue, 3 Feb 2015 21:24:58 -0600
Message-ID: <CAL_Jsq+0XqNLzminK-+360F-ccoY_UZ94r5LWfNwmRQacAD-vw@mail.gmail.com>
References: <1421946610-6609-1-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421946610-6609-1-git-send-email-grant.likely@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Gaurav Minocha <gaurav.minocha.os@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 22, 2015 at 11:10 AM, Grant Likely <grant.likely@linaro.org> wrote:
> Commit 3ce04b4a9, "Removes OF_UNITTEST dependency on OF_DYNAMIC config
> symbol" removes a bunch of code, but missed a few minor bits. Clean it
> up by removing the node removal cache and flag.
>
> Signed-off-by: Grant Likely <grant.likely@linaro.org>
> Cc: Gaurav Minocha <gaurav.minocha.os@gmail.com>
> Cc: Rob Herring <robh@kernel.org>

Doesn't look like you have updated your tree, so I've applied this.

Rob

> ---
>  drivers/of/unittest.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 139363af5c88..7aa1d6dae5ba 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -27,11 +27,6 @@ static struct selftest_results {
>         int failed;
>  } selftest_results;
>
> -#define NO_OF_NODES 3
> -static struct device_node *nodes[NO_OF_NODES];
> -static int last_node_index;
> -static bool selftest_live_tree;
> -
>  #define selftest(result, fmt, ...) ({ \
>         bool failed = !(result); \
>         if (failed) { \
> @@ -830,13 +825,6 @@ static int attach_node_and_children(struct device_node *np)
>                 return 0;
>         }
>
> -       /* Children of the root need to be remembered for removal */
> -       if (np->parent == of_root) {
> -               if (WARN_ON(last_node_index >= NO_OF_NODES))
> -                       return -EINVAL;
> -               nodes[last_node_index++] = np;
> -       }
> -
>         child = np->child;
>         np->child = NULL;
>
> @@ -899,10 +887,7 @@ static int __init selftest_data_add(void)
>         }
>
>         if (!of_root) {
> -               /* enabling flag for removing nodes */
> -               selftest_live_tree = true;
>                 of_root = selftest_data_node;
> -
>                 for_each_of_allnodes(np)
>                         __of_attach_node_sysfs(np);
>                 of_aliases = of_find_node_by_path("/aliases");
> --
> 2.1.0
>
