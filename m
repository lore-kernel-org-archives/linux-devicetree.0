From: Josh Cartwright <joshc@codeaurora.org>
Subject: Re: [PATCH] ARM: DT: ifc6410: Add board memory range.
Date: Wed, 17 Sep 2014 14:18:30 -0500
Message-ID: <20140917191829.GC3749@joshc.qualcomm.com>
References: <1410932179-4652-1-git-send-email-srinivas.kandagatla@linaro.org>
 <54192B64.6070604@smartplayin.com>
 <FA9D8682-DB0E-48CF-A519-86A0465300E1@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <FA9D8682-DB0E-48CF-A519-86A0465300E1@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Pramod Gurav <pramod.gurav@smartplayin.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 17, 2014 at 12:03:37PM -0700, Kumar Gala wrote:
> On Sep 16, 2014, at 11:34 PM, Pramod Gurav <pramod.gurav@smartplayin.com> wrote:
> > On Wednesday 17 September 2014 11:06 AM, Srinivas Kandagatla wrote:
> >> This patch adds memory details of IFC6410 as this is necessary to
> >> fix the in-correct memory start comming from ATAGs.
> >> 
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> ---
> >> arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 5 +++++
> >> 1 file changed, 5 insertions(+)
> >> 
> >> diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> >> index 90db8af..3287f12 100644
> >> --- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> >> +++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> >> @@ -4,6 +4,11 @@
> >> 	model = "Qualcomm APQ8064/IFC6410";
> >> 	compatible = "qcom,apq8064-ifc6410", "qcom,apq8064";
> >> 
> >> +	memory{
> > Space before {?
> >> +		device_type = "memory";
> >> +		reg = <0x80000000 0x80000000>;
> >> +	};
> >> +
> >> 	soc {
> >> 		gsbi@16600000 {
> >> 			status = "ok?;
> 
> Hmm, this doesn?t seem to work for me.

I don't see how it could with qcom_defconfig, as we set
CONFIG_ARM_ATAG_DTB_COMPAT.  Is this patch fixing a real issue?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
