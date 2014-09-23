From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [RESEND PATCH 0/4] Enables STMicroelectronics Flexgen Clock support
Date: Tue, 23 Sep 2014 09:43:26 +0200
Message-ID: <5421249E.2000700@st.com>
References: <1408977888-10473-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408977888-10473-1-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Gabi,

	Series applied to sti-dt-for-v3.18.

Thanks!
Maxime

On 08/25/2014 04:44 PM, Gabriel FERNANDEZ wrote:
> These patches enables clock drivers for STih407 boards.
>
> Gabriel Fernandez (4):
>    ARM: STi: DT: STiH407: 407 DT Entry for clockgen A0
>    ARM: STi: DT: STiH407: 407 DT Entry for clockgen C0
>    ARM: STi: DT: STiH407: 407 DT Entry for clockgen D0/D2/D3
>    ARM: STi: DT: STiH407: 407 DT Entry for clockgenA9
>
>   arch/arm/boot/dts/stih407-clock.dtsi     | 295 ++++++++++++++++++++++++++++++-
>   arch/arm/boot/dts/stih407.dtsi           |  18 +-
>   include/dt-bindings/clock/stih407-clks.h |  11 ++
>   3 files changed, 307 insertions(+), 17 deletions(-)
>   create mode 100644 include/dt-bindings/clock/stih407-clks.h
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
