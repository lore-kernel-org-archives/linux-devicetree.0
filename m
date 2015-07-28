From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Drop owner assignment from platform and i2c driver
Date: Tue, 28 Jul 2015 10:55:40 -0500
Message-ID: <CAL_JsqKusMR8zgOnmG_g5F7QftiUzPgxQfTqh0G+6LYNF7kUjA@mail.gmail.com>
References: <1436509572-25266-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436509572-25266-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 10, 2015 at 1:26 AM, Krzysztof Kozlowski
<k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> platform_driver and i2c_driver do not need to set an owner because core
> will set it.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Applied. Thanks.

Rob

>
> ---
>
> The coccinelle script which generated the patch was sent here:
> http://www.spinics.net/lists/kernel/msg2029903.html
> ---
>  drivers/of/unittest.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 18016341d5a9..9f71770b6226 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -979,7 +979,6 @@ static struct platform_driver unittest_driver = {
>         .remove                 = unittest_remove,
>         .driver = {
>                 .name           = "unittest",
> -               .owner          = THIS_MODULE,
>                 .of_match_table = of_match_ptr(unittest_match),
>         },
>  };
> @@ -1666,7 +1665,6 @@ static const struct i2c_device_id unittest_i2c_dev_id[] = {
>  static struct i2c_driver unittest_i2c_dev_driver = {
>         .driver = {
>                 .name = "unittest-i2c-dev",
> -               .owner = THIS_MODULE,
>         },
>         .probe = unittest_i2c_dev_probe,
>         .remove = unittest_i2c_dev_remove,
> @@ -1761,7 +1759,6 @@ static const struct i2c_device_id unittest_i2c_mux_id[] = {
>  static struct i2c_driver unittest_i2c_mux_driver = {
>         .driver = {
>                 .name = "unittest-i2c-mux",
> -               .owner = THIS_MODULE,
>         },
>         .probe = unittest_i2c_mux_probe,
>         .remove = unittest_i2c_mux_remove,
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
