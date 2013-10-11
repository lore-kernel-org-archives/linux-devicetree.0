From: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH 3/8] ARM: l2x0: add Marvell Tauros3 compatible
Date: Fri, 11 Oct 2013 11:05:32 +0200
Message-ID: <20131011090532.GU633@wantstofly.org>
References: <1381235073-17134-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1381235073-17134-4-git-send-email-sebastian.hesselbarth@gmail.com>
 <20131008134100.GD1412@e106331-lin.cambridge.arm.com>
 <52542D64.5010800@gmail.com> <525433D3.2090906@free-electrons.com>
 <20131009085026.GD4981@e106331-lin.cambridge.arm.com>
 <5255AE12.2000205@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5255AE12.2000205@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jisheng Zhang <jszhang@marvell.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 09, 2013 at 09:27:14PM +0200, Sebastian Hesselbarth wrote:

> >>>>>This add a compatible for the Marvell Tauros3 cache controller which
> >>>>>is compatible with l2x0 cache controllers. While updating the binding
> >>>>>documentation, clean up the list of possible compatibles.
> >>>>>
> >>>>>Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> >>>>>---
> 
> Added Jisheng and Lennert to Cc.
> 
> Lennert, while looking for differences between ARM PL310 and
> Marvell Tauros3 cache controller in a GPL'ed 2.6 kernel source
> from Asus, I found arch/arm/mm/cache-tauros3.c which states you
> as the original author. If that is wrong, please ignore this.

I'm the original author of cache-tauros2.c, but I've never heard of
Tauros3, and my name probably ended up in there via cp(1).
