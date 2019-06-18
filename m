From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 0/2] arm64: dts: ti: k3-j721e: Add interrupt controller
 nodes
Date: Tue, 18 Jun 2019 17:42:30 +0300
Message-ID: <d1f99db5-0d51-25f5-89b5-e7beb2089261@ti.com>
References: <20190614145001.9598-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190614145001.9598-1-lokeshvutla@ti.com>
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
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 14/06/2019 17:49, Lokesh Vutla wrote:
> This series adds dt nodes for interrupt controllers available in
> J721E SoC.
> 
> Depends on the main nav intr node posted by Suman:
> https://patchwork.kernel.org/patch/10969399/
> 
> Lokesh Vutla (2):
>    arm64: dts: ti: k3-j721e: Add interrupt controllers in main domain
>    arm64: dts: ti: k3-j721e: Add interrupt controllers in wakeup domain
> 
>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 23 +++++++++++++++++++
>   .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      | 11 +++++++++
>   2 files changed, 34 insertions(+)
> 

Queuing both patches towards 5.3, thanks.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
