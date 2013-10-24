From: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 12:22:18 -0000
Message-ID: <f20013b8c402dacccd865d143e14a3ee.squirrel@twosheds.infradead.org>
References: <20131020220839.GT2443@sirena.org.uk>
 <5264576F.6050307@wwwdotorg.org>
 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
 <52658EBC.8020800@wwwdotorg.org>
 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
 <20131022093923.GC15640@ulmo.nvidia.com> <20131022150426.GF29341@beef>
 <20131022171346.GE4061@obsidianresearch.com>
 <20131023080630.GA14413@netboy>
 <20131023172955.GA17145@obsidianresearch.com>
 <20131023174458.GC5208@netboy>
 <1382553982.31058.10.camel@sakura.staff.proxad.net>
 <20131024095232.27BBCC4039D@trevor.secretlab.ca>
 <1382614439.6040.16.camel@sakura.staff.proxad.net>
 <1382615278.8522.72.camel@shinybook.infradead.org>
 <1382616801.6040.26.camel@sakura.staff.proxad.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1382616801.6040.26.camel@sakura.staff.proxad.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mbizon@freebox.fr
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "ksummit-2013-discuss@lists.linuxfoundation.org" <ksummit-2013-discuss@lists.linuxfoundation.org>, Nicolas Pitre <nico@fluxnic.net>, Grant Likely <grant.likely@secretlab.ca>, Thierry Reding <thierry.reding@gmail.com>, Matt Porter <matt.porter@linaro.org>, David Woodhouse <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
List-Id: devicetree@vger.kernel.org


>
> On Thu, 2013-10-24 at 12:47 +0100, David Woodhouse wrote:
>
>> If you can automatically infer the correct clock/interrupt/etc in order
>> to do DMA correctly, despite the fact that it wasn't explicitly spelled
>> out in the old DT, then the property is *not* a "required" property.
>> It's optional, and you have a default behaviour for when it's not
>> present.
>
> so inside the new version of driver-hwcrypto.c:
>
> if (irq_of_parse_and_map(...) == NO_IRQ) {
> 	switch (get_soc_model()) {
> 		case SOC1:
> 			irq = 51;
> 			break;
>
> 		case SOC2:
> 			irq = 62;
> 			break;
>
> 		[...]
> 	}
> }


If you are correct to insist that DMA needs yo be supported in the new
driver *even* with old firmware, then yes, maybe.

The alternative is a quirk to "fix" the DT up on the affected boards and
not actually doing the special cases in the driver itself. But that can be
seen as an implementation detail.

-- 
dwmw2
