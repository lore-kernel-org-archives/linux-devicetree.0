From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v5 3/6] dt-bindings: media: Document data-enable-active
 property
Date: Thu, 12 Jul 2018 10:13:28 +0200
Message-ID: <20180712081328.GT5237@bigcity.dyn.berto.se>
References: <1531145962-1540-1-git-send-email-jacopo+renesas@jmondi.org>
 <1531145962-1540-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1531145962-1540-4-git-send-email-jacopo+renesas@jmondi.org>
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

On 2018-07-09 16:19:18 +0200, Jacopo Mondi wrote:
> Add 'data-enable-active' property to endpoint node properties list.
> =

> The property allows to specify the polarity of the data-enable signal, wh=
ich
> when in active state determinates when data lines have to sampled for val=
id
> pixel data.
> =

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/video-interfaces.txt | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt=
 b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index 52b7c7b..baf9d97 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -113,6 +113,8 @@ Optional endpoint properties
>    Note, that if HSYNC and VSYNC polarities are not specified, embedded
>    synchronization may be required, where supported.
>  - data-active: similar to HSYNC and VSYNC, specifies data line polarity.
> +- data-enable-active: similar to HSYNC and VSYNC, specifies the data ena=
ble
> +  signal polarity.
>  - field-even-active: field signal level during the even field data trans=
mission.
>  - pclk-sample: sample data on rising (1) or falling (0) edge of the pixe=
l clock
>    signal.
> -- =

> 2.7.4
> =


-- =

Regards,
Niklas S=F6derlund
