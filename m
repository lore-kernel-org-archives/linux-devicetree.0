From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] devicetree: Add vendor prefix for Kontron AG
Date: Mon, 27 Feb 2017 13:00:32 -0600
Message-ID: <20170227190032.p32ophqwp5ffrrvu@rob-hp-laptop>
References: <20170219202801.2082-1-plaes@plaes.org>
 <20170219202801.2082-3-plaes@plaes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170219202801.2082-3-plaes@plaes.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Priit Laes <plaes@plaes.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 19, 2017 at 10:27:59PM +0200, Priit Laes wrote:
> Kontron AG is a German-based company designing and manufacturing
> embedded modules, computers and systems.
> 
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 16d3b5e..4dca895 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -154,7 +154,8 @@ jedec	JEDEC Solid State Technology Association
>  karo	Ka-Ro electronics GmbH
>  keithkoep	Keith & Koep GmbH
>  keymile	Keymile GmbH
> -kinetic Kinetic Technologies
> +kinetic	Kinetic Technologies

No doubt this needs re-formatting, but don't do that in this patch.

> +kontron	Kontron AG
>  kosagi	Sutajio Ko-Usagi PTE Ltd.
>  kyo	Kyocera Corporation
>  lacie	LaCie
> -- 
> 2.9.3
> 
