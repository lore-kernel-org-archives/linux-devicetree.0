From: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/4] regulator: act8865: set correct number of
 regulators in pdata
Date: Sat, 5 Jul 2014 23:08:05 +0800
Message-ID: <CAFRkauDmTeh0Uk9T5xtWuZ4C9LH9QZN0MdFf3Ay0_8_prkrW9g@mail.gmail.com>
References: <1404566456-9121-1-git-send-email-b.galvani@gmail.com>
	<1404566456-9121-2-git-send-email-b.galvani@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404566456-9121-2-git-send-email-b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-07-05 21:20 GMT+08:00 Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> act8865_pdata_from_dt() populates the array pdata->regulators with all
> the regulators and then assigns the field init_data only for the ones
> actually found in the DT.
>
> The patch changes the value assigned to pdata->num_regulators to match
> the size of the array.
>
> Signed-off-by: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/regulator/act8865-regulator.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/act8865-regulator.c b/drivers/regulator/act8865-regulator.c
> index f07be36..52d1b6c 100644
> --- a/drivers/regulator/act8865-regulator.c
> +++ b/drivers/regulator/act8865-regulator.c
> @@ -230,7 +230,7 @@ static int act8865_pdata_from_dt(struct device *dev,
>         if (!pdata->regulators)
>                 return -ENOMEM;
>
> -       pdata->num_regulators = matched;
> +       pdata->num_regulators = ARRAY_SIZE(act8865_matches);
>         regulator = pdata->regulators;

You can also include below change as well:
diff --git a/drivers/regulator/act8865-regulator.c
b/drivers/regulator/act8865-regulator.c
index f07be36..9fcedc5 100644
--- a/drivers/regulator/act8865-regulator.c
+++ b/drivers/regulator/act8865-regulator.c
@@ -226,7 +226,7 @@ static int act8865_pdata_from_dt(struct device *dev,

  pdata->regulators = devm_kzalloc(dev,
  sizeof(struct act8865_regulator_data) *
- ARRAY_SIZE(act8865_matches), GFP_KERNEL);
+ matched, GFP_KERNEL);
  if (!pdata->regulators)
  return -ENOMEM;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
