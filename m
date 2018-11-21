From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] power: reset: msm: Add support for download-mode control
Date: Wed, 21 Nov 2018 10:26:35 -0800
Message-ID: <154282479571.88331.5041132574563990889@swboyd.mtv.corp.google.com>
References: <1531977529-23304-1-git-send-email-rnayak@codeaurora.org>
 <20180719054200.GB30024@minitux>
 <ca74b7f4-3e60-2f3b-3d66-ac167c913c0e@codeaurora.org>
 <153210869376.48062.15842782379577271631@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153210869376.48062.15842782379577271631@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>
Cc: sre@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Stephen Boyd (2018-07-20 10:44:53)
> Quoting Rajendra Nayak (2018-07-18 23:59:20)
> > On 7/19/2018 11:12 AM, Bjorn Andersson wrote:
> > > On Wed 18 Jul 22:18 PDT 2018, Rajendra Nayak wrote:
> > >> diff --git a/Documentation/devicetree/bindings/power/reset/msm-power=
off.txt b/Documentation/devicetree/bindings/power/reset/msm-poweroff.txt
> > >> index ce44ad3..9dd489f 100644
> > >> --- a/Documentation/devicetree/bindings/power/reset/msm-poweroff.txt
> > >> +++ b/Documentation/devicetree/bindings/power/reset/msm-poweroff.txt
> > >> @@ -8,6 +8,9 @@ settings.
> > >>   Required Properties:
> > >>   -compatible: "qcom,pshold"
> > >>   -reg: Specifies the physical address of the ps-hold register
> > >> +Optional Properties:
> > >> +-qcom,dload-mode: phandle to the TCSR hardware block and offset of =
the
> > >> +             download mode control register
> > >>   =

> > >>   Example:
> > >>   =

> > >> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconf=
ig
> > >> index df58fc8..0c97e34 100644
> > >> --- a/drivers/power/reset/Kconfig
> > >> +++ b/drivers/power/reset/Kconfig
> > >> @@ -104,6 +104,17 @@ config POWER_RESET_MSM
> > >>      help
> > >>        Power off and restart support for Qualcomm boards.
> > >>   =

> > >> +config POWER_RESET_MSM_DOWNLOAD_MODE
> > > =

> > > How about moving QCOM_SCM_DOWNLOAD_MODE_DEFAULT to
> > > drivers/soc/qcom/Kconfig (and removing "SCM") and referencing this in
> > > both drivers?
> > =

> > yes, thats possible, but I am not sure how to make the command line
> > option common for both. One other option I thought was if we could hand=
le it
> > within the scm driver itself with an additional
> > binding to specify the non-secure download mode address.
> > something like qcom,dload-mode-ns?
> =

> Is the SCM device and driver always going to be present though? It may
> be better to make a TCSR platform device driver on designs that would
> configure the cookie with direct read/writes from Linux to break the
> relationship with scm entirely. Then the different configurations could
> flow from the DTS file either describing scm that has scm call, a
> special scm_writel address for TCSR, or a specific TCSR node with the
> address of the download mode cookie that triggers a TCSR driver to probe
> and register a reboot handler.
> =


Does my proposal work? I haven't seen anything new on the list since
this email.
