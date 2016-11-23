From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] Documentation: dt: reset: Add TI SCI reset binding
Date: Wed, 23 Nov 2016 17:01:03 -0600
Message-ID: <20161123230103.lnffpkby43uzcb6k@rob-hp-laptop>
References: <20161121213052.8684-1-afd@ti.com>
 <20161121213052.8684-2-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20161121213052.8684-2-afd@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>, Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 21, 2016 at 03:30:51PM -0600, Andrew F. Davis wrote:
> Add TI SCI reset controller binding. This describes the DT binding
> details for a reset controller node providing reset management services
> to hardware blocks (reset consumers) using the Texas Instrument's System
> Control Interface (TI SCI) protocol to communicate to a system controller
> block present on the SoC.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> [s-anna@ti.com: revise the binding format]
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Nishanth Menon <nm@ti.com>
> Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
> ---
>  .../devicetree/bindings/reset/ti,sci-reset.txt     | 66 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  include/dt-bindings/reset/k2g.h                    | 22 ++++++++
>  3 files changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/ti,sci-reset.txt
>  create mode 100644 include/dt-bindings/reset/k2g.h

Acked-by: Rob Herring <robh@kernel.org>
