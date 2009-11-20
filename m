From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC PATCH 1/5] Rework OpenFirmware GPIO handling
Date: Fri, 20 Nov 2009 13:37:18 -0700
Message-ID: <fa686aa40911201237y4a41dd63wee3fb4e0a5858e87@mail.gmail.com>
References: <1258472546-31343-1-git-send-email-dbaryshkov@gmail.com>
	<1258472546-31343-2-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1258472546-31343-2-git-send-email-dbaryshkov@gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>, David Brownell <dbrownell@users.sourceforge.net>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 17, 2009 at 8:42 AM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> This patch improves OF GPIO bindings so, that most non-OF-specific gpio
> controllers don't need to call any of OF binding function:
>
> 0) Move of_gpio_chip into main gpio_chip structure.
> 1) Call of_gpio_init/destroy from gpiochip_add/remove.
> 2) By default supply reasonable defaults for gpio_cells/xlate

I think this change approaches the problem from the wrong way around.
It is not appropriate to try and build OF hooks into gpiolib. gpiolib
should be completely agnostic to any layers around them used to get
data about how they are configured up.  If anything, OF helpers should
wrap around the gpiolib functions so that drivers can use them if it
is useful to do so.

g.
