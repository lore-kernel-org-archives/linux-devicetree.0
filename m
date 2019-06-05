From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH 0/4] Add MCU SRAM nodes for TI K3 SoCs
Date: Wed, 5 Jun 2019 12:53:49 -0400
Message-ID: <acf9cf30-bcd6-76a0-5498-c334c7c43213@ti.com>
References: <20190605163434.23173-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190605163434.23173-1-s-anna@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 6/5/19 12:34 PM, Suman Anna wrote:
> Hi Tero,
> 
> The following series adds the DT nodes for the MCU SRAM present within
> the MCU domain for both AM65x and J721E SoCs. The first 2 patches enable
> the MCU SRAM node to be probed properly on AM65x SoCs, and the third
> patch the equivalent for J721E SoCs. The third patch depends on the
> base J721E support patch series from Nishanth [1].
> 
> The last patch is not related to MCU SRAM, but adds the ranges for the
> R5F cluster that is also present in the MCU domain in preparation for
> the R5F nodes.
> 

Why not have this last patch as part of the series adding the R5F nodes?

Andrew

> regards
> Suman
> 
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=121189
> 
> Suman Anna (4):
>    arm64: dts: ti: k3-am65: Add MCU SRAM ranges in interconnect nodes
>    arm64: dts: ti: k3-am65-mcu: Add the MCU RAM node
>    arm64: dts: ti: k3-j721e: Add the MCU SRAM node
>    arm64: dts: ti: k3-am65: Add R5F ranges in interconnect nodes
> 
>   arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi         | 8 ++++++++
>   arch/arm64/boot/dts/ti/k3-am65.dtsi             | 6 ++++++
>   arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi | 8 ++++++++
>   3 files changed, 22 insertions(+)
> 
