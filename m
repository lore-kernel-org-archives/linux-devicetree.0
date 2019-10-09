From: Faiz Abbas <faiz_abbas@ti.com>
Subject: Re: [PATCH 0/2] Add Support for MMC/SD for J721e-base-board
Date: Wed, 9 Oct 2019 15:27:14 +0530
Message-ID: <f176e389-d181-8848-2bce-6680232b8fa8@ti.com>
References: <20190919153242.29399-1-faiz_abbas@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190919153242.29399-1-faiz_abbas@ti.com>
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
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, nm@ti.com, robh+dt@kernel.org, t-kristo@ti.com
List-Id: devicetree@vger.kernel.org

Hi,

On 19/09/19 9:02 PM, Faiz Abbas wrote:
> The following are dts patches to add MMC/SD Support on TI's J721e base
> board.
> 
> Patches depend on Lokesh's gpio patches[1] and device exclusivity patches[2].
> 
> [1] https://patchwork.kernel.org/cover/11085643/
> [2] https://patchwork.kernel.org/cover/11051559/
> 
> Faiz Abbas (2):
>   arm64: dts: ti: j721e-main: Add SDHCI nodes
>   arm64: dts: ti: j721e-common-proc-board: Add Support for eMMC and SD
>     card
> 
>  .../dts/ti/k3-j721e-common-proc-board.dts     | 34 +++++++++++++
>  arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 50 +++++++++++++++++++
>  2 files changed, 84 insertions(+)
> 

Gentle ping.

Thanks,
Faiz
