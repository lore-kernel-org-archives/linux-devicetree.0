From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 2/4] dt-bindings: arm: fsl: add mu binding doc
Date: Wed, 20 Jun 2018 13:43:10 -0600
Message-ID: <20180620194310.GA28983@rob-hp-laptop>
References: <1529239789-26849-1-git-send-email-aisheng.dong@nxp.com>
 <1529239789-26849-3-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1529239789-26849-3-git-send-email-aisheng.dong@nxp.com>
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

On Sun, Jun 17, 2018 at 08:49:47PM +0800, Dong Aisheng wrote:
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
> v1->v2:
>  * typo fixes
>  * remove status property
>  * remove imx6&7 compatible string which may be added later for
>    the generic mailbox binding
> 
> Note: Because MU used by SCU is not implemented as a mailbox driver,
> Instead, they're provided in library calls to gain higher performance.

Using a binding doesn't mean you have to use an OS's subsystem.

What needs higher performance? What's the performance difference? Why 
can't the mailbox framework be improved?

> Futhermore, SCU MU has only one channel. But the binding doc claims
> (Change to allow 0?)
> So we did not follow the mailbox binding.
> 
> For the generic mailbox driver binding way, it may be added later.

The h/w isn't changing later, so no.

> ---
>  .../devicetree/bindings/arm/freescale/fsl,mu.txt   | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,mu.txt
