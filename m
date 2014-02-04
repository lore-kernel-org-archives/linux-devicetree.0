From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH v4 1/3] clocksource: timer-keystone: introduce clocksource
 driver for Keystone
Date: Tue, 4 Feb 2014 17:15:39 -0500
Message-ID: <52F1668B.9040507@ti.com>
References: <1391513453-21140-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1391513453-21140-2-git-send-email-ivan.khoronzhuk@ti.com>
 <alpine.DEB.2.02.1402041715220.24986@ionos.tec.linutronix.de>
 <52F11B5C.40407@ti.com>
 <alpine.DEB.2.02.1402042113270.24986@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.DEB.2.02.1402042113270.24986@ionos.tec.linutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, daniel.lezcano@linaro.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tuesday 04 February 2014 03:17 PM, Thomas Gleixner wrote:
> On Tue, 4 Feb 2014, Ivan Khoronzhuk wrote:
> 
> Please do not top post.
> 
>> It was so in v1. But it was decided to use explicit memory barriers,
>> because we're always sure the memory barriers are there and that
>> they're properly documented. Also in this case I don't need to add
>> keystone readl/writel relaxed function variants and to use mixed calls of
>> writel/writel_relaxed functions.
>>
>> See:
>> http://www.spinics.net/lists/arm-kernel/msg294941.html
> 
> Fair enough, but we want a proper explanation for explicit barriers in
> the code and not in some random discussion of patch version X on some
> random mailing list.
> 
> Aside of that it should be iowmb(), but I might miss something ...
> 
Agree. __iowmb() seems to be more appropriate.

Regards,
Santosh
