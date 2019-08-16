From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 2/3] OPP: Add support for bandwidth OPP tables
Date: Fri, 16 Aug 2019 11:21:30 -0700
Message-ID: <20190816182131.A692E206C1@mail.kernel.org>
References: <20190807223111.230846-1-saravanak@google.com> <20190807223111.230846-3-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807223111.230846-3-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Georgi Djakov <georgi.djakov@linaro.org>, vincent.guittot@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, adharmap@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, sibis@codeaurora.org, bjorn.andersson@linaro.org, evgreen@chromium.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Saravana Kannan (2019-08-07 15:31:10)
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index 1813f5ad5fa2..e1750033fef9 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -523,6 +523,35 @@ void dev_pm_opp_of_remove_table(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_opp_of_remove_table);
> =20
> +static int _read_opp_key(struct dev_pm_opp *new_opp, struct device_node =
*np)
> +{
> +       int ret;
> +       u64 rate;
> +       u32 bw;
> +
> +       ret =3D of_property_read_u64(np, "opp-hz", &rate);
> +       if (!ret) {
> +               /*
> +                * Rate is defined as an unsigned long in clk API, and so
> +                * casting explicitly to its type. Must be fixed once rat=
e is 64
> +                * bit guaranteed in clk API.
> +                */
> +               new_opp->rate =3D (unsigned long)rate;
> +               return 0;
> +       }
> +
> +       ret =3D of_property_read_u32(np, "opp-peak-kBps", &bw);
> +       if (ret)
> +               return ret;
> +       new_opp->rate =3D (unsigned long) bw;
> +
> +       ret =3D of_property_read_u32(np, "opp-avg-kBps", &bw);
> +       if (!ret)

I would write this as=20

	if (!of_property_read_u32(np, "opp-avg-kBps", &bw))
		new_opp->avg_bw =3D (unsigned long) bw;

because you don't care about the return value.

> +               new_opp->avg_bw =3D (unsigned long) bw;
> +
> +       return 0;
> +}
> +
>  /**
>   * _opp_add_static_v2() - Allocate static OPPs (As per 'v2' DT bindings)
>   * @opp_table: OPP table
> diff --git a/drivers/opp/opp.h b/drivers/opp/opp.h
> index 01a500e2c40a..6bb238af9cac 100644
> --- a/drivers/opp/opp.h
> +++ b/drivers/opp/opp.h
> @@ -56,7 +56,8 @@ extern struct list_head opp_tables;
>   * @turbo:     true if turbo (boost) OPP
>   * @suspend:   true if suspend OPP
>   * @pstate: Device's power domain's performance state.
> - * @rate:      Frequency in hertz
> + * @rate:      Frequency in hertz OR Peak bandwidth in kilobytes per sec=
ond

Why is Peak capitalized?

> + * @avg_bw:    Average bandwidth in kilobytes per second
>   * @level:     Performance level
>   * @supplies:  Power supplies voltage/current values
>   * @clock_latency_ns: Latency (in nanoseconds) of switching to this OPP's
> @@ -78,6 +79,7 @@ struct dev_pm_opp {
>         bool suspend;
>         unsigned int pstate;
>         unsigned long rate;

If you're trying to save space why not make an anonymous union here of
'rate' and 'bandwidth'? Then the code doesn't read all weird.

> +       unsigned long avg_bw;
>         unsigned int level;
> =20
>         struct dev_pm_opp_supply *supplies;
