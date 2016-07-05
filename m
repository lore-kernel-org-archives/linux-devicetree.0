From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2] xen/arm: register clocks used by the hypervisor
Date: Tue, 5 Jul 2016 14:54:34 +0100
Message-ID: <577BBC1A.8020209@arm.com>
References: <1467282752-14053-1-git-send-email-dirk.behme@de.bosch.com>
 <alpine.DEB.2.10.1607051449370.2575@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.DEB.2.10.1607051449370.2575@sstabellini-ThinkPad-X260>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefano Stabellini <sstabellini@kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, xen-devel@lists.xenproject.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 05/07/16 14:53, Stefano Stabellini wrote:
> On Thu, 30 Jun 2016, Dirk Behme wrote:
>> +- clocks: one or more clocks to be registered.
>> +  Xen hypervisor drivers might replace native drivers, resulting in
>> +  clocks not registered by these native drivers. To avoid that these
>> +  unregistered clocks are disabled, then, e.g. by clk_disable_unused(),
>> +  register them in the hypervisor node.
>> +  An example for this are the clocks of the serial driver. If the clocks
>> +  used by the serial hardware interface are not registered by the serial
>> +  driver the serial output might stop once clk_disable_unused() is called.
>
> What if we use the "status" property of the clocks? Could we set it to
> "disabled" in Xen? Would that be enough for Linux to leave them alone?

clocks could be shared between multiple devices. So it is not possible 
to disable the clock.

-- 
Julien Grall
