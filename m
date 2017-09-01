From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: interrupt-controller: Add Realtek
 RTD1295
Date: Fri, 1 Sep 2017 09:30:13 -0500
Message-ID: <20170901143013.oe5frfvxlnppn6v4@rob-hp-laptop>
References: <20170828105344.8338-1-afaerber@suse.de>
 <20170828105344.8338-2-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170828105344.8338-2-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Roc He <hepeng@zidoo.tv>, =?utf-8?B?6JKL5Li955C0?= <jiang.liqin@geniatech.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 28, 2017 at 12:53:42PM +0200, Andreas Färber wrote:
> Add binding for Realtek RTD1295 IRQ mux.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  v1 -> v2:
>  * Dropped reference to common interrupt.txt bindings (Rob)
>  
>  .../interrupt-controller/realtek,rtd119x-mux.txt   | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/realtek,rtd119x-mux.txt

Acked-by: Rob Herring <robh@kernel.org>
