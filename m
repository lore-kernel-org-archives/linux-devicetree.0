From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v10] reset: Add driver for gpio-controlled reset pins
Date: Tue, 6 Aug 2013 10:38:31 +0300
Message-ID: <5200A7F7.6080104@ti.com>
References: <1374139586-6344-1-git-send-email-p.zabel@pengutronix.de>
 <20130802092823.GA2884@e106331-lin.cambridge.arm.com>
 <1375687936.4000.21.camel@pizza.hi.pengutronix.de>
 <20130805153516.GC13091@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130805153516.GC13091@e106331-lin.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <fabio.estevam@freescale.com>, Mike Turquette <mturquette@linaro.org>, Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, Philipp Zabel <p.zabel@pengutronix.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 08/05/2013 06:35 PM, Mark Rutland wrote:
> On Mon, Aug 05, 2013 at 08:32:16AM +0100, Philipp Zabel wrote:
>> Hi Mark,
> 
> Hi Philipp,
> 
>>
>> Am Freitag, den 02.08.2013, 10:28 +0100 schrieb Mark Rutland:

> 
> I'm not sure about initially-in-reset. Is it not possible for the driver
> to poke the GPIO controller to ensure the GPIOs are in the state
> required?

We need initially-in-reset, so that the device can be kept in reset even
when the device driver is not available or loaded late in the boot cycle.

cheers,
-roger
