From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 3/3] pinctrl: qcom: Don't allow protected pins to be requested
Date: Wed, 21 Mar 2018 13:17:49 -0700
Message-ID: <152166346979.154352.7302935269984897659@swboyd.mtv.corp.google.com>
References: <20180321165848.89751-1-swboyd@chromium.org>
 <20180321165848.89751-4-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180321165848.89751-4-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Timur Tabi <timur@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Stephen Boyd (2018-03-21 09:58:48)
> +       ret =3D device_property_read_u16_array(pctrl->dev, "gpios", NULL,=
 0);
> +       if (ret > 0 && ret < max_gpios) {
> +               u16 *tmp;
> +
> +               len =3D ret;
> +               tmp =3D kmalloc_array(len, sizeof(tmp[0]), GFP_KERNEL);
> +               if (!tmp)
> +                       return -ENOMEM;
> +
> +               ret =3D device_property_read_u16_array(pctrl->dev, "gpios=
", tmp,
> +                                                    len);
> +               if (ret < 0) {
> +                       dev_err(pctrl->dev, "could not read list of GPIOs=
\n");
> +                       kfree(tmp);
> +                       return ret;
> +               }
> +
> +               bitmap_zero(chip->valid_mask, max_gpios);
> +               for (i =3D 0; i < len; i++)
> +                       set_bit(tmp[i], chip->valid_mask);

This leaks tmp too.. I'll fix that in v4 and resend tomorrow if there
aren't more comments.
