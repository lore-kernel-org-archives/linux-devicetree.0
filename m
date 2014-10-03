From: Adrian Chadd <adrian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: ath10k: calibration data through Device Tree?
Date: Fri, 3 Oct 2014 10:21:41 -0700
Message-ID: <CAJ-VmomZzXGBqyQ+xLu1g0hEUfFvnsMoAZrCCfnM9_QfJNwjhg@mail.gmail.com>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
	<2386503.dNPayhXJTQ@wuerfel>
	<20141003162513.GW26643@leverpostej>
	<2162399.E7Ru1MI0QH@wuerfel>
	<CALCETrWC9fXckgUGYWA8AcHT5SoxQc-EouV0U-sFr7v6279oow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALCETrWC9fXckgUGYWA8AcHT5SoxQc-EouV0U-sFr7v6279oow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, "ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As far as I'm aware there's no unique identifier in the silicon. It's
all in the OTP or flash.

The NIC comes up with a standard MAC address, the same for all NICs in
the family.


-a
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
