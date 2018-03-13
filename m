From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: rename qcom,pcie devices to pcie
Date: Tue, 13 Mar 2018 11:19:10 -0700
Message-ID: <20180313181910.GW18510@minitux>
References: <20180313121345.2749183-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180313121345.2749183-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 13 Mar 05:13 PDT 2018, Arnd Bergmann wrote:

> The node name for a PCIe host bridge must be "pcie" as required by
> the binging. dtc now warns about it:
> 

"binding", I presume...

> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: Warning (pci_bridge): /soc/agnoc@0/qcom,pcie@610000: node name is not "pci" or "pcie"
> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: Warning (pci_device_bus_num): Failed prerequisite 'pci_bridge'
> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: Warning (pci_bridge): /soc/agnoc@0/qcom,pcie@610000: node name is not "pci" or "pcie"
> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: Warning (pci_device_bus_num): Failed prerequisite 'pci_bridge'
> 
> This renames the nodes as appropriate.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
