From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 11/13] ARM: dts: ipq8074: Add peripheral nodes
Date: Tue, 27 Mar 2018 10:45:01 -0700
Message-ID: <20180327174501.GN1403@tuxbook-pro>
References: <1521800336-19266-1-git-send-email-sricharan@codeaurora.org>
 <1521800336-19266-12-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521800336-19266-12-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, absahu@codeaurora.org, marc.zyngier@arm.com, richardcochran@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri 23 Mar 03:18 PDT 2018, Sricharan R wrote:
> +		serial_blsp0: serial@78af000 {

Please try to have a single scheme for how you name your labels; this is
serial0 or blsp1_uart1.

[..]
> +		i2c_0: i2c@78b6000 {

As in the previous patches, this is the 2nd i2c master in the SoC,
please label it accordingly.

Regards,
Bjorn
