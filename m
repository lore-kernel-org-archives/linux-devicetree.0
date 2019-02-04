From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 15/17 v1] ARM: ixp4xx: Add DT bindings
Date: Mon, 4 Feb 2019 09:16:08 -0600
Message-ID: <CAL_JsqKEWtDN0VYwZaJqajcvomptbML_rQeBavh_kCYeVFZSPQ@mail.gmail.com>
References: <20190203214205.13594-1-linus.walleij@linaro.org>
 <20190203214205.13594-16-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190203214205.13594-16-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tim Harvey <tharvey@gateworks.com>, Krzysztof Halasa <khalasa@piap.pl>, Olof Johansson <olof@lixom.net>, Imre Kaloz <kaloz@openwrt.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 3, 2019 at 3:42 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds initial device tree bindings for the IXP4xx machines.
> This time I tried something wild and crazy and try to make proper
> JSON-style YAML bindings for the top level.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> I have no clear idea on how to auto-test this schema for validity,
> since it is a bit of a new thing I hope to figure it out as
> we go.

Is Documentation/devicetree/writing-schema.md missing something on how to?

The DT patchwork instance will have test results too, but in this case
it couldn't apply the patch since MAINTAINERS has a dependency...

> ---
>  .../devicetree/bindings/arm/intel-ixp4xx.yaml | 22 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml

In any case, the manual checker thinks this looks fine.

Reviewed-by: Rob Herring <robh@kernel.org>
