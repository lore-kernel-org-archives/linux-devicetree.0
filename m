From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] power: reset: msm: Add support for download-mode control
Date: Fri, 20 Jul 2018 10:44:53 -0700
Message-ID: <153210869376.48062.15842782379577271631@swboyd.mtv.corp.google.com>
References: <1531977529-23304-1-git-send-email-rnayak@codeaurora.org>
 <20180719054200.GB30024@minitux>
 <ca74b7f4-3e60-2f3b-3d66-ac167c913c0e@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ca74b7f4-3e60-2f3b-3d66-ac167c913c0e@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>
Cc: sre@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2018-07-18 23:59:20)
> =

> =

> On 7/19/2018 11:12 AM, Bjorn Andersson wrote:
> > On Wed 18 Jul 22:18 PDT 2018, Rajendra Nayak wrote:
> > =

> >> commit '8c1b7dc9b: firmware: qcom: scm: Expose download-mode control'
> >> added support for download-mode control using the scm firmware
> >> driver for platforms which require a secure call to write the magic
> >> cookie into the tcsr location.
> >>
> >> For platforms which *do not* need an scm call and where the kernel can
> >> write the cookie by a direct read/write, add similar support in the
> >> msm-poweroff driver.
> >> Similar to the scm driver, the msm-poweroff driver clears the cookie
> >> during a clean reboot.
> >>
> >> Download mode using msm-poweroff driver can be enabled by including
> >> msm-poweroff.download_mode=3D1 on the command line.
> >>
> > =

> > Should have thought about this when I wrote the scm code...
> > =

> > I would prefer if we could find a way to consolidate the two
> > implementations behind the same Kconfig and command line parameters.
> =

> The only problem I saw with this was that *both* drivers would think
> its enabled and try their own ways to enable it, and one of it would
> always fail. We could fail silently, which would mean we will miss
> cases when its a genuine failure but that should be fine?

Should be fine if SCM fails silently. If TCSR is specified it better
work because that doesn't really rely on anything besides writing into a
memory location.

> =

> >> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> >> ---
> >>   .../bindings/power/reset/msm-poweroff.txt          |  3 ++
> >>   drivers/power/reset/Kconfig                        | 11 +++++++
> >>   drivers/power/reset/msm-poweroff.c                 | 38 ++++++++++++=
++++++++++
> >>   3 files changed, 52 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/power/reset/msm-powerof=
f.txt b/Documentation/devicetree/bindings/power/reset/msm-poweroff.txt
> >> index ce44ad3..9dd489f 100644
> >> --- a/Documentation/devicetree/bindings/power/reset/msm-poweroff.txt
> >> +++ b/Documentation/devicetree/bindings/power/reset/msm-poweroff.txt
> >> @@ -8,6 +8,9 @@ settings.
> >>   Required Properties:
> >>   -compatible: "qcom,pshold"
> >>   -reg: Specifies the physical address of the ps-hold register
> >> +Optional Properties:
> >> +-qcom,dload-mode: phandle to the TCSR hardware block and offset of the
> >> +             download mode control register
> >>   =

> >>   Example:
> >>   =

> >> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> >> index df58fc8..0c97e34 100644
> >> --- a/drivers/power/reset/Kconfig
> >> +++ b/drivers/power/reset/Kconfig
> >> @@ -104,6 +104,17 @@ config POWER_RESET_MSM
> >>      help
> >>        Power off and restart support for Qualcomm boards.
> >>   =

> >> +config POWER_RESET_MSM_DOWNLOAD_MODE
> > =

> > How about moving QCOM_SCM_DOWNLOAD_MODE_DEFAULT to
> > drivers/soc/qcom/Kconfig (and removing "SCM") and referencing this in
> > both drivers?
> =

> yes, thats possible, but I am not sure how to make the command line
> option common for both. One other option I thought was if we could handle=
 it
> within the scm driver itself with an additional
> binding to specify the non-secure download mode address.
> something like qcom,dload-mode-ns?

Is the SCM device and driver always going to be present though? It may
be better to make a TCSR platform device driver on designs that would
configure the cookie with direct read/writes from Linux to break the
relationship with scm entirely. Then the different configurations could
flow from the DTS file either describing scm that has scm call, a
special scm_writel address for TCSR, or a specific TCSR node with the
address of the download mode cookie that triggers a TCSR driver to probe
and register a reboot handler.
