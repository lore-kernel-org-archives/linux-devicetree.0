From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v2 1/2] fsl: Add binding for RCPM
Date: Tue, 15 Sep 2015 18:56:38 -0500
Message-ID: <1442361398.2909.164.camel@freescale.com>
References: <1442307339-15225-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1442307339-15225-1-git-send-email-dongsheng.wang@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dongsheng Wang <dongsheng.wang@freescale.com>
Cc: devicetree@vger.kernel.org, Chenhui Zhao <chenhui.zhao@freescale.com>, alison.wang@freescale.com, Tang Yuantian <Yuantian.Tang@freescale.com>, robh+dt@kernel.org, jason.jin@freescale.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-09-15 at 16:55 +0800, Dongsheng Wang wrote:
> +* Freescale RCPM Wakeup Source Device Tree Bindings
> +-------------------------------------------
> +Required rcpm-wakeup property should be added to a device node if the 
> device
> +can be used as a wakeup source.
> +
> +  - rcpm-wakeup: The value of the property consists of 3 cells. The first 
> cell
> +     is a pointer to the rcpm node, the second cell is the bit mask that
> +     should be set in IPPDEXPCR0, and the last cell is for IPPDEXPCR1.
> +     Note: If the platform has no IPPDEXPCR1 register, put a zero here.

What if a future platform has more than two of these registers?

-Scott
