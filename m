From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v2 3/5] venus: add check to make scm calls
Date: Mon, 4 Jun 2018 21:58:08 +0900
Message-ID: <CAAFQd5BSgB0OoqUFckJLXto9FNMYCTQ8ubDftaC-LvFm+A-gxA@mail.gmail.com>
References: <1527884768-22392-1-git-send-email-vgarodia@codeaurora.org> <1527884768-22392-4-git-send-email-vgarodia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527884768-22392-4-git-send-email-vgarodia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vgarodia@codeaurora.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, andy.gross@linaro.org, bjorn.andersson@linaro.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Vikash,

On Sat, Jun 2, 2018 at 5:27 AM Vikash Garodia <vgarodia@codeaurora.org> wrote:
[snip]
> +int venus_boot(struct venus_core *core)
> +{
> +       phys_addr_t mem_phys;
> +       size_t mem_size;
> +       int ret;
> +       struct device *dev;
> +
> +       if (!IS_ENABLED(CONFIG_QCOM_MDT_LOADER))
> +               return -EPROBE_DEFER;

Why are we deferring probe here? The option will not magically become
enabled after probe is retried.

Best regards,
Tomasz
