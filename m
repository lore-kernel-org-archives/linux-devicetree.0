From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v3 04/13] ARM: dts: ipq4019: Update ipq4019-dk01.1 board
 data
Date: Tue, 20 Mar 2018 07:31:31 -0700
Message-ID: <20180320143131.4eenixtbhciq5fwc@localhost>
References: <1521518336-5467-1-git-send-email-sricharan@codeaurora.org>
 <1521518336-5467-5-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521518336-5467-5-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, absahu@codeaurora.org, marc.zyngier@arm.com
List-Id: devicetree@vger.kernel.org

On Tue, Mar 20, 2018 at 09:28:47AM +0530, Sricharan R wrote:
> Reviewed-by: Abhishek Sahu <absahu@codeaurora.org>
> Adds missing memory, reserved-memory nodes.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi | 28 +++++++++++++++++++++++++++

Q: Does mainline Linux even boot on the DK?

A: No, it doesn't.

Please add the missing basic board support before hacking random stuff
into the DTS.

Thanks,
Richard
