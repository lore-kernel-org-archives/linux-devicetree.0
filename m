From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 2/2] V4 ARM: mvebu: Added dts defintion for Lenovo
 Iomega ix4-300d NAS
Date: Mon, 28 Jul 2014 10:08:05 -0400
Message-ID: <20140728140805.GQ23220@titan.lakedaemon.net>
References: <1406503839-4662-1-git-send-email-yahoo@perenite.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1406503839-4662-1-git-send-email-yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
Cc: benoitm-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Benoit,

On Sun, Jul 27, 2014 at 04:30:39PM -0700, Benoit Masson wrote:
> The Lenovo Iomega ix4-300d is a 4-Bay sata NAS with dual Gb,
>  USB2.0 & 3.0, powered by a Marvell Armada XP MV78230 dual core CPU.
> 
> http://shop.lenovo.com/us/en/servers/network-storage/lenovoemc/ix4-300d/
> Signed-off-by: Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                      |   3 +-
>  arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts | 285 ++++++++++++++++++++++++
>  2 files changed, 287 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts

I've applied this to mvebu/dt with a few minor fixups.

  - Insert empty line between URL and S-o-B
  - Removed i2c compatible property
  - Removed trailing whitespace from multi-line comment at end of file

Also, traditionally, the 'V4' goes inside the square brackets, eg

  [ PATCH V4 2/2 ] ...

This is done because 'git am ...' automagically removes everything
between the square brackets and then takes the rest of the subject line
to be the first line of the commit message.

Well done!

You can view the commit here:

  http://git.infradead.org/linux-mvebu.git/commitdiff/40c2da45366171bdc9ad1968489aaae190248383

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
