From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCHv2 02/10] ARM: vic: MULTI_IRQ_HANDLER handler
Date: Thu, 3 Nov 2011 09:49:55 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1111030935060.3307@xanadu.home>
References: <1317206507-18867-1-git-send-email-jamie@jamieiles.com>
	<1317206507-18867-3-git-send-email-jamie@jamieiles.com>
	<20110928203905.GB2838@ponder.secretlab.ca>
	<CACRpkdZKns-GraGp-YMD6jzOPETkvEpt9bC8HcYUmf3JUyCV3A@mail.gmail.com>
	<20110929093009.GM17204@pulham.picochip.com>
	<20111102134024.GE19187@n2100.arm.linux.org.uk>
	<20111102140811.GA22491@totoro>
	<CACRpkdY+EBkHfupO5T4SYKPxzX2L2kr8fLVMJK=JctNeYAzn2g@mail.gmail.com>
	<20111103125136.GL12913@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20111103125136.GL12913@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: kgene.kim@samsung.com, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, rmallon@gmail.com, rob.herring@calxeda.com, hsweeten@visionengravers.com, rajeev-dlh.kumar@st.com, ben-linux@fluff.org, STEricsson_nomadik_linux@list.st.com, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, rubini@unipv.it
List-Id: devicetree@vger.kernel.org

On Thu, 3 Nov 2011, Russell King - ARM Linux wrote:

> 	stat = readl_relaxed(vic->base + VIC_IRQ_STATUS);
> 	while (stat) {
> 		while (stat) {
> 			irq = ffs(stat) - 1;
> 			stat &= ~(1 << irq);
> 			handle_irq(irq);
> 		}
> 		stat = readl_relaxed(vic->base + VIC_IRQ_STATUS);
> 	}

The inner loop could be a do { } while() construct to avoid evaluating 
stat twice on each outer loop itteration.  Maybe gcc is smart enough to 
notice though, maybe not.


Nicolas
