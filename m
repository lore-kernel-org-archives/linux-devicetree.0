From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 3/4] dt-bindings: arm: Document Renesas R-Car M3-N-based
 Salvator-X board
Date: Tue, 27 Feb 2018 09:22:39 +0100
Message-ID: <20180227082238.e2kk6s4wogwwltvb@verge.net.au>
References: <1519668225-12548-1-git-send-email-geert+renesas@glider.be>
 <1519668225-12548-4-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1519668225-12548-4-git-send-email-geert+renesas@glider.be>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 26, 2018 at 07:03:44PM +0100, Geert Uytterhoeven wrote:
> The Renesas Salvator-X development board can be equipped with an R-Car
> H3, M3-W, or M3-N SiP, which are pin-compatible.
> 
> Document board part number and compatible values for the version with
> R-Car M3-N.
> 
> The board part number was extracted from a big patch by Takeshi Kihara
> in the BSP.

That I have verified.

> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> index 82908a9447e4b051..51e4428856be4557 100644
> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -108,6 +108,8 @@ Boards:
>      compatible = "renesas,salvator-x", "renesas,r8a7795"
>    - Salvator-X (RTP0RC7796SIPB0011S)

Here we have: Name (Part No)

>      compatible = "renesas,salvator-x", "renesas,r8a7796"
> +  - Salvator-X (RTP0RC7796SIPB0011S (M3N))

Here we have: Name (Part No (SoC))

> +    compatible = "renesas,salvator-x", "renesas,r8a77965"
>    - Salvator-XS (Salvator-X 2nd version, RTP0RC7795SIPB0012S)

And here we have: Name (Version, Part No)

>      compatible = "renesas,salvator-xs", "renesas,r8a7795"
>    - Salvator-XS (Salvator-X 2nd version, RTP0RC7796SIPB0012S)

Can we think about making this more consistent?
