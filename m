From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: ti_sci_pm_domains: Add support for
 exclusive access
Date: Wed, 6 Mar 2019 08:58:37 -0600
Message-ID: <20190306145837.e55igfgrjdm3wq3b@kahuna>
References: <20190223093232.29003-1-lokeshvutla@ti.com>
 <20190223093232.29003-3-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190223093232.29003-3-lokeshvutla@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 15:02-20190223, Lokesh Vutla wrote:
> TISCI protocol supports for enabling the device with exclusive
> permissions. Certain remoteproc devices or some shared devices
> across VM doesn't wants to request devices with this flag set.
> So add support for getting this information from DT by increasing
> the power-domain cells to 2.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>  Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt b/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
> index f7b00a7c0f68..5fdda7475023 100644
> --- a/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
> +++ b/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
> @@ -19,8 +19,11 @@ child of the pmmc node.
>  Required Properties:
>  --------------------
>  - compatible: should be "ti,sci-pm-domain"
> -- #power-domain-cells: Must be 1 so that an id can be provided in each
> -		       device node.
> +- #power-domain-cells: Can be one of the following:
> +			1: Containing the device id of each node
> +			2: First entry should be device id
> +			   Second entry should be 1 or 0. Use 1 for enabling
> +			   the device with exclusive permissions set else 0.

Rob, any thoughts?


-- 
Regards,
Nishanth Menon
