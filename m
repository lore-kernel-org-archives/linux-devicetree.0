From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 29/31 v4] soc: ixp4xx: qmgr: Add DT bindings for IXP4xx
 qmgr
Date: Wed, 17 Apr 2019 20:36:26 -0500
Message-ID: <CAL_JsqJpU_XuRzGbqSnSWqE8we=LUjiQqTd27XZdXnSkAHWD5Q@mail.gmail.com>
References: <20190417180621.2818-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190417180621.2818-1-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 17, 2019 at 1:07 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds device tree bindings for the Intel IXP4xx AHB
> Queue Manager.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Drop #queue-cells and just use a fixed resource size.
> ChangeLog v2->v3:
> - Rebased on v5.1-rc1
> - Drop oneOf in compatible, just list items.
> - Drop description on reg, just use maxItems: 1
> - Set '#queue-cells' as required
> ---
>  .../misc/intel,ixp4xx-queue-manager.yaml      | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
