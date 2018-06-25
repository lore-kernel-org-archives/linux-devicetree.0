From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] arm: dts: pxa3xx: provide correct clk-names property for
 nand controller node
Date: Mon, 25 Jun 2018 22:18:03 +0200
Message-ID: <87po0emxhg.fsf@belgarion.home>
References: <20180624174205.20648-1-daniel@zonque.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180624174205.20648-1-daniel@zonque.org> (Daniel Mack's message
 of "Sun, 24 Jun 2018 19:42:05 +0200")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Mack <daniel@zonque.org>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, haojian.zhuang@gmail.com
List-Id: devicetree@vger.kernel.org

Daniel Mack <daniel@zonque.org> writes:

> The NAND driver looks for a clock named "core" and falls back to a pdev
> clock that has a wrong rate if not set.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
Applied to pxa/dt with a small "line swap", ie. clock-names is one line below
"clocks" line.

Cheers.

-- 
Robert
