From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: ath10k: calibration data through Device Tree?
Date: Thu, 02 Oct 2014 17:58:19 +0200
Message-ID: <7004963.mtH2SDQocr@wuerfel>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com> <2397903.vznsjdQh6x@wuerfel> <87d2aamsg2.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87d2aamsg2.fsf-HodKDYzPHsUD5k0oWYwrnHL1okKdlPRT@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 02 October 2014 17:55:57 Kalle Valo wrote:
> 
> > I notice that there are no Qualcomm or Atheros PCI host controller drivers
> > in Linux though, so you first have to write a driver that allows probing
> > the PCI bus, and get the binding reviewed for that before you can add
> > it to the dts files. Is this for ipq8064 or something else?
> 
> But now I'm lost again  I want ath10k and this feature to work with
> all possible PCI controllers, not just with Qualcomm controllers. So why
> do I need to wait for Qualcomm PCI host controller driver?

Sorry, my fault. You can definitely do this with any SoC that uses DT
for probing the PCI. I was merely assuming that you were asking about
ipq because the wifi chips and SoCs tend to come bundled from the
same manufacturer in embedded systems, and the MIPS based QCA SoCs
currently don't use DT.

For any machine that does not use DT, it would be much harder to
solve this problem though.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
