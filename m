From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dts: mfd: axp20x: Add "xpowers,master-mode"
 property for AXP806 PMICs
Date: Mon, 27 Feb 2017 17:00:44 -0600
Message-ID: <20170227230044.zjql2zlvjhsjdbpg@rob-hp-laptop>
References: <cover.1487791328.git.rask@formelder.dk>
 <396866a490b6056c60e93d862656bb90daedab98.1487791328.git.rask@formelder.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <396866a490b6056c60e93d862656bb90daedab98.1487791328.git.rask@formelder.dk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rask Ingemann Lambertsen <rask@formelder.dk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 22, 2017 at 08:41:02PM +0100, Rask Ingemann Lambertsen wrote:
> commit b101829a029a ("mfd: axp20x: Fix AXP806 access errors on cold boot")
> was intended to fix the case where a board uses an AXP806 in slave mode,
> but the boot loader leaves it in master mode for lack of AXP806 support.
> But now the driver breaks on boards where the PMIC is operating in master
> mode. To let the device tree describe which mode of operation is needed,
> this patch introduces a new property "xpowers,master-mode".
> 
> Fixes: 204ae2963e10 ("mfd: axp20x: Add bindings for AXP806 PMIC")
> Signed-off-by: Rask Ingemann Lambertsen <rask@formelder.dk>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> ---
> Changes from v1 to v2:
> Changed the commit message such that Fixes: points to the commit which
> introduced the bindings for the AXP806 because the property should have been
> included from the beginning of the AXP806 support.
> 
>  Documentation/devicetree/bindings/mfd/axp20x.txt | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
