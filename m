From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v3 4/8] dt-bindings: media: rcar-vin: Add
 'data-enable-active'
Date: Mon, 4 Jun 2018 14:10:41 +0200
Message-ID: <20180604121041.GE19674@bigcity.dyn.berto.se>
References: <1527606359-19261-1-git-send-email-jacopo+renesas@jmondi.org>
 <1527606359-19261-5-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1527606359-19261-5-git-send-email-jacopo+renesas@jmondi.org>
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com, geert@glider.be, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

Thanks for your patch.

On 2018-05-29 17:05:55 +0200, Jacopo Mondi wrote:
> Describe optional endpoint property 'data-enable-active' for R-Car VIN.
> =

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v3:
> - new patch
> ---
> =

>  Documentation/devicetree/bindings/media/rcar_vin.txt | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Docum=
entation/devicetree/bindings/media/rcar_vin.txt
> index 4d91a36..ff53226 100644
> --- a/Documentation/devicetree/bindings/media/rcar_vin.txt
> +++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
> @@ -58,6 +58,8 @@ from local SoC CSI-2 receivers (port1) depending on SoC.
>        - Optional properties for endpoint nodes of port@0:
>          - hsync-active: see [1] for description. Default is active high.
>          - vsync-active: see [1] for description. Default is active high.
> +        - data-enable-active: polarity of CLKENB signal, see [1] for
> +          description. Default is active high.
> =

>          If both HSYNC and VSYNC polarities are not specified, embedded
>          synchronization is selected.
> --
> 2.7.4
> =


-- =

Regards,
Niklas S=F6derlund
