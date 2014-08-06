From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Add EHCI and OHCI drivers for STi SoC's
Date: Wed, 6 Aug 2014 23:18:28 +0200
Message-ID: <201408062318.28958.arnd@arndb.de>
References: <1407344589-24863-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407344589-24863-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 06 August 2014, Peter Griffin wrote:
> This series adds support for the OHCI and EHCI on-chip controllers
> found in STi consumer electronics SoC's from STMicroelectronics.
> 
> The series has been re-worked from v2 to split out the ehci and ohci parts
> into their own drivers / devices like most other ARM platforms based on
> feedback from Arnd Bergmann (see here http://www.spinics.net/lists/linux-usb/msg111124.html. 
> 
> The ehci-platform & ohci-platform have been used as a basis for this in case we
> wish to merge the drivers again in the future.
> 
> Changes since v2:
>  - Based on Arnd Berghman feedback, split out into 2 devices / drivers
>  - Base drivers oh ehci-platform.c & ohci-platform.c with required extensions
>    to allow possible re-merge in the furture.

Hi Peter,

This looks much better than the first version. I have some remaining comments for
how it could be simplified a bit more.

The way that you deal with the 48mhz clock seems like it should fit in well
with the generic driver, just like all the rest (once the usb-st-common
stuff is moved into the ohci/ehci drivers), so the alternative would be
to make it all generic now.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
