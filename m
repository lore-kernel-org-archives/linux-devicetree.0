From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 8/8] ARM: dts: rcar-gen2: Remove unused VIN properties
Date: Wed, 30 May 2018 22:17:43 -0500
Message-ID: <20180531031743.GA8607@rob-hp-laptop>
References: <1527606359-19261-1-git-send-email-jacopo+renesas@jmondi.org>
 <1527606359-19261-9-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1527606359-19261-9-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, geert@glider.be, laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com, niklas.soderlund@ragnatech.se, hans.verkuil@cisco.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 29, 2018 at 05:05:59PM +0200, Jacopo Mondi wrote:
> The 'bus-width' and 'pclk-sample' properties are not parsed by the VIN
> driver and only confuse users. Remove them in all Gen2 SoC that use
> them.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> v3:
> - remove bus-width from dt-bindings example
> ---
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 1 -
>  arch/arm/boot/dts/r8a7790-lager.dts                  | 3 ---
>  arch/arm/boot/dts/r8a7791-koelsch.dts                | 3 ---
>  arch/arm/boot/dts/r8a7791-porter.dts                 | 1 -
>  arch/arm/boot/dts/r8a7793-gose.dts                   | 3 ---
>  arch/arm/boot/dts/r8a7794-alt.dts                    | 1 -
>  arch/arm/boot/dts/r8a7794-silk.dts                   | 1 -
>  7 files changed, 13 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
