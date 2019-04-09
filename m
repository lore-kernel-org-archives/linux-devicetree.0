From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 27/31 v3] soc: ixp4xx: Add DT bindings for IXP4xx NPE
Date: Tue, 9 Apr 2019 08:44:02 -0500
Message-ID: <CAL_JsqJ95+nivX+nKjgwHjxFOL12xMqaj0YET+tkr+JAx=DgHA@mail.gmail.com>
References: <20190408062831.16422-1-linus.walleij@linaro.org>
 <20190408062831.16422-28-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190408062831.16422-28-linus.walleij@linaro.org>
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

On Mon, Apr 8, 2019 at 1:29 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds DT bindings for the Intel IXP4xx Network Processing
> Engine (NPE). These are three firmware-executing units found in
> the IXP4xx SoC. These bindings use YAML.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Rebased on v5.1-rc1
> ---
>  ...ntel,ixp4xx-network-processing-engine.yaml | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/intel,ixp4xx-network-processing-engine.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
