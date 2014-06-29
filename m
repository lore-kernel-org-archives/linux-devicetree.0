From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: Re: [PATCH] power: ab8500_fg.c: Cleaning up uninitialized variables
Date: Mon, 30 Jun 2014 01:47:00 +0200
Message-ID: <CAFo99garLm9G6GBFP1a1ko3FAacukcTXMW1d_K--8ennW73KJw@mail.gmail.com>
References: <1401653003-10670-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401653003-10670-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi

Can someone please check on this!

This will cause an error, and is one of the most obvious ones I've found.
So give it one minute please.

Kind regards
Rickard Strandqvist


2014-06-01 22:03 GMT+02:00 Rickard Strandqvist
<rickard_strandqvist@spectrumdigital.se>:
> In this case the wrong variable is used, which has never been initialized.
> This will lead to a serious error.
>
> This was largely found by using a static code analysis program called cppcheck.
>
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
> ---
>  drivers/power/ab8500_fg.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/power/ab8500_fg.c b/drivers/power/ab8500_fg.c
> index 3cb4178..019e33f 100644
> --- a/drivers/power/ab8500_fg.c
> +++ b/drivers/power/ab8500_fg.c
> @@ -2969,7 +2969,7 @@ static struct device_attribute ab8505_fg_sysfs_psy_attrs[] = {
>
>  static int ab8500_fg_sysfs_psy_create_attrs(struct device *dev)
>  {
> -       unsigned int i, j;
> +       unsigned int j;
>         struct power_supply *psy = dev_get_drvdata(dev);
>         struct ab8500_fg *di;
>
> @@ -2986,7 +2986,7 @@ static int ab8500_fg_sysfs_psy_create_attrs(struct device *dev)
>  sysfs_psy_create_attrs_failed_ab8505:
>         dev_err(dev, "Failed creating sysfs psy attrs for ab8505.\n");
>         while (j--)
> -               device_remove_file(dev, &ab8505_fg_sysfs_psy_attrs[i]);
> +               device_remove_file(dev, &ab8505_fg_sysfs_psy_attrs[j]);
>
>         return -EIO;
>  }
> --
> 1.7.10.4
>
