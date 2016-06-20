From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Sierra Wireless
Date: Mon, 20 Jun 2016 11:28:22 -0500
Message-ID: <20160620162822.GA25662@rob-hp-laptop>
References: <1466160132-24574-1-git-send-email-narmstrong@baylibre.com>
 <1466160132-24574-2-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1466160132-24574-2-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 17, 2016 at 12:42:09PM +0200, Neil Armstrong wrote:
> Add Sierra Wireless as swi vendor prefix.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 2c2500d..45bccd2 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -250,6 +250,7 @@ st	STMicroelectronics
>  startek	Startek
>  ste	ST-Ericsson
>  stericsson	ST-Ericsson
> +swi	Sierra Wireless

Can we use the stock ticker 'swir' here.

>  syna	Synaptics Inc.
>  synology	Synology, Inc.
>  SUNW	Sun Microsystems, Inc
