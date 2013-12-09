From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 3/6] ARM: at91/dt: define sama5d3 clocks
Date: Mon, 9 Dec 2013 16:48:13 +0100
Message-ID: <201312091648.13802.arnd@arndb.de>
References: <1385650171-8756-1-git-send-email-b.brezillon@overkiz.com>
 <201312090309.23723.arnd@arndb.de> <52A582AB.6010504@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <52A582AB.6010504@overkiz.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: boris brezillon <b.brezillon@overkiz.com>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 09 December 2013, boris brezillon wrote:
> > You are adding "clock-names" properties in a lot of cases. Are you sure you
> > are using the strings that are documented in the respective device bindings
> > for each name? In a lot of cases, drivers just want an anonymous clock
> > and we don't name them.
> 
> I rechecked it, and almost all drivers call [devm_]clk_get with a 
> specific clock
> name, and as a result we must specify the "clock-names" property.
> The only exceptions I found are the spi and PIT (Periodic Interval 
> Timer) drivers,
> and "clock-names" property is not defined in these nodes.

Yes, I understood that the *drivers* use the names, but are they actually
documented in the device bindings? If not, it might be better to change the
drivers.

	Arnd
