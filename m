From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 0/2] Introduce AEMIF driver for Davinci/Keystone archs
Date: Tue, 18 Feb 2014 09:41:23 -0500
Message-ID: <53037113.3090105@ti.com>
References: <1391629574-18955-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391629574-18955-1-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Greg,

On Wednesday 05 February 2014 02:46 PM, Ivan Khoronzhuk wrote:
> These patches introduce Async External Memory Interface (EMIF16/AEMIF)
> controller driver for Davinci/Keystone archs.
> 
> For more informations see documentation:
> Davinci DM646x - http://www.ti.com/lit/ug/sprueq7c/sprueq7c.pdf
> OMAP-L138 - http://www.ti.com/lit/ug/spruh77a/spruh77a.pdf
> Kestone - http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf
> 
Can you please have a look at the series ? It has been on the list for
sometime and all the outstanding comments are addressed so far. If
you are ok with it, I would like to get these queued up for 3.15
via your tree.

> Based on
> git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git
> keystone/master
> 
> v3..v4:
> 	rebased on latest of linux-keystone.git keystone/master
> 
> v2..v3 (https://lkml.org/lkml/2013/12/11/148):
> - memory: ti-aemif: introduce AEMIF driver
> 	changed to work with multiple AEMIF controllers
> 	corrected "copyright" to "authors" in header
> 	changed compatible "ti,omap-L138-aemif" to "ti,da850-aeimf"
> 	used NULL in clk_get() instead of "aemif" name
> 	driver can be build as loadable module
> 	treat all child nodes as cs nodes, it makes code simpler
> 
> - memory: ti-aemif: add bindings for AEMIF driver
> 	deleted direct link driver/memory/ti-aemif.c
> 	clarified description of controller ranges property
> 	changed compatible "ti,omap-L138-aemif" to "ti,da850-aeimf"
> 	added cs number information in commit log
> 	removed compatible property from cs node, it makes code simpler
> 
> v1..v2 (https://lkml.org/lkml/2013/11/21/170):
> - memory: ti-aemif: introduce AEMIF driver
> - memory: ti-aemif: add bindings for AEMIF driver
> 	added ti.cs-chipselect property instead of representing chipselect
> 	number in cs node name.
> 
> Ivan Khoronzhuk (2):
>   memory: ti-aemif: introduce AEMIF driver
>   memory: ti-aemif: add bindings for AEMIF driver
> 
>  .../bindings/memory-controllers/ti-aemif.txt       | 210 ++++++++++
>  drivers/memory/Kconfig                             |  11 +
>  drivers/memory/Makefile                            |   1 +
>  drivers/memory/ti-aemif.c                          | 429 +++++++++++++++++++++
>  4 files changed, 651 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt
>  create mode 100644 drivers/memory/ti-aemif.c
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
