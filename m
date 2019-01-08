From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] ARM: dts: at91: replace gpio-key,wakeup with
 wakeup-source property
Date: Tue, 8 Jan 2019 19:13:40 +0100
Message-ID: <20190108181340.GD10218@piout.net>
References: <20181221181149.6708-1-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181221181149.6708-1-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 21/12/2018 18:11:49+0000, Sudeep Holla wrote:
> Most of the legacy "gpio-key,wakeup" property are already replaced
> with "wakeup-source". However few occurrences of old property has
> popped up again, probably from the remnants in downstream trees.
> Almost all of those were remove couple of years back.
> 
> Replace the legacy properties with the unified "wakeup-source"
> property introduced in the commit 700a38b27eef ("Input: gpio_keys -
> switch to using generic device properties")
> 
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 2 +-
>  arch/arm/boot/dts/at91-wb45n.dts            | 2 +-
>  arch/arm/boot/dts/at91-wb50n.dts            | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
