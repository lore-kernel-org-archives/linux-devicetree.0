From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v7 6/7] arm64: zynqmp: Add DDRC node
Date: Fri, 21 Sep 2018 14:57:01 +0200
Message-ID: <20180921125701.GF30439@nazgul.tnic>
References: <1537194305-9243-1-git-send-email-manish.narani@xilinx.com>
 <1537194305-9243-7-git-send-email-manish.narani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1537194305-9243-7-git-send-email-manish.narani@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Manish Narani <manish.narani@xilinx.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, michal.simek@xilinx.com, leoyang.li@nxp.com, sudeep.holla@arm.com, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 17, 2018 at 07:55:04PM +0530, Manish Narani wrote:
> Add ddrc memory controller node in dts. The size mentioned in dts is
> 0x30000, because we need to access DDR_QOS INTR registers located at
> 0xFD090208 from this driver.
> 
> Signed-off-by: Manish Narani <manish.narani@xilinx.com>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)

Still needs DT folks ACK.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
