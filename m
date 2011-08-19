From: David Miller <davem@davemloft.net>
Subject: Re: of_iomap() matched with plan iounmap()
Date: Thu, 18 Aug 2011 20:34:47 -0700 (PDT)
Message-ID: <20110818.203447.462383652600224162.davem@davemloft.net>
References: <20110818170226.GA16721@huya.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110818170226.GA16721@huya.qualcomm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: davidb@codeaurora.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: David Brown <davidb@codeaurora.org>
Date: Thu, 18 Aug 2011 10:02:26 -0700

> The SPARC target contains of_ioremap() and of_iounmap(), which various
> drivers use (generally inside of CONFIG_SBUS).
> 
> include/linux/of_address.h contains a definition for of_iomap(), but
> not corresponding unmap call.  Code using this calls the regular
> iounmap().
> 
> Is it safe to assume that of_iomap() will always be based on ioremap()
> and therefore it is safe to use iounmap(), or would it be better to
> define another name for drivers to use as the inverse of of_iomap().
> I'm not sure what to call it, since of_iounmap() is already taken by
> SPARC.

It's better to define a matching of_iounmap() interface, even if for
now it is exactly iounmap()
