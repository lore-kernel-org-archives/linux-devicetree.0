From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 4/6] phy: qcom-qmp: Add QMP V3 USB3 UNI PHY support for sdm845
Date: Tue, 27 Mar 2018 14:42:31 -0700
Message-ID: <CAD=FV=WoA+jGnrDBJ_wucFRfLC_NqdQTZtZnG96WxNBWaOP+wg@mail.gmail.com>
References: <1521785487-29866-1-git-send-email-mgautam@codeaurora.org> <1521785487-29866-5-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521785487-29866-5-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Varadarajan Narayanan <varada@codeaurora.org>, Jaehoon Chung <jh80.chung@samsung.com>, Fengguang Wu <fengguang.wu@intel.com>, Wei Yongjun <weiyongjun1@huawei.com>, Evan Green <evgreen@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Mar 22, 2018 at 11:11 PM, Manu Gautam <mgautam@codeaurora.org> wrote:
> @@ -1414,6 +1556,12 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
>         }, {
>                 .compatible = "qcom,qmp-v3-usb3-phy",
>                 .data = &qmp_v3_usb3phy_cfg,
> +       }, {
> +               .compatible = "qcom,sdm845-qmp-usb3-phy",
> +               .data = &qmp_v3_usb3phy_cfg,
> +       }, {
> +               .compatible = "qcom,sdm845-qmp-usb3-uni-phy",
> +               .data = &qmp_v3_usb3_uniphy_cfg,

As per my comments on the bindings patch, having two compatible
strings that both map to "qmp_v3_usb3phy_cfg" smells a little wrong.


* If the agreement in the bindings patch is that we somehow need to
keep "qcom,qmp-v3-usb3-phy" around then the sdm845 device tree file
should list:

  compatible = "qcom,sdm845-qmp-usb3-phy", "qcom,qmp-v3-usb3-phy";

...and then you can get rid of the "qcom,sdm845-qmp-usb3-phy" in this
table (it will use the secondary compatible string to pick the right
entry).


* If the agreement is to get rid of "qcom,qmp-v3-usb3-phy" then it
should go away from the table.


-Doug
