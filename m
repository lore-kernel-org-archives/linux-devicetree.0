From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 2/6] usb: chipidea: usbmisc: rename file, struct and functions to usbmisc_imx
Date: Wed, 14 Nov 2012 15:32:36 +0200
Message-ID: <871ufwb98r.fsf@ashishki-desk.ger.corp.intel.com>
References: <1352894137-2050-1-git-send-email-m.grzeschik@pengutronix.de> <1352894137-2050-3-git-send-email-m.grzeschik@pengutronix.de> <87pq3g71v9.fsf@ashishki-desk.ger.corp.intel.com> <20121114132807.GA12976@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121114132807.GA12976-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> On Wed, Nov 14, 2012 at 03:25:30PM +0200, Alexander Shishkin wrote:
>> Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>> 
>> > This driver will be used for every Freescale SoC which has this misc
>> > memory layout to control the basic usb handling. So better name this
>> > driver, function and struct names in a more generic way.
>> >
>> > Reported-by: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> > Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> > ---
>> >  drivers/usb/chipidea/usbmisc_imx.c   |  163 ++++++++++++++++++++++++++++++++++
>> >  drivers/usb/chipidea/usbmisc_imx6q.c |  163 ----------------------------------
>> >  2 files changed, 163 insertions(+), 163 deletions(-)
>> >  create mode 100644 drivers/usb/chipidea/usbmisc_imx.c
>> >  delete mode 100644 drivers/usb/chipidea/usbmisc_imx6q.c
>> 
>> Like Fabio suggested already, please use rename detection.
>> Another thing, how do you get away with this without fixing the Makefile
>> accordingly? Did you (at least) compile-test this patchset?
>
> You are right, i have compile tested this patchset before adding this
> patch. Sorry for that, i will test the whole series again on my
> platform (mx53), before sending v2.

Thanks!

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
