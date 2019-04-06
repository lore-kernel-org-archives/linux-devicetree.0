From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: add TQ boards
Date: Sat, 06 Apr 2019 01:06:55 -0500
Message-ID: <5ca84201.1c69fb81.28eb1.32e8@mx.google.com>
References: <20190304165630.18225-1-bruno.thomsen@gmail.com>
 <20190403064427.30041-1-bruno.thomsen@gmail.com>
 <20190403064427.30041-3-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190403064427.30041-3-bruno.thomsen@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: markus.niebel@tq-group.com, devicetree@vger.kernel.org, laa@kamstrup.com, festevam@gmail.com, s.hauer@pengutronix.de, clemens.ml@gmx.net, bruno.thomsen@gmail.com, bth@kamstrup.com, ksc@kamstrup.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed,  3 Apr 2019 08:44:24 +0200, Bruno Thomsen wrote:
> MBa is a series of Carrier Boards / Single Board Computers (SBC) for
> evaluation of TQMa SoMs.
> The MBa7 carrier board can only interface with TQMa7 modules.
> The TQMa7 module can only be mounted with NXP i.MX7 Solo or Dual SoCs.
> Primary compatible strings are of the form "tq,<SoC>-<SBC>".
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
> ---
> v2:
> - Patch v1 2/6 and 3/6 has been merged as they both modify the new fsl.yaml.
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
