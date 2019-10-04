From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 16/21] dt-bindings: marvell: Convert the SoC
 compatibles description to YAML
Date: Fri, 4 Oct 2019 11:13:32 -0500
Message-ID: <CAL_JsqK4cbzOfaw5XCOdmP38w2n_djnJ6PaUTR=2Hi-rfOF=sg@mail.gmail.com>
References: <20191004142738.7370-1-miquel.raynal@bootlin.com>
 <20191004142738.7370-17-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191004142738.7370-17-miquel.raynal@bootlin.com>
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
> Convert the file detailing Marvell EBU compatibles to json-schema.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/arm/marvell/armada-7k-8k.txt     | 24 -----------
>  .../bindings/arm/marvell/armada-7k-8k.yaml    | 40 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
