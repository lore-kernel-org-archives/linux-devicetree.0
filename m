From: Arnd Bergmann <arnd.bergmann@linaro.org>
Subject: Re: [PATCH] Initial Device Tree system for Snowball
Date: Sat, 3 Mar 2012 02:09:51 +0000
Message-ID: <201203030209.51767.arnd.bergmann@linaro.org>
References: <1330703567-17925-1-git-send-email-niklas.hernaeus@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1330703567-17925-1-git-send-email-niklas.hernaeus@stericsson.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Niklas Hernaeus <niklas.hernaeus@linaro.org>, linaro-kernel@lists.linaro.org, devicetree-discuss@lists.ozlabs.org, Thomas Espersson <thomas.espersson@stericsson.com>, Lee Jones <lee.jones@linaro.org>, Niklas Hernaeus <niklas.hernaeus@stericsson.com>
List-Id: devicetree@vger.kernel.org

On Friday 02 March 2012, Niklas Hernaeus wrote:
> 
> From: Niklas Hernaeus <niklas.hernaeus@linaro.org>
> 
> This is the base system for using Device Tree for Snowball.
> The new boardfile is a slightly modified copy of the original board file,
> so new Device Tree stuff can simply be added and code removed, while
> functionality stays the same.

I realized that this series is based on a version before Lee's patches
to add the soc information, and things have changed quite a bit with that.

I've played a bit more with this and tried to merge the two, the result
is a series in the testing/ux500/dt branch of arm-soc.git. I'm sure it's not
actually all correct, but I've tried my best there and also added quite
a bit of device tree source for illustration. Maybe the two of you can
have a look there and see what you can make of it.

	Arnd
