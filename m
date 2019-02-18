From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 03/15] dt-bindings: Add documentation for Milbeaut SoCs
Date: Mon, 18 Feb 2019 13:52:47 -0600
Message-ID: <20190218195247.GA9690@bogus>
References: <1549628764-30587-1-git-send-email-sugaya.taichi@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549628764-30587-1-git-send-email-sugaya.taichi@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sugaya Taichi <sugaya.taichi@socionext.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 08, 2019 at 09:26:04PM +0900, Sugaya Taichi wrote:
> This adds a DT binding documentation for the M10V and its evaluation
> board.

Most boards/soc bindings are using DT schema (yaml) now. We're not 
requiring that just yet, but I'd like to not add more. So can you 
convert this to schema. 

Rob

> 
> Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
> ---
>  Documentation/devicetree/bindings/arm/milbeaut.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/milbeaut.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/milbeaut.txt b/Documentation/devicetree/bindings/arm/milbeaut.txt
> new file mode 100644
> index 0000000..9fd053a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/milbeaut.txt
> @@ -0,0 +1,6 @@
> +Milbeaut platforms device tree bindings
> +---------------------------------------
> +
> +- Milbeaut M10V Evaluation Board
> +    Required root node properties:
> +      - compatible = "socionext,milbeaut-m10v-evb", "socionext,sc2000a";
> -- 
> 1.9.1
> 
