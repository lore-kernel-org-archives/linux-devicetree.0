From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 03/15] dt-bindings: Add documentation for Milbeaut SoCs
Date: Tue, 19 Feb 2019 10:25:57 +0900
Message-ID: <CAK7LNARTX4_phfcXRXUKGp_V0k_q_RKjL6A3Kz=Hxyqj6VXW+Q@mail.gmail.com>
References: <1549628764-30587-1-git-send-email-sugaya.taichi@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1549628764-30587-1-git-send-email-sugaya.taichi@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sugaya Taichi <sugaya.taichi@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 8, 2019 at 9:26 PM Sugaya Taichi
<sugaya.taichi@socionext.com> wrote:
>
> This adds a DT binding documentation for the M10V and its evaluation
> board.
>
> Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
> ---
>  Documentation/devicetree/bindings/arm/milbeaut.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/milbeaut.txt
>
> diff --git a/Documentation/devicetree/bindings/arm/milbeaut.txt b/Documentation/devicetree/bindings/arm/milbeaut.txt



I added uniphier SoC/board binding into

Documentation/devicetree/bindings/arm/socionext/uniphier.txt


You can milbeaut.txt to the socionext directory as well.




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


-- 
Best Regards
Masahiro Yamada
