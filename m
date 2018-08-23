From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v2 3/4] drivers: edac: Add EDAC driver support for QCOM SoCs
Date: Thu, 23 Aug 2018 16:07:30 -0700
Message-ID: <CAE=gft6GTuk+j81J+jTNqD_6VFQym=gb6aJ==cbcg-6odVq3qg@mail.gmail.com>
References: <1534550915-18230-1-git-send-email-vnkgutta@codeaurora.org>
 <1534550915-18230-4-git-send-email-vnkgutta@codeaurora.org> <CAE=gft4vheqe9Yqb3H_gMChUmQqvmBeeWvKWCf_j4sWrFceFiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAE=gft4vheqe9Yqb3H_gMChUmQqvmBeeWvKWCf_j4sWrFceFiQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vnkgutta@codeaurora.org
Cc: robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, bp@alien8.de
List-Id: devicetree@vger.kernel.org

On Thu, Aug 23, 2018 at 4:04 PM Evan Green <evgreen@chromium.org> wrote:
>
> On Fri, Aug 17, 2018 at 5:08 PM Venkata Narendra Kumar Gutta
> <vnkgutta@codeaurora.org> wrote:
> >
> > From: Channagoud Kadabi <ckadabi@codeaurora.org>

Also checkpatch.pl complains a bit about this patch:

            WARNING: Non-standard signature: Co-developed-by:
            #14:
            Co-developed-by: Venkata Narendra Kumar Gutta
<vnkgutta@codeaurora.org>

            WARNING: please write a paragraph that describes the
config symbol fully
            #63: FILE: drivers/edac/Kconfig:460:
            +config EDAC_QCOM

            WARNING: DT compatible string "qcom,llcc-edac" appears
un-documented -- check ./Documentation/devicetree/bindings/
            #536: FILE: drivers/edac/qcom_edac.c:430:
            + { .compatible = "qcom,llcc-edac" },

            total: 0 errors, 3 warnings, 533 lines checked

-Evan
