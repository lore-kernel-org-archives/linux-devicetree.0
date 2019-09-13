From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: arm: renesas: Convert 'renesas,
 prr' to json-schema
Date: Fri, 13 Sep 2019 13:02:08 +0100
Message-ID: <CAL_JsqLN66LK3=4K9dLtHWd=nOAJ7ofKH6TKp058gqOV32rj8g@mail.gmail.com>
References: <20190908120528.9392-1-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190908120528.9392-1-horms+renesas@verge.net.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Yoshihiro Kaneko <ykaneko0929@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 8, 2019 at 11:14 PM Simon Horman <horms+renesas@verge.net.au> wrote:
>
> Convert Renesas Product Register bindings documentation to json-schema.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on v5.3-rc1
> Tested using:
>   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/renesas,prr.yaml
>
> v2
> * Use simple enum for compat values
> * Drop "" from compat values
> * Only supply 'maxItems' property to 'reg'
> ---
>  .../devicetree/bindings/arm/renesas,prr.txt        | 20 -------------
>  .../devicetree/bindings/arm/renesas,prr.yaml       | 35 ++++++++++++++++++++++
>  2 files changed, 35 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
