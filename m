From: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: RE: [PATCH v4 00/10] Add PWM framework and device tree support.
Date: Wed, 14 Mar 2012 18:19:50 -0500
Message-ID: <ADE657CA350FB648AAC2C43247A983F0020695DB5858@AUSP01VMBX24.collaborationhost.net>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@avionic-design.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
Cc: Ryan Mallon <rmallon@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, March 14, 2012 8:56 AM, Thierry Reding wrote:
> 
> This patch series adds very rudimentary device-tree support for PWM
> devices. With all of these patches applied (plus one board-specific
> patch that is not included), I'm able to control the backlight on the
> device I'm working on using the sysfs interface provided by the pwm-bl
> driver and the backlight class.

Hello Thierry,

Are you planning on adding a sysfs interface for generic userspace access
to the PWM devices?

I have tested your patches (with a couple fixes already mentioned) on a
ep93xx board and have converted the drivers/misc/ep93xx_pwm.c driver
to use the framework.  Everything "seems" to work but my use for the
PWM is from userspace so I can't really test anything.

I have hacked in the sysfs interface from the ep93xx_pwm driver but it
is a hack... It's not really using the framework to control the PWM since
all the sysfs knobs are directly accessing the pwm registers.

Anyway, I would be happy to convert the current driver to the new framework
and get it out of drivers/misc and into a proper location. But, before I can do
that, I need to be able to control the PWM from userspace somehow.

Maybe an interface similar to the one gpiolib provides with CONFIG_GPIO_SYSFS?

Regards,
Hartley
