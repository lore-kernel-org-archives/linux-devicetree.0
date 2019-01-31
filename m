From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCHv6 6/6] coresight: debug: Add Unique Component Identifier (UCI) table
Date: Thu, 31 Jan 2019 08:31:40 -0800
Message-ID: <154895230081.169292.7994428901781990604@swboyd.mtv.corp.google.com>
References: <cover.1548943727.git.saiprakash.ranjan@codeaurora.org> <f724b28e5bfd7bca062aa5380cfd9328289559bf.1548943727.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f724b28e5bfd7bca062aa5380cfd9328289559bf.1548943727.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Doug Anderson <dianders@chromium.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Leo Yan <leo.yan@linaro.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Mark Rutland <mark.rutland@arm.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Tingwei Zhang <tingwei@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-01-31 06:22:24)
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/=
hwtracing/coresight/coresight-cpu-debug.c
> index e8819d750938..915d86a39cee 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -655,24 +655,23 @@ static int debug_remove(struct amba_device *adev)
>         return 0;
>  }
> =20
> +static struct amba_cs_uci_id uci_id_debug[] =3D {

Can this be const?

> +       {
> +               /*  CPU Debug UCI data */
> +               .devarch        =3D 0x47706a15,
> +               .devarch_mask   =3D 0xfff0ffff,
> +               .devtype        =3D 0x00000015,
> +       }
> +};
