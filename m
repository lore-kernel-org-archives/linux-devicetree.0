From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 1/6] dt-bindings: media: rcar-vin: Describe optional ep
 properties
Date: Wed, 16 May 2018 23:18:15 +0200
Message-ID: <20180516211815.GB17948@bigcity.dyn.berto.se>
References: <1526488352-898-1-git-send-email-jacopo+renesas@jmondi.org>
 <1526488352-898-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1526488352-898-2-git-send-email-jacopo+renesas@jmondi.org>
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, geert@glider.be, laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

Thanks for your patch.

On 2018-05-16 18:32:27 +0200, Jacopo Mondi wrote:
> Describe the optional endpoint properties for endpoint nodes of port@0
> and port@1 of the R-Car VIN driver device tree bindings documentation.
> =

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Acked-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> =

> diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Docum=
entation/devicetree/bindings/media/rcar_vin.txt
> index a19517e1..c53ce4e 100644
> --- a/Documentation/devicetree/bindings/media/rcar_vin.txt
> +++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
> @@ -53,6 +53,16 @@ from local SoC CSI-2 receivers (port1) depending on So=
C.
>        from external SoC pins described in video-interfaces.txt[1].
>        Describing more then one endpoint in port 0 is invalid. Only VIN
>        instances that are connected to external pins should have port 0.
> +
> +      - Optional properties for endpoint nodes of port@0:
> +        - hsync-active: active state of the HSYNC signal, 0/1 for LOW/HI=
GH
> +	  respectively. Default is active high.
> +        - vsync-active: active state of the VSYNC signal, 0/1 for LOW/HI=
GH
> +	  respectively. Default is active high.
> +
> +	If both HSYNC and VSYNC polarities are not specified, embedded
> +	synchronization is selected.
> +
>      - port 1 - sub-nodes describing one or more endpoints connected to
>        the VIN from local SoC CSI-2 receivers. The endpoint numbers must
>        use the following schema.
> @@ -62,6 +72,8 @@ from local SoC CSI-2 receivers (port1) depending on SoC.
>          - Endpoint 2 - sub-node describing the endpoint connected to CSI=
40
>          - Endpoint 3 - sub-node describing the endpoint connected to CSI=
41
> =

> +      Endpoint nodes of port@1 do not support any optional endpoint prop=
erty.
> +
>  Device node example for Gen2 platforms
>  --------------------------------------
> =

> @@ -112,7 +124,6 @@ Board setup example for Gen2 platforms (vin1 composit=
e video input)
> =

>                  vin1ep0: endpoint {
>                          remote-endpoint =3D <&adv7180>;
> -                        bus-width =3D <8>;
>                  };
>          };
>  };
> --
> 2.7.4
> =


-- =

Regards,
Niklas S=F6derlund
