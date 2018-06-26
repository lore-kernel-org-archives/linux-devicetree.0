From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: mfd: axp20x: Add "self-working" mode
 for AXP806
Date: Tue, 26 Jun 2018 15:41:14 -0600
Message-ID: <20180626214114.GA18819@rob-hp-laptop>
References: <20180620051540.25617-1-wens@csie.org>
 <20180620051540.25617-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180620051540.25617-2-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 20, 2018 at 01:15:36PM +0800, Chen-Yu Tsai wrote:
> The AXP806 has three operation modes:
> 
>   - master mode: The PMIC is the first or only AXP PMIC in the system,
> 		 but is not in charge of power management, i.e. only
> 		 provides regulator functions.
> 
>   - slave mode: The PMIC is the second AXP PMIC in the system, chained
> 		to the first, or master, one.
> 
>   - self-working mode: The PMIC is the only AXP PMIC in the system, and
> 		       is in charge of power sequencing.
> 
> The functional differences between these modes can be found in the
> "Control and Operation" chapter of the AXP806 (in Chinese) and AXP805
> (in English) datasheets. These include how the PMIC responds to external
> signals, whether it takes an external voltage reference or uses its own,
> and whether the EN/PWRON pin functions as an enable switch or power button.
> 
> We already support both slave and master mode. This patch adds a property
> for describing the self-working mode, and reworks the description for
> the mode properties.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/mfd/axp20x.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
