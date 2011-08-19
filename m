From: David Miller <davem@davemloft.net>
Subject: Re: of_iomap() matched with plan iounmap()
Date: Fri, 19 Aug 2011 06:26:09 -0700 (PDT)
Message-ID: <20110819.062609.1865751197015675220.davem@davemloft.net>
References: <20110818170226.GA16721@huya.qualcomm.com>
	<20110818.203447.462383652600224162.davem@davemloft.net>
	<201108191426.19152.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201108191426.19152.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de
Cc: davidb@codeaurora.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 19 Aug 2011 14:26:18 +0200

> We could of course change all existing users of of_iounmap on sparc to use
> the simpler prototype, because it also just calls iounmap.

Check again, on sparc64 it needs the resource to release it.

Only the 32-bit version on sparc evaluates to just a plain iounmap().
