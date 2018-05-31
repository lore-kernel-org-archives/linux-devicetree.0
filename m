From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: media: rcar-vin: Describe optional
 ep properties
Date: Wed, 30 May 2018 22:13:53 -0500
Message-ID: <20180531031353.GA4440@rob-hp-laptop>
References: <1527606359-19261-1-git-send-email-jacopo+renesas@jmondi.org>
 <1527606359-19261-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1527606359-19261-2-git-send-email-jacopo+renesas@jmondi.org>
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

On Tue, May 29, 2018 at 05:05:52PM +0200, Jacopo Mondi wrote:
> Describe the optional endpoint properties for endpoint nodes of port@0
> and port@1 of the R-Car VIN driver device tree bindings documentation.
> =

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Acked-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> =

> ---
> v2 -> v3:
> - Do not repeat property description, just reference video-interfaces.txt
> - Indent with spaces, not tabs as the rest of the document
> - Do not remove (yet) the 'bus-width' property from example
> ---
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
