From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 0/3] arm64: dts: ti: k3-am654: Add interrupt controller
 nodes
Date: Thu, 6 Jun 2019 15:17:38 +0300
Message-ID: <4283c4e7-b3ef-a4b6-86c0-5a961dbf42c7@ti.com>
References: <20190502094119.16350-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190502094119.16350-1-lokeshvutla@ti.com>
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
To: Lokesh Vutla <lokeshvutla@ti.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 02/05/2019 12:41, Lokesh Vutla wrote:
> This series adds dt nodes for interrupt controllers available in
> AM654 SoC.
> 
> Lokesh Vutla (3):
>    arm64: dts: ti: k3-am654: Update compatible for dmsc
>    arm64: dts: ti: k3-am654: Add interrupt controllers in main domain
>    arm64: dts: ti: k3-am654: Add interrupt controllers in wakeup domain
> 
>   arch/arm64/boot/dts/ti/k3-am65-main.dtsi   | 41 ++++++++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi | 13 ++++++-
>   2 files changed, 53 insertions(+), 1 deletion(-)
> 

Queued up towards 5.3, thanks.

Also, pushed to am654-next for people that may want to post patches that 
depend on this series.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
