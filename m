From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH v3 09/11] ARM: dts: apq8064-ifc6410: Add DT alias for
 serial port
Date: Fri, 10 Apr 2015 14:07:34 -0700
Message-ID: <20150410210734.GR19186@sonymobile.com>
References: <1428698491-11881-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1428698671-12282-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1428698671-12282-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: "galak@codeaurora.org" <galak@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pramod Gurav <pramod.gurav@smartplayin.com>
List-Id: devicetree@vger.kernel.org

On Fri 10 Apr 13:44 PDT 2015, Srinivas Kandagatla wrote:

> From: Pramod Gurav <pramod.gurav@smartplayin.com>
> 
> Define an alias for serial port present on ifc6410 which is used as
> console.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> [Srinivas Kandagatla: renamed the serial0 label appropriately]
> Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>
> ---

The order of the sobs should be reversed, your name should be last as
you're the last one touching the patch.

Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Regards,
Bjorn
