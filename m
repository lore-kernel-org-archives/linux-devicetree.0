From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2] Documentation: dt: reset: Revise typos in TI syscon
 reset example
Date: Thu, 12 Jan 2017 11:54:05 +0100
Message-ID: <1484218445.2376.10.camel@pengutronix.de>
References: <20170109192814.26811-1-s-anna@ti.com>
 <20170112012217.18115-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170112012217.18115-1-s-anna@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Suman Anna <s-anna@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 11.01.2017, 19:22 -0600 schrieb Suman Anna:
> Fix couple of typos in the example given in the TI syscon reset
> binding. The ti,reset-bits used for DSP0 are corrected to match
> the values that will be used in the actual DT node.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v2: Address Rob Herring's comment to change the reset node name
>     from "psc-reset" to "reset-controller"

I've applied the patch, thank you.

regards
Philipp
