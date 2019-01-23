From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 07/10] remoteproc: q6v5-mss: Vote for rpmh power domains
Date: Tue, 22 Jan 2019 16:01:18 -0800
Message-ID: <CAD=FV=UW76Jbq70M12+t2DrA04GT8=tD1MfJiRj0KimyZaWTGw@mail.gmail.com>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org> <20190122055112.30943-8-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122055112.30943-8-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Jan 21, 2019 at 9:52 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> @@ -1333,7 +1431,7 @@ static int q6v5_probe(struct platform_device *pdev)
>         ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM,
>                              qcom_msa_handover);
>         if (ret)
> -               goto free_rproc;
> +               goto detach_proxy_pds;
>
>         qproc->mpss_perm = BIT(QCOM_SCM_VMID_HLOS);
>         qproc->mba_perm = BIT(QCOM_SCM_VMID_HLOS);
> @@ -1344,10 +1442,12 @@ static int q6v5_probe(struct platform_device *pdev)
>
>         ret = rproc_add(rproc);
>         if (ret)
> -               goto free_rproc;
> +               goto detach_proxy_pds;

I can't comment on the patch overall since I haven't spent any time in
remoteproc, but as previously pointed out by Sibi, now that you've
landed commit 027045a6e2b7 ("remoteproc: qcom: Add shutdown-ack irq"),
you need to adjust the "goto"s in your patch.  Specifically
(whitespace damaged) atop your whole series:

@@ -1488,7 +1488,7 @@ static int q6v5_probe(struct platform_device *pdev)
        qproc->sysmon = qcom_add_sysmon_subdev(rproc, "modem", 0x12);
        if (IS_ERR(qproc->sysmon)) {
                ret = PTR_ERR(qproc->sysmon);
-               goto free_rproc;
+               goto detach_proxy_pds;
        }

-Doug
