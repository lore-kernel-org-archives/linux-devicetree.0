From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: add UniPhier PCIe PHY description
Date: Mon, 17 Sep 2018 01:45:01 -0400
Message-ID: <5b9f3f5f.1c69fb81.7a5bc.feae@mx.google.com>
References: <1536140985-6058-1-git-send-email-hayashi.kunihiko@socionext.com>
 <1536140985-6058-2-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1536140985-6058-2-git-send-email-hayashi.kunihiko@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed,  5 Sep 2018 18:49:44 +0900, Kunihiko Hayashi wrote:
> Add DT bindings for PHY interface built into PCIe controller implemented
> in UniPhier SoCs.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  .../devicetree/bindings/phy/uniphier-pcie-phy.txt  | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/uniphier-pcie-phy.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
