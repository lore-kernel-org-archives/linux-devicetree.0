From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: add driver for NXP SPI Flash
 Interface (SPIFI)
Date: Wed, 12 Aug 2015 19:00:04 -0700
Message-ID: <20150813020004.GA108786@google.com>
References: <1433106362-6032-1-git-send-email-manabian@gmail.com>
 <1433106362-6032-2-git-send-email-manabian@gmail.com>
 <5570692E.2050603@vanguardiasur.com.ar>
 <CAGhQ9VzU+J1ZT45e-yZ+BAmyZvLUm1cyXE2T__O_4gGjtHrX-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGhQ9VzU+J1ZT45e-yZ+BAmyZvLUm1cyXE2T__O_4gGjtHrX-w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, shijie.huang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Han Xu <han.xu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 04, 2015 at 05:58:07PM +0200, Joachim Eastwood wrote:
> On 4 June 2015 at 17:05, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
> > I think the "auto-detect" quirk is really needed, or you are will
> > otherwise fail to probe with the generic "jedec,spi-nor" compatible
> > string.
[...]
> Note that this code was copied from fsl-quadspi so I assume it has the
> same problem.

Yes, fsl-quadspi gets this a bit wrong, I think. But spi_nor_scan()
didn't have a notion of "NULL means autodetect" when it was first
written. The framework is still evolving a bit.

I have a simple patch for fsl-quadspi to fix this up now, but I don't
have the HW. Maybe I'll send with a RFT.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
