From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] coccinelle: Check for missing NULL terminators in
 of_device_id tables
Date: Sun, 25 May 2014 09:13:17 -0500
Message-ID: <CAL_JsqJyCzNV0xK_uPp4o4F1Jhi8QmTY3KaHfeLcssnTea5H+Q@mail.gmail.com>
References: <1400888504-31309-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1400888504-31309-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michal Marek <mmarek@suse.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mitchel Humpherys <mitchelh@codeaurora.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 23, 2014 at 6:41 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> Failure to terminate an of_device_id table can lead to confusing
> failures depending on where the compiler places the array. Add a
> check to make sure these tables are terminated. Thanks to Mitchel
> Humpherys for coming up with the initial pattern.

I've definitely debugged one of those problems. Do you have any actual
fixes or there are no errors in the kernel?

Rob

>
> Cc: Mitchel Humpherys <mitchelh@codeaurora.org>
> Cc: Julia Lawall <Julia.Lawall@lip6.fr>
> Cc: Gilles Muller <Gilles.Muller@lip6.fr>
> Cc: Nicolas Palix <nicolas.palix@imag.fr>
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  scripts/coccinelle/misc/of_table.cocci | 81 ++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 scripts/coccinelle/misc/of_table.cocci
>
> diff --git a/scripts/coccinelle/misc/of_table.cocci b/scripts/coccinelle/misc/of_table.cocci
> new file mode 100644
> index 000000000000..da8bfa69fa3e
> --- /dev/null
> +++ b/scripts/coccinelle/misc/of_table.cocci
> @@ -0,0 +1,81 @@
> +/// Make sure of_device_id tables are NULL terminated
> +//
> +// Keywords: of_table
> +// Confidence: Medium
> +// Options: --include-headers
> +
> +virtual patch
> +virtual context
> +virtual org
> +virtual report
> +
> +@bad_of_table exists@
> +identifier var, arr;
> +expression E;
> +@@
> +... struct of_device_id arr[] = {
> +       ...,
> +       {
> +       ...,
> +       .var = E,
> +       ...
> +       }
> +};
> +
> +@depends on bad_of_table && context@
> +identifier var, arr;
> +expression E;
> +@@
> + ... struct of_device_id arr[] = {
> +       ...,
> +       {
> +       ...,
> +*      .var = E,
> +       ...
> +       }
> +};
> +
> +@depends on bad_of_table && patch@
> +identifier var, arr;
> +expression E;
> +@@
> +... struct of_device_id arr[] = {
> +       ...,
> +       {
> +       ...,
> +       .var = E,
> +       ...
> +-      }
> ++      },
> ++      { }
> +};
> +
> +@r depends on bad_of_table exists@
> +position p1;
> +identifier var, arr;
> +expression E;
> +@@
> +... struct of_device_id arr[] = {
> +       ...,
> +       {
> +       ...,
> +       .var = E,
> +       ...
> +       }
> +       @p1
> +};
> +
> +@script:python depends on org@
> +p1 << r.p1;
> +arr << r.arr;
> +@@
> +
> +cocci.print_main(arr,p1)
> +
> +@script:python depends on report@
> +p1 << r.p1;
> +arr << r.arr;
> +@@
> +
> +msg = "%s is not NULL terminated at line %s" % (arr, p1[0].line)
> +coccilib.report.print_report(p1[0],msg)
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
>
