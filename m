From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] phy: qcom-qmp: new qmp phy driver for qcom-chipsets
Date: Wed, 26 Oct 2016 16:18:19 -0500
Message-ID: <20161026211819.kwlx56ic5cmahwjm@rob-hp-laptop>
References: <1476873827-7191-1-git-send-email-vivek.gautam@codeaurora.org>
 <1476873827-7191-3-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476873827-7191-3-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 19, 2016 at 04:13:47PM +0530, Vivek Gautam wrote:
> Qualcomm SOCs have QMP phy controller that provides support
> to a number of controller, viz. PCIe, UFS, and USB.
> Add a new driver, based on generic phy framework, for this
> phy controller.
> 
> USB3-phy changes: Based on phy-msm-ssusb-qmp driver available on
> msm-4.4 kernel @codeaurora[1].
> PCIe-phy changes: Based on msm8996-pcie-phy driver posted by
> Srinivas [2].
> 
> [1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/log/?h=caf/3.18/msm-3.18
> [2] https://patchwork.kernel.org/patch/9318947/
> 
> Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
> ---
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       |   61 ++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/phy/Kconfig                                |    8 +
>  drivers/phy/Makefile                               |    1 +
>  drivers/phy/phy-qcom-qmp.c                         | 1154 ++++++++++++++++++++
>  4 files changed, 1224 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>  create mode 100644 drivers/phy/phy-qcom-qmp.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
