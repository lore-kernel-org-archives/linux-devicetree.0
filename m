From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 8/8] devicetree: bindings: Document PM8921/8058 PMICs
Date: Thu, 27 Feb 2014 08:38:56 +0000
Message-ID: <20140227083856.GB9195@lee--X1>
References: <1393441166-32692-1-git-send-email-sboyd@codeaurora.org>
 <1393441166-32692-9-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1393441166-32692-9-git-send-email-sboyd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> PM8921 and PM8058 are PMICs found paired with MSM8960 and MSM8660
> devices respectively. They contain subdevices such as keypads,
> RTC, regulators, clocks, etc.
>=20
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  .../devicetree/bindings/mfd/qcom,pm8xxx.txt        | 63 ++++++++++++=
++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8xxx=
=2Etxt

This patch has been on the MLs for some time now and hasn't received
any feedback from the DT guys.

Patch looks good (despite the lack IRQ defines), applied.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
