From: Christian Engelmayer <christian.engelmayer@frequentis.com>
Subject: Re: [RFC] Configure GPIO settings via the device tree
Date: Thu, 19 Jul 2012 10:39:17 +0200
Message-ID: <20120719103917.78e01091@frequentis.com>
References: <20120713100440.7a80e05f@frequentis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20120713100440.7a80e05f@frequentis.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: grant.likely@secretlab.ca, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org
Cc: linuxppc-dev@lists.ozlabs.org, christian.engelmayer@frequentis.com
List-Id: devicetree@vger.kernel.org

Hello,

As there was no response to my question I assume that I see it correctly
that at the moment the only 2 options for setting up GPIO configurations
is either via platform-specific code by eg. platform_data or via userspace?

Would there be a common use of defining GPIO configurations via a device
tree and applying those settings via a generic, platform-unaware driver?

Regards,
Christian


On Fri, 13 Jul 2012 10:04:40 +0200
Christian Engelmayer <christian.engelmayer@frequentis.com> wrote:

> Hello,
> 
> I am looking for a way to configure GPIO initial settings and exports to the
> userspace via Sysfs in a generic way via a device tree.
> 
> The purpose would be to have the same features as when initializing and
> exporting pins via platform code, eg.
> 
> 	static struct gpio leds_gpios[] = {
> 		{ 32, GPIOF_OUT_INIT_HIGH, "Power LED" }, /* default to ON */
> 		{ 33, GPIOF_OUT_INIT_LOW,  "Green LED" }, /* default to OFF */
> 		{ 34, GPIOF_OUT_INIT_LOW,  "Red LED"   }, /* default to OFF */
> 		{ 35, GPIOF_OUT_INIT_LOW,  "Blue LED"  }, /* default to OFF */
> 		{ ... },
> 	};
> 
> ,however, with no need for the kernel to know anything more about those pins
> and their later handling by simple userpsace drivers than the setup information
> provided in the device tree.
> 
> This should also attack the problem of unstable GPIO numbers in the case of
> daughtercards on different base boards and would help provide a defined API
> to the userspace based on pin labels with the board specifics hidden in one
> place in the device tree.
> 
> Is there already a way for realizing such a scenario ?
> 
> Regards,
> Christian
