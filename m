From: Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH 0/2] Add HwSpinlock nodes for TI K3 SoCs
Date: Tue, 27 Aug 2019 17:34:28 -0500
Message-ID: <715d61be-c881-cde8-38f0-451637767909@ti.com>
References: <20190722190539.27816-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722190539.27816-1-s-anna@ti.com>
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
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Tero,

On 7/22/19 2:05 PM, Suman Anna wrote:
> Hi Tero,
> 
> The following series adds the HwSpinlock DT nodes for the
> TI K3 AM65x and J721E SoC families. Patches are based on
> v5.3-rc1.

I am not sure if you have already staged these, but if haven't,
can you please pick these and the mailbox nodes for 5.4 merge window?

Thanks,
Suman

> 
> The bindings and driver support for the same have been
> merged in v5.3-rc1.
> 
> regards
> Suman
> 
> Suman Anna (2):
>   arm64: dts: ti: k3-am65-main: Add hwspinlock node
>   arm64: dts: ti: k3-j721e-main: Add hwspinlock node
> 
>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi  | 6 ++++++
>  arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
