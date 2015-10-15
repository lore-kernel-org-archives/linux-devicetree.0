From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 0/4] Enable Ethernet on StiH407 family boards
Date: Thu, 15 Oct 2015 13:51:12 +0200
Message-ID: <561F9330.7030309@st.com>
References: <1443714982-16251-1-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443714982-16251-1-git-send-email-maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 10/01/2015 05:56 PM, Maxime Coquelin wrote:
> This series enables Ethernet support on STiH407 family reference design
> boards.
>
> These boards use the RTL8367 Switch as PHY.
> As it is previously configured by the bootloader, we declare it as a fixed
> link.
>
> Maxime Coquelin (4):
>    ARM: dts: Fix RGMII pinctrl timings
>    ARM: dts: Add Ethernet node to STiH407 family
>    ARM: dts: Enable Ethernet on STi's B2120 boards
>    ARM: dts: Enable Ethernet on STi's B2199 board
>
>   arch/arm/boot/dts/stih407-b2120.dts    |  1 +
>   arch/arm/boot/dts/stih407-family.dtsi  | 27 +++++++++++++++++++++++++++
>   arch/arm/boot/dts/stih407-pinctrl.dtsi |  4 ++--
>   arch/arm/boot/dts/stih410-b2120.dts    |  1 +
>   arch/arm/boot/dts/stih418-b2199.dts    |  8 ++++++++
>   arch/arm/boot/dts/stihxxx-b2120.dtsi   |  6 ++++++
>   6 files changed, 45 insertions(+), 2 deletions(-)
>
Series applied.

Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
