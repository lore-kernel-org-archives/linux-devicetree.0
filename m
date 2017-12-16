From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 06/10] arm64: dts: qcom: msm8916: move pinconfs to
 board files
Date: Fri, 15 Dec 2017 21:18:33 -0800
Message-ID: <20171216051833.GC4281@tuxbook>
References: <20171207151942.5805-1-damien.riegel@savoirfairelinux.com>
 <20171207151942.5805-7-damien.riegel@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171207151942.5805-7-damien.riegel@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Damien Riegel <damien.riegel@savoirfairelinux.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, kernel@savoirfairelinux.com
List-Id: devicetree@vger.kernel.org

On Thu 07 Dec 07:19 PST 2017, Damien Riegel wrote:

> Following a suggestion from Bjorn Andersson [1], this commit moves
> electrical specifications which were defined in mms8916-pins.dtsi to
> board files, where they actually belong.
> 
> Pinmuxing is kept in the platform file because there are no alternative
> pins on which all these functions could be routed, so this part is
> indeed common to all boards using this SoC.
> 
> [1] https://www.spinics.net/lists/devicetree/msg201764.html
> 
> Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I like the move, but I would prefer that you mimic the base structure,
rather than just appending properties based on labels.

Regards,
Bjorn
