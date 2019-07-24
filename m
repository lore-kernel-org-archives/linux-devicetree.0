From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8998: Node ordering, address
 cleanups
Date: Wed, 24 Jul 2019 11:45:07 -0700
Message-ID: <20190724184507.GN7234@tuxbook-pro>
References: <20190722165823.21539-1-jeffrey.l.hugo@gmail.com>
 <2165bbd3-aa60-bec0-4ee7-dfb7dc1dd1ad@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2165bbd3-aa60-bec0-4ee7-dfb7dc1dd1ad@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed 24 Jul 04:16 PDT 2019, Marc Gonzalez wrote:

> On 22/07/2019 18:58, Jeffrey Hugo wrote:
> 
> > DT nodes should be ordered by address, then node name, and finally label.
> > The msm8998 dtsi does not follow this, so clean it up by reordering the
> > nodes.  While we are at it, extend the addresses to be fully 32-bits wide
> > so that ordering is easy to determine when adding new nodes.  Also, two
> > or so nodes had the wrong address value in their node name (did not match
> > the reg property), so fix those up as well.
> > 
> > Hopefully going forward, things can be maintained so that a cleanup like
> > this is not needed.
> > 
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8998.dtsi | 254 +++++++++++++-------------
> >  1 file changed, 127 insertions(+), 127 deletions(-)
> 
> LGTM.
> 
> Reviewed-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> 
> Rob, Mark: when there are multiple reg properties, why is the convention
> to use the *first* address in the node's name, rather than the lowest
> address?
> 

Per the ePAPR (section 2.2.1 Node Names of v1.1):

"The unit-address must match the first address specified in the reg
property of the node".

Regards,
Bjorn

> e.g.
> 
> 		spmi_bus: spmi@800f000 {
> 			compatible = "qcom,spmi-pmic-arb";
> 			reg =	<0x0800f000 0x1000>,
> 				<0x08400000 0x1000000>,
> 				<0x09400000 0x1000000>,
> 				<0x0a400000 0x220000>,
> 				<0x0800a000 0x3000>;
> 			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> 
> "spmi@800f000" instead of "spmi@800a000"
> 
> Especially, since the reg props could be in any order here, given the
> lookup by name.
> 
> Regards.
