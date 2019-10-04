From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 17/21] dt-bindings: marvell: Declare the CN913x SoC
 compatibles
Date: Fri, 4 Oct 2019 11:14:42 -0500
Message-ID: <CAL_JsqLQ+mfdDoTMiN8T3-0+LAv+rU=G6qVOvEcKb4beWGTWmw@mail.gmail.com>
References: <20191004142738.7370-1-miquel.raynal@bootlin.com>
 <20191004142738.7370-18-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191004142738.7370-18-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Yan Markman <ymarkman@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Stefan Chulski <stefanc@marvell.com>, Marcin Wojtas <mw@semihalf.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 4, 2019 at 9:28 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> From: Grzegorz Jaszczyk <jaz@semihalf.com>
>
> Describe the compatible properties for the new Marvell SoCs:
> * CN9130: 1x AP807-quad + 1x CP115 (1x embedded)
> * CN9131: 1x AP807-quad + 2x CP115 (1x embedded + 1x modular)
> * CN9132: 1x AP807-quad + 3x CP115 (1x embedded + 2x modular)
>
> CP115 are similar to CP110 in terms of features.
>
> There are three development boards based on these SoCs:
> * CN9130-DB: comes as a single mother board (with the CP115 bundled)
> * CN9131-DB: same as CN9130-DB with one additional modular CP115
> * CN9132-DB: same as CN9130-DB with two additional modular CP115
>
> Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/arm/marvell/armada-7k-8k.yaml    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
