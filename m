From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: dts: Various STi DT clean-ups
Date: Wed, 30 Sep 2015 11:15:55 +0200
Message-ID: <560BA84B.8080200@st.com>
References: <1443037049-6167-1-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443037049-6167-1-git-send-email-maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 09/23/2015 09:37 PM, Maxime Coquelin wrote:
> This series cleans the STi407 family DTs, by factorizing common nodes between
> STiH407 and STiH410, and also by only enabling PWM and USB nodes at board
> level, as they could not be exposed on some boards.
>
> Maxime Coquelin (3):
>    ARM: dts: stih407: Enable PWM nodes only board level
>    ARM: dts: stih407/410: Tidy up display nodes
>    ARM: dts: stih410: Enable USB2.0 and related PHY nodes at board level
>
>   arch/arm/boot/dts/stih407-family.dtsi | 19 +++++++++++++++++--
>   arch/arm/boot/dts/stih407.dtsi        | 13 -------------
>   arch/arm/boot/dts/stih410-b2120.dts   | 24 ++++++++++++++++++++++++
>   arch/arm/boot/dts/stih410.dtsi        | 23 +++++++++++------------
>   arch/arm/boot/dts/stihxxx-b2120.dtsi  |  8 ++++++++
>   5 files changed, 60 insertions(+), 27 deletions(-)
>
Thanks for the reviews.
Series applied to sti-dt-for-v4.4

Regards,
Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
