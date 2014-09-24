From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 2/3] mfd: qcom-rpm: Driver for the Qualcomm RPM
Date: Wed, 24 Sep 2014 09:23:26 +0100
Message-ID: <20140924082326.GG17801@lee--X1>
References: <1411428329-23172-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1411428329-23172-3-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1411428329-23172-3-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Andy Gross <agross@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@linaro.org>, Kumar Gala <galak@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 22 Sep 2014, Bjorn Andersson wrote:

> Driver for the Resource Power Manager (RPM) found in Qualcomm 8660, 8=
960
> and 8064 based devices. The driver exposes resources that child drive=
rs
> can operate on; to implementing regulator, clock and bus frequency
> drivers.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>=20
> No functional changes since v6.

Then you should have applied my:

  Acked-by: Lee Jones <lee.jones@linaro.org>

>  drivers/mfd/Kconfig          |   14 +
>  drivers/mfd/Makefile         |    1 +
>  drivers/mfd/qcom_rpm.c       |  580 ++++++++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/qcom_rpm.h |   10 +
>  4 files changed, 605 insertions(+)
>  create mode 100644 drivers/mfd/qcom_rpm.c
>  create mode 100644 include/linux/mfd/qcom_rpm.h

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
