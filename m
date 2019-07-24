From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: [PATCH] arm64: dts: qcom: msm8998: Node ordering, address
 cleanups
Date: Wed, 24 Jul 2019 13:16:50 +0200
Message-ID: <2165bbd3-aa60-bec0-4ee7-dfb7dc1dd1ad@free.fr>
References: <20190722165823.21539-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722165823.21539-1-jeffrey.l.hugo@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 22/07/2019 18:58, Jeffrey Hugo wrote:

> DT nodes should be ordered by address, then node name, and finally label.
> The msm8998 dtsi does not follow this, so clean it up by reordering the
> nodes.  While we are at it, extend the addresses to be fully 32-bits wide
> so that ordering is easy to determine when adding new nodes.  Also, two
> or so nodes had the wrong address value in their node name (did not match
> the reg property), so fix those up as well.
> 
> Hopefully going forward, things can be maintained so that a cleanup like
> this is not needed.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 254 +++++++++++++-------------
>  1 file changed, 127 insertions(+), 127 deletions(-)

LGTM.

Reviewed-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

Rob, Mark: when there are multiple reg properties, why is the convention
to use the *first* address in the node's name, rather than the lowest
address?

e.g.

		spmi_bus: spmi@800f000 {
			compatible = "qcom,spmi-pmic-arb";
			reg =	<0x0800f000 0x1000>,
				<0x08400000 0x1000000>,
				<0x09400000 0x1000000>,
				<0x0a400000 0x220000>,
				<0x0800a000 0x3000>;
			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";

"spmi@800f000" instead of "spmi@800a000"

Especially, since the reg props could be in any order here, given the
lookup by name.

Regards.
