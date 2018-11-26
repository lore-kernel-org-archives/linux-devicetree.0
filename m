From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add WCN3990 WLAN module device
 node
Date: Mon, 26 Nov 2018 22:55:12 +0530
Message-ID: <20181126172512.GW3175@vkoul-mobl.Dlink>
References: <20181126142133.16966-1-govinds@codeaurora.org>
 <20181126144422.GU3175@vkoul-mobl.Dlink>
 <bcda9f6ffc58c8457e8822226b751132@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bcda9f6ffc58c8457e8822226b751132@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Govind Singh <govinds@codeaurora.org>
Cc: andy.gross@linaro.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Govind,

On 26-11-18, 22:28, Govind Singh wrote:
> On 2018-11-26 20:14, Vinod Koul wrote:
> > On 26-11-18, 19:51, Govind Singh wrote:

> > Lastly, I am not sure, but should the wifi node be always enabled?
> > Should it not be enabled in the board dts file? Bjorn..?
> > 
> 
> yes, i some how missed this.
> I will mark the status disabled by default and enable from qcs404 evb dts.

No issues, also we have two DTS EVB-1000 and EVB-4000, please choose
accordingly and if common please use qcs404-evb.dtsi

-- 
~Vinod
