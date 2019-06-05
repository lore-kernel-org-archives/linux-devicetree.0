From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v3 3/5] soc: ti: ti_sci_pm_domains: Add support for
 exclusive and shared access
Date: Wed, 5 Jun 2019 11:14:22 +0530
Message-ID: <b6f005da-3c0a-ce73-79f0-eaa19c7da92c@ti.com>
References: <20190410053728.17374-1-lokeshvutla@ti.com>
 <20190410053728.17374-4-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190410053728.17374-4-lokeshvutla@ti.com>
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
To: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Santosh,

On 10/04/19 11:07 AM, Lokesh Vutla wrote:
> TISCI protocol supports for enabling the device either with exclusive
> permissions for the requesting host or with sharing across the hosts.
> There are certain devices which are exclusive to Linux context and
> there are certain devices that are shared across different host contexts.
> So add support for getting this information from DT by increasing
> the power-domain cells to 2.
> 
> For keeping the DT backward compatibility intact, defaulting the
> device permissions to set the exclusive flag set. In this case the
> power-domain-cells is 1.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>

Any chance you can pick this patch? Tero is waiting for you to pick it up so
that dts changes can be pulled. Or can you ack it so that Tero can pick the
entire series?

Thanks and regards,
Lokesh
