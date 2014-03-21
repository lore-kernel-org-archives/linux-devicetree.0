From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH 0/2] ARM: berlin: SMP support
Date: Fri, 21 Mar 2014 11:14:57 +0800
Message-ID: <20140321111457.6bed5091@xhacker>
References: <1395347986-30203-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1395347986-30203-1-git-send-email-sebastian.hesselbarth@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Antoine Tenart <antoine.tenart@free-electrons.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 20 Mar 2014 13:39:44 -0700
Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> wrote:

> This is a small patch set for SMP support on Marvell Berlin BG2
> and recently provided BG2Q. Nothing spectacular, as it basically
> copies SMP holding pen mechanism from mach-prima2 and plat-versatile
> with minor Berlin specific code for SCU and general purpose registers
> used by secondary CPUs to get their boot address.
> 
> There was some IRC discussion with Alexandre about using
> scu_get_base() instead of a DT node. Although BG2Q is true A9
> and provides SCU base; BG2 with PJ4b does not and I decided to
> depend on a DT node for SCU in both cases, which is fine I guess.
> 
> I tested this on BG2, and BG2CD (which is UP). I expect the
> Free-Electrons guys to test on BG2Q.

Although BG2Q and future SoCs will go through PSCI code path finally. But
currently, it's OK to use the pen mechanism.

So for both of these two patches, 

Acked-by: Jisheng Zhang <jszhang@marvell.com>

Thanks,
Jisheng
