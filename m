From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 3/3] OPP: Add helper function for bandwidth OPP tables
Date: Fri, 16 Aug 2019 11:22:58 -0700
Message-ID: <20190816182259.538532077C@mail.kernel.org>
References: <20190807223111.230846-1-saravanak@google.com> <20190807223111.230846-4-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807223111.230846-4-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Georgi Djakov <georgi.djakov@linaro.org>, vincent.guittot@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, adharmap@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, sibis@codeaurora.org, bjorn.andersson@linaro.org, evgreen@chromium.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Saravana Kannan (2019-08-07 15:31:11)
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 3b7ffd0234e9..22dcf22f908f 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -127,6 +127,29 @@ unsigned long dev_pm_opp_get_freq(struct dev_pm_opp =
*opp)
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_opp_get_freq);
> =20
> +/**
> + * dev_pm_opp_get_bw() - Gets the bandwidth corresponding to an availabl=
e opp
> + * @opp:       opp for which frequency has to be returned for

s/frequency/bandwidth/ ?

> + * @avg_bw:    Pointer where the corresponding average bandwidth is stor=
ed.
> + *             Can be NULL.
> + *
> + * Return: Peak bandwidth in kBps corresponding to the opp, else
> + * return 0
> + */
> +unsigned long dev_pm_opp_get_bw(struct dev_pm_opp *opp, unsigned long *a=
vg_bw)
> +{
> +       if (IS_ERR_OR_NULL(opp) || !opp->available) {
> +               pr_err("%s: Invalid parameters\n", __func__);
> +               return 0;
> +       }
> +
> +       if (avg_bw)
> +               *avg_bw =3D opp->avg_bw;
> +
> +       return opp->rate;

It deserves a comment if it stays named 'rate'. At a glance it looks
like a bug.

> +}
> +EXPORT_SYMBOL_GPL(dev_pm_opp_get_bw);
> +
>  /**
>   * dev_pm_opp_get_level() - Gets the level corresponding to an available=
 opp
>   * @opp:       opp for which level value has to be returned for
> @@ -299,6 +322,34 @@ unsigned long dev_pm_opp_get_suspend_opp_freq(struct=
 device *dev)
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_opp_get_suspend_opp_freq);
> =20
> +/**
> + * dev_pm_opp_get_suspend_opp_bw() - Get peak bandwidth of suspend opp i=
n kBps
> + * @dev:       device for which we do this operation
> + * @avg_bw:    Pointer where the corresponding average bandwidth is stor=
ed.
> + *             Can be NULL.
> + *
> + * Return: This function returns the peak bandwidth of the OPP marked as
> + * suspend_opp if one is available, else returns 0;

Why a semicolon instead a full stop?
