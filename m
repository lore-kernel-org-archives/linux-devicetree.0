From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v10] reset: Add driver for gpio-controlled reset pins
Date: Mon, 05 Aug 2013 11:24:07 -0600
Message-ID: <51FFDFB7.6080806@wwwdotorg.org>
References: <1374139586-6344-1-git-send-email-p.zabel@pengutronix.de>
 <20130802092823.GA2884@e106331-lin.cambridge.arm.com>
 <1375687936.4000.21.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1375687936.4000.21.camel@pizza.hi.pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>, Mike Turquette <mturquette@linaro.org>, Fabio Estevam <fabio.estevam@freescale.com>, Len Brown <len.brown@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, Pavel Machek <pavel@ucw.cz>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

On 08/05/2013 01:32 AM, Philipp Zabel wrote:
> Am Freitag, den 02.08.2013, 10:28 +0100 schrieb Mark Rutland:
>> On Thu, Jul 18, 2013 at 10:26:26AM +0100, Philipp Zabel wrote:
>>> This driver implements a reset controller device that toggle a gpio
>>> connected to a reset pin of a peripheral IC. The delay between assertion
>>> and de-assertion of the reset signal can be configured via device tree.
...
>> I think this should look more like the below:
>>
>> /* Device with nRESET pin connected to GPIO5_0 */
>> sii902x@39 {
>> 	/* named for the actual input line */
>> 	nreset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
>> 	/* 
>> 	 * If there's some configurable property relating to the reset
>> 	 * line, we can describe it
>> 	 */
>> 	vendor,some-optional-reset-gpio-property;
>> 	...
>> };
> 
> I don't like the arbitrary name, as that makes it difficult to handle
> this in an automated way. In this case I'd prefer to use 'reset-gpios'
> and optionally 'reset-gpio-names' analogous to how clocks and interrupts
> (and resets) are handled.

Hmm. Just be aware that you can't force existing bindings to be
retro-actively modified, or you'll break the DT ABI. So, at the very
least we'd have to allow the existing custom-property-based approach for
bindings where it's already been used.
