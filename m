From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] ARM: CSR: Adding CSR SiRFprimaII board support
Date: Mon, 4 Jul 2011 16:53:50 +0200
Message-ID: <201107041653.50962.arnd@arndb.de>
References: <1309231954-23260-1-git-send-email-bs14@csr.com>
	<201107011819.43316.arnd@arndb.de>
	<CAGsJ_4yHrYRQKO7tMeJhjj_aEhV69xnJSZzuHhq8hnBrmnG+dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGsJ_4yHrYRQKO7tMeJhjj_aEhV69xnJSZzuHhq8hnBrmnG+dg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Barry Song <21cnbao@gmail.com>
Cc: linux@arm.linux.org.uk, devicetree-discuss@lists.ozlabs.org, workgroup.linux@csr.com, Grant Likely <grant.likely@secretlab.ca>, weizeng.he@csr.com, Olof Johansson <olof@lixom.net>, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 04 July 2011, Barry Song wrote:
> Great idea. in fact there is only one reset bit for every device. So
> maybe the rstc.c can be
> ...

Yes, looks good.

>         /*
>          * Writing 1 to this bit resets corresponding block.
>          * Writing 0 to this bit de-asserts reset signal of
>          * the corresponding block.
>          */
>         writel(sirfsoc_rstc_base + (reset_bit / 32) * 4,
>                 readl(sirfsoc_rstc_base + (reset_bit / 32) * 4) | reset_bit);
>         msleep(10);
>         writel(sirfsoc_rstc_base + (reset_bit / 32) * 4,
>                 readl(sirfsoc_rstc_base + (reset_bit / 32) * 4) & ~reset_bit);

One remark about the msleep here: I find arbitrary wait periods a
bit unclean, and most hardware allows you to poll whether it's
done by reading back the register you have just written.

If your hardware can do that, you can replace the msleep() with a
single readl or a readl()/msleep(1) loop?

	Arnd
