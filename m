From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845: Add Coresight support
Date: Mon, 14 Jan 2019 08:35:09 -0700
Message-ID: <20190114153509.GA29374@xps15>
References: <cover.1547054308.git.saiprakash.ranjan@codeaurora.org>
 <a13ad49d3ae8d9a5a972027283b7212ab19f97d0.1547054308.git.saiprakash.ranjan@codeaurora.org>
 <20190111184643.GA22691@xps15>
 <81172d85ed7782e0db561fcf96a82d46@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <81172d85ed7782e0db561fcf96a82d46@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: saiprakash.ranjan@codeaurora.org
Cc: Rob Herring <robh+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jan 12, 2019 at 06:21:00PM +0530, saiprakash.ranjan@codeaurora.org wrote:
> Hi Mathieu,
> 
> > > +
> > > +	etm@7040000 {
> > > +		compatible = "arm,coresight-etm4x", "arm,primecell";
> > > +		arm,primecell-periphid = <0x000bb95d>;
> > 
> > I'm a little curious as to why you need to bypass the normal AMBA bus
> > discovery
> > method by forcing the peripheral ID.  Tracers don't show up the way
> > other
> > coresight devices do at boot time?
> > 
> 
> Yes on some Qcom SoC's like SDM845 and also on some previous ones, for
> ETM(only) amba bus discovery method fails because of wrong pid read from the
> registers. So we have to force this primecell peripheral ids to probe etm.

Ok, if that is the case please add a comment to explain the situation.
Otherwise someone will assuredly ask again in the future.

Mathieu


> 
> - Sai
> 
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of
> Code Aurora Forum, hosted by The Linux Foundation
