From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: ti_sci_pm_domains: Add support for
 exclusive and shared access
Date: Thu, 11 Apr 2019 07:34:07 -0700
Message-ID: <20190411143407.GO2839@atomide.com>
References: <20190410053728.17374-1-lokeshvutla@ti.com>
 <20190410053728.17374-3-lokeshvutla@ti.com>
 <2087d79b-67b0-5ce4-bf2f-f659ef1a5494@ti.com>
 <dfceed14-d88f-72cb-a647-0ce3fbea3ca5@ti.com>
 <2008fbb5-422a-8950-c642-74e63b79a809@ti.com>
 <b4ad336e-42d0-eaf5-7265-d566703fad75@ti.com>
 <67537564-c503-8a2a-9f48-26ebca0661ab@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <67537564-c503-8a2a-9f48-26ebca0661ab@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tero Kristo <t-kristo@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [190410 15:39]:
> On 10/04/2019 16:15, Lokesh Vutla wrote:
> > Well Ill put it this way. This flag describes that the requested device is a
> > shared device across multiple hosts :)
> 
> But that is pure software config, right? Depends on the software design
> choices made, which host is going to use which resource. Personally I don't
> think this justifies a DT binding, but I might be wrong. I'll let Rob
> comment on this.

I agree. It's best to stick to basics with the device tree bindings
and not put any software flags there.

You can configure things on init in the device driver based on
compatible and soc_device_match().

Regards,

Tony
