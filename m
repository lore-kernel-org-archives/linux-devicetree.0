From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 09/10] arm64: dts: qcom: msm8916: normalize I2C and
 SPI nodes
Date: Fri, 15 Dec 2017 21:20:39 -0800
Message-ID: <20171216052039.GF4281@tuxbook>
References: <20171207151942.5805-1-damien.riegel@savoirfairelinux.com>
 <20171207151942.5805-10-damien.riegel@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171207151942.5805-10-damien.riegel@savoirfairelinux.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Damien Riegel <damien.riegel@savoirfairelinux.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, kernel@savoirfairelinux.com
List-Id: devicetree@vger.kernel.org

On Thu 07 Dec 07:19 PST 2017, Damien Riegel wrote:

> The QUP core can be used either for I2C or SPI, so the same IP is mapped
> by a driver or the other. SPI bindings use a leading 0 for the start
> address and a size of 0x600, I2C bindings don't have the leading 0 and
> have a size 0x1000.
> 
> To make them more similar, add the leading 0 to I2C bindings and changes
> the size to 0x500 for all of them, as this is the actual size of these
> blocks. Also align the second entry of the clocks array.
> 
> Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
