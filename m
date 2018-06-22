From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/5] venus: add check to make scm calls
Date: Fri, 22 Jun 2018 16:19:34 -0700
Message-ID: <20180622231934.GO3402@tuxbook-pro>
References: <1527884768-22392-1-git-send-email-vgarodia@codeaurora.org>
 <1527884768-22392-4-git-send-email-vgarodia@codeaurora.org>
 <CAAFQd5BSgB0OoqUFckJLXto9FNMYCTQ8ubDftaC-LvFm+A-gxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAFQd5BSgB0OoqUFckJLXto9FNMYCTQ8ubDftaC-LvFm+A-gxA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tfiga@chromium.org>
Cc: vgarodia@codeaurora.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, andy.gross@linaro.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>
List-Id: devicetree@vger.kernel.org

On Mon 04 Jun 05:58 PDT 2018, Tomasz Figa wrote:

> Hi Vikash,
> 
> On Sat, Jun 2, 2018 at 5:27 AM Vikash Garodia <vgarodia@codeaurora.org> wrote:
> [snip]
> > +int venus_boot(struct venus_core *core)
> > +{
> > +       phys_addr_t mem_phys;
> > +       size_t mem_size;
> > +       int ret;
> > +       struct device *dev;
> > +
> > +       if (!IS_ENABLED(CONFIG_QCOM_MDT_LOADER))
> > +               return -EPROBE_DEFER;
> 
> Why are we deferring probe here? The option will not magically become
> enabled after probe is retried.
> 

The original code should have read:

	if (IS_ENABLED(CONFIG_QCOM_MDT_LOADER) && !qcom_scm_is_available())
		return -EPROBE_DEFER;

The code does depend on CONFIG_QCOM_MDT_LOADER regardless of it using
scm for firmware verification.

Regards,
Bjorn
