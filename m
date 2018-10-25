From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 3/4] dt-bindings: soc: Add TmFifo binding for Mellanox
 BlueField SoC
Date: Thu, 25 Oct 2018 17:32:35 +0200
Message-ID: <CAK8P3a1K7BjgZRyBMKFrqWfcr-Bb3HQus+QE7qTpd27voE9e0A@mail.gmail.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1540403734-137721-1-git-send-email-lsun@mellanox.com>
 <1540403734-137721-3-git-send-email-lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1540403734-137721-3-git-send-email-lsun@mellanox.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Liming Sun <lsun@mellanox.com>
Cc: devicetree@vger.kernel.org, David Woods <dwoods@mellanox.com>, arm-soc <arm@kernel.org>, Olof Johansson <olof@lixom.net>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 10/24/18, Liming Sun <lsun@mellanox.com> wrote:
> Add devicetree bindings for the TmFifo which is found on Mellanox
> BlueField SoCs.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: David Woods <dwoods@mellanox.com>
> Signed-off-by: Liming Sun <lsun@mellanox.com>
> ---
>  .../devicetree/bindings/soc/mellanox/tmfifo.txt    | 23
> ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt
>
> diff --git a/Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt
> b/Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt
> new file mode 100644
> index 0000000..8a13fa6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt
> @@ -0,0 +1,23 @@
> +* Mellanox BlueField SoC TmFifo
> +
> +BlueField TmFifo provides a shared FIFO between the target and the
> +external host machine, which can be accessed by external host via
> +USB or PCIe. In the current tmfifo driver, this FIFO has been demuxed
> +to implement virtual console and network interface based on the virtio
> +framework.
> +
> +Required properties:
> +
> +- compatible:	Should be "mellanox,bf-tmfifo"
> +- reg:		Physical base address and length of Rx/Tx block
> +- interrupts:	The interrupt number of Rx low water mark, Rx high water
> mark
> +		Tx low water mark, Tx high water mark respectively.


This sounds like it might fit into the mailbox subsystem, and perhaps
it should use the mailbox DT bindings. Have you had a look at that?

       Arnd
