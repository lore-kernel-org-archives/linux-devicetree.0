From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [Urgent PATCH] arm64: dts: uniphier: fix IRQ trigger type of
 ARMv8 timer
Date: Mon, 1 Aug 2016 09:18:41 +0100
Message-ID: <579F05E1.9020300@arm.com>
References: <1470039140-3801-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470039140-3801-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Please keep me cc-ed on this.

On 01/08/16 09:12, Masahiro Yamada wrote:
> Since commit 1e2a7d78499e ("irqdomain: Don't set type when mapping
> an IRQ"), the interrupt type is strictly checked.  Without this
> patch, this board would not boot any more.
> 
> Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
> says that the 3rd cell should be either 1 (edge) or 4 (level)
> depending on the trigger type.  As the CA72 Generic Timer provides
> active-low interrupts, the value of the 3rd cell should be 4.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Suggested-by: Marc Zyngier <marc.zyngier@arm.com>
> ---
> Arnd, Olof,
> 
> I guess you are about to send pull-reqs for v4.8 cycle.
> Could you include this one in them?
> After IRQ updates for 4.8 were merged, my board would not
> boot at all.  I consulted experts and looks like my DT
> was wrong.
> 
> I could do this after -rc1 is out because it is apparently a
> bug fix, but in that case the for-next branch in ASOC will be
> broken for me, which would make bisect-ability difficult for me.

I have a patch that addresses all platforms in one go (there is really
no point in fixing one at a time for a bug that is so widespread).

I'll repost it later today.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
