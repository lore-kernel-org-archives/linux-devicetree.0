From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v3 05/12] usb: chipidea: add imx platform driver
Date: Tue, 05 Jun 2012 17:25:46 +0300
Message-ID: <87vcj596ol.fsf@ashishki-desk.ger.corp.intel.com>
References: <1337912665-16615-1-git-send-email-richard.zhao@freescale.com> <1337912665-16615-6-git-send-email-richard.zhao@freescale.com> <87k400ac6x.fsf@ashishki-desk.ger.corp.intel.com> <20120525085109.GB18733@b20223-02.ap.freescale.net> <87hav4a8ud.fsf@ashishki-desk.ger.corp.intel.com> <20120529030505.GA2542@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120529030505.GA2542-iWYTGMXpHj9ITqJhDdzsOjpauB2SiJktrE5yTffgRl4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:

> Hi Alex,

Hi,

(overlooked this email somehow)

> On Fri, May 25, 2012 at 12:49:46PM +0300, Alexander Shishkin wrote:
>> Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:
>> 
>> > On Fri, May 25, 2012 at 11:37:26AM +0300, Alexander Shishkin wrote:
>> >> Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:
>> >> 
>> >> > This patch supports only the host-mode functionality so far.
>> >> >
>> >> > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> >> > Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
>> >> > Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> >> > Cc: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> >> > Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
>> >> > Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
>> >> > ---
>> >> >  .../devicetree/bindings/usb/ci13xxx-imx.txt        |   20 ++
>> >> >  drivers/usb/chipidea/Makefile                      |    3 +
>> >> >  drivers/usb/chipidea/ci13xxx_imx.c                 |  189 ++++++++++++++++++++
>> >> 
>> >> One comment: I was going to suggest dropping "13xxx" suffix from
>> >> everywhere in the driver, maybe module names too, since it doesn't
>> >> really add any value and people often mistype it, so maybe for the new
>> >> code it makes sense to avoid it? ci-imx looks better than ci13xxx-imx
>> >> anyway and same goes for ci_imx_probe() vs ci13xxx_imx_probe().
>> >> Does this make sense to you?
>> > I'm not clear with the history. Does Chipidea only have one IP?
>> 
>> As far as their USB controllers go, there are several versions with
>> different features and register layouts, but essentially similar. I want
>> to support all of them with this driver. As for the other IPs designed
>> by chipidea -- I have no idea about those, but I don't think we should
>> care.
> Cleaning up ci13xxx will touch almost every chipidea driver files. Do
> you want me to do it or ?

If you have more patches for chipidea driver, you can include the 13xxx
removal there, otherwise I'll do it as a part of my patchset that I'll
send after we sort out this one.

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
