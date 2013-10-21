From: Maxime Bizon <mbizon@freebox.fr>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Mon, 21 Oct 2013 16:57:20 +0200
Message-ID: <1382367440.18145.28.camel@sakura.staff.proxad.net>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131020220839.GT2443@sirena.org.uk> <5264576F.6050307@wwwdotorg.org>
 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
 <20131021091555.GB21518@ulmo.nvidia.com>
Reply-To: mbizon@freebox.fr
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131021091555.GB21518@ulmo.nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "ksummit-2013-discuss@lists.linuxfoundation.org" <ksummit-2013-discuss@lists.linuxfoundation.org>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Pitre <nico@fluxnic.net>, Mark Brown <broonie@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


On Mon, 2013-10-21 at 11:15 +0200, Thierry Reding wrote:

> A stable ABI means there's about zero chance of redesigning something
> after it's been merged. Unless we want to live with having to support
> several DT bindings in a driver.
> 
That will happen for sure, and it will suffer from lack of testing of
"old" bindings, like every uncommon combinations supported by the kernel
today (think 32b userspace over 64b kernel).

Solution: always use latest DT shipped with kernel. 

> impossible to take into account every possible detail up front simply
> because we're all only human and because some things just might change
> over time. I'm fairly sure that Linux wouldn't be where it is today if
> we didn't have that flexibility.

Also, as you said in another mail, new roadblocks have appeared to reach
mainline, you now have to convince DT maintainers that your DT bindings
are correct / future proof.

IMO this will cause even more un-mainlined SOCs/boards, with the added
difficulty to integrate the existing proprietary bindings if someone
wants to mainline later.


-- 
Maxime
