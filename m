From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/6] dt-bindings: media: rcar-vin: Align Gen2 and Gen3
Date: Wed, 11 Jul 2018 07:51:12 -0600
Message-ID: <20180711135112.GA12419@rob-hp-laptop>
References: <1531145962-1540-1-git-send-email-jacopo+renesas@jmondi.org>
 <1531145962-1540-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1531145962-1540-2-git-send-email-jacopo+renesas@jmondi.org>
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

On Mon, Jul 09, 2018 at 04:19:16PM +0200, Jacopo Mondi wrote:
> Align description of the Gen2 and Gen3 bindings for parallel input.
> This commit prepares for description of optional endpoint properties in ports
> subnodes accepting parallel video connections.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
