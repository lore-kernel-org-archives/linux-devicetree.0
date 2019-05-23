From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] net/macb: bindings doc: add sifive fu540-c000 binding
Date: Thu, 23 May 2019 15:50:27 -0500
Message-ID: <CAL_Jsq+p5PnTDgxuh9_Aw1RvTk4aTYjKxyMq7DPczLzQVv8_ew@mail.gmail.com>
References: <1558611952-13295-1-git-send-email-yash.shah@sifive.com>
 <1558611952-13295-2-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <1558611952-13295-2-git-send-email-yash.shah@sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Yash Shah <yash.shah@sifive.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, netdev <netdev@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sachin Ghadi <sachin.ghadi@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>, linux-riscv@lists.infradead.org, David Miller <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 6:46 AM Yash Shah <yash.shah@sifive.com> wrote:
>
> Add the compatibility string documentation for SiFive FU540-C0000
> interface.
> On the FU540, this driver also needs to read and write registers in a
> management IP block that monitors or drives boundary signals for the
> GEMGXL IP block that are not directly mapped to GEMGXL registers.
> Therefore, add additional range to "reg" property for SiFive GEMGXL
> management IP registers.
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/net/macb.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bindings/net/macb.txt
> index 9c5e944..91a2a66 100644
> --- a/Documentation/devicetree/bindings/net/macb.txt
> +++ b/Documentation/devicetree/bindings/net/macb.txt
> @@ -4,6 +4,7 @@ Required properties:
>  - compatible: Should be "cdns,[<chip>-]{macb|gem}"
>    Use "cdns,at91rm9200-emac" Atmel at91rm9200 SoC.
>    Use "cdns,at91sam9260-macb" for Atmel at91sam9 SoCs.
> +  Use "cdns,fu540-macb" for SiFive FU540-C000 SoC.

This pattern that Atmel started isn't really correct. The vendor
prefix here should be sifive. 'cdns' would be appropriate for a
fallback.

>    Use "cdns,sam9x60-macb" for Microchip sam9x60 SoC.
>    Use "cdns,np4-macb" for NP4 SoC devices.
>    Use "cdns,at32ap7000-macb" for other 10/100 usage or use the generic form: "cdns,macb".
> @@ -17,6 +18,8 @@ Required properties:
>    Use "cdns,zynqmp-gem" for Zynq Ultrascale+ MPSoC.
>    Or the generic form: "cdns,emac".
>  - reg: Address and length of the register set for the device
> +       For "cdns,fu540-macb", second range is required to specify the
> +       address and length of the registers for GEMGXL Management block.
>  - interrupts: Should contain macb interrupt
>  - phy-mode: See ethernet.txt file in the same directory.
>  - clock-names: Tuple listing input clock names.
> --
> 1.9.1
>
