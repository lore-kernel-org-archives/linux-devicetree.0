From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 2/5] dt-bindings: arm: fsl: add mu binding doc
Date: Wed, 11 Jul 2018 09:09:35 -0600
Message-ID: <20180711150935.GB27284@rob-hp-laptop>
References: <1531061817-1980-1-git-send-email-aisheng.dong@nxp.com>
 <1531061817-1980-3-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1531061817-1980-3-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, dongas86@gmail.com, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 08, 2018 at 10:56:54PM +0800, Dong Aisheng wrote:
> The Messaging Unit module enables two processors within
> the SoC to communicate and coordinate by passing messages
> (e.g. data, status and control) through the MU interface.
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> v3->v4:
>  * move into Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> v2->v3:
>  * change to mailbox binding
>    Currently mbox-cells has to be 0 for SCU MU.
>    Generic MU Mailbox support binding could be extended later.
> v1->v2:
>  * typo fixes
>  * remove status property
>  * remove imx6&7 compatible string which may be added later for
>    the generic mailbox binding
> ---
>  .../devicetree/bindings/mailbox/fsl,mu.txt         | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/fsl,mu.txt

Reviewed-by: Rob Herring <robh@kernel.org>
