From: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/2] arm64: dts: cleanup Broadcom boards per SoC
Date: Fri, 28 Jul 2017 07:39:30 -0700
Message-ID: <4d8c36d0-7422-120b-146b-33e74a7a518e@broadcom.com>
References: <1500483950-9217-1-git-send-email-scott.branden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500483950-9217-1-git-send-email-scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Florian,

Could you please pick up PATCH 1/2 of this series below and drop PATCH 2/2 ?


On 17-07-19 10:05 AM, Scott Branden wrote:
> Separate Broadcom boards per SoC to assist in cleaner management of boards.
> This has already been done for Stingray and is done here for RPI and NS2.
>
> If this is problematic for RPI please let me know and RPI patch can be
> dropped from patch series.
>
> Scott Branden (2):
>    arm64: dts: move ns2 into northstar2 directory
>    arm64: dts: move rpi into rpi directory
>
>   arch/arm64/boot/dts/broadcom/Makefile                        | 7 +++----
>   arch/arm64/boot/dts/broadcom/bcm2835-rpi.dtsi                | 1 -
>   arch/arm64/boot/dts/broadcom/bcm283x-rpi-smsc9514.dtsi       | 1 -
>   arch/arm64/boot/dts/broadcom/bcm283x-rpi-usb-host.dtsi       | 1 -
>   arch/arm64/boot/dts/broadcom/bcm283x.dtsi                    | 1 -
>   arch/arm64/boot/dts/broadcom/northstar2/Makefile             | 6 ++++++
>   arch/arm64/boot/dts/broadcom/{ => northstar2}/ns2-clock.dtsi | 0
>   arch/arm64/boot/dts/broadcom/{ => northstar2}/ns2-svk.dts    | 0
>   arch/arm64/boot/dts/broadcom/{ => northstar2}/ns2-xmc.dts    | 0
>   arch/arm64/boot/dts/broadcom/{ => northstar2}/ns2.dtsi       | 0
>   arch/arm64/boot/dts/broadcom/rpi/Makefile                    | 5 +++++
>   arch/arm64/boot/dts/broadcom/rpi/bcm2835-rpi.dtsi            | 1 +
>   arch/arm64/boot/dts/broadcom/{ => rpi}/bcm2837-rpi-3-b.dts   | 0
>   arch/arm64/boot/dts/broadcom/{ => rpi}/bcm2837.dtsi          | 0
>   arch/arm64/boot/dts/broadcom/rpi/bcm283x-rpi-smsc9514.dtsi   | 1 +
>   arch/arm64/boot/dts/broadcom/rpi/bcm283x-rpi-usb-host.dtsi   | 1 +
>   arch/arm64/boot/dts/broadcom/rpi/bcm283x.dtsi                | 1 +
>   17 files changed, 18 insertions(+), 8 deletions(-)
>   delete mode 120000 arch/arm64/boot/dts/broadcom/bcm2835-rpi.dtsi
>   delete mode 120000 arch/arm64/boot/dts/broadcom/bcm283x-rpi-smsc9514.dtsi
>   delete mode 120000 arch/arm64/boot/dts/broadcom/bcm283x-rpi-usb-host.dtsi
>   delete mode 120000 arch/arm64/boot/dts/broadcom/bcm283x.dtsi
>   create mode 100644 arch/arm64/boot/dts/broadcom/northstar2/Makefile
>   rename arch/arm64/boot/dts/broadcom/{ => northstar2}/ns2-clock.dtsi (100%)
>   rename arch/arm64/boot/dts/broadcom/{ => northstar2}/ns2-svk.dts (100%)
>   rename arch/arm64/boot/dts/broadcom/{ => northstar2}/ns2-xmc.dts (100%)
>   rename arch/arm64/boot/dts/broadcom/{ => northstar2}/ns2.dtsi (100%)
>   create mode 100644 arch/arm64/boot/dts/broadcom/rpi/Makefile
>   create mode 120000 arch/arm64/boot/dts/broadcom/rpi/bcm2835-rpi.dtsi
>   rename arch/arm64/boot/dts/broadcom/{ => rpi}/bcm2837-rpi-3-b.dts (100%)
>   rename arch/arm64/boot/dts/broadcom/{ => rpi}/bcm2837.dtsi (100%)
>   create mode 120000 arch/arm64/boot/dts/broadcom/rpi/bcm283x-rpi-smsc9514.dtsi
>   create mode 120000 arch/arm64/boot/dts/broadcom/rpi/bcm283x-rpi-usb-host.dtsi
>   create mode 120000 arch/arm64/boot/dts/broadcom/rpi/bcm283x.dtsi
>
Thanks,
  Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
