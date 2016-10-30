From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 01/23] reset: Add renesas,rst DT bindings
Date: Sun, 30 Oct 2016 15:41:22 -0500
Message-ID: <20161030204122.zejypdnpu3h3um7x@rob-hp-laptop>
References: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
 <1477055857-17936-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1477055857-17936-2-git-send-email-geert+renesas@glider.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 21, 2016 at 03:17:15PM +0200, Geert Uytterhoeven wrote:
> Add DT bindings for the Renesas R-Car Reset Controller (R-Car Gen1
> RESET/WDT and R-Car Gen2/Gen3 and RZ/G RST).
> 
> As the features provided by the hardware module differ a lot across the
> various SoC families and members, only SoC-specific compatible values
> are defined.
> 
> For now we use the RST only for providing access to the state of the
> mode pins, which is needed by the clock driver.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Magnus Damm <damm+renesas@opensource.se>
> Acked-by: Dirk Behme <dirk.behme@de.bosch.com>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v4:
>   - Add Acked-by,
>   - Fix comma and period in list,
>   - Add RZ/G1M and RZ/G1E,
> 
> v3:
>   - Clarify current usage,
>   - Use "renesas,<soctype>-rst" instead of "renesas,rst-<soctype>",
>   - Drop "syscon" compatible value,
>   - Add R-Car M3-W,
>   - Add R-Car Gen1,
> 
> v2:
>   - Add Acked-by.
> ---
>  .../devicetree/bindings/reset/renesas,rst.txt      | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/renesas,rst.txt

Acked-by: Rob Herring <robh@kernel.org>
