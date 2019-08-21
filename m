From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: sm8150: Add apps shared nodes
Date: Wed, 21 Aug 2019 23:33:39 +0530
Message-ID: <20190821180339.GK12733@vkoul-mobl.Dlink>
References: <20190820172351.24145-1-vkoul@kernel.org>
 <20190820172351.24145-10-vkoul@kernel.org>
 <CAHLCerOKd8Nr9hnKKMZawoUxopcUDfez=xMB34t7s0=2ZpnDVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHLCerOKd8Nr9hnKKMZawoUxopcUDfez=xMB34t7s0=2ZpnDVg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@verdurent.com>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 21-08-19, 14:13, Amit Kucheria wrote:
> On Tue, Aug 20, 2019 at 10:55 PM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > Add hwlock, pmu, smem, tcsr_mutex_regs, apss_shared mailbox, apps_rsc
> > including the rpmhcc child nodes to the SM8150 DTSI
> > +
> >                 spmi_bus: spmi@c440000 {
> 
> Sort by address here.

Yes will fix, thanks for spotting!

-- 
~Vinod
