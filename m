From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH resend 00/12] staging: typec: tcpci: move out of staging
Date: Thu, 26 Oct 2017 17:42:41 -0700
Message-ID: <96d37f9b-f04d-f923-ec09-b25fd62a90be@roeck-us.net>
References: <1506398723-19359-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506398723-19359-1-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

What happened with this series ? Did we all drop the ball ?

Guenter

On 09/25/2017 09:05 PM, Li Jun wrote:
> This patch set attempts to move the tcpci driver out of staging by fix
> some tcpci driver issues and verified on NXP PTN5110, which is a standard
> tcpci typec port controller device with power delivery support, tested
> power source and sink with drp config.
> 
> Li Jun (12):
>    usb: typec: add API to get port type and preferred role
>    usb: typec: add basic typec properties
>    staging: typec: tcpci: add documentation for tcpci
>    staging: typec: tcpci: support port config passed via dt
>    staging: typec: tcpci: register port before request irq
>    staging: typec: tcpci: enable vbus detection
>    typec: tcpm: add starting value for drp toggling
>    staging: typec: tcpci: correct drp toggling
>    usb: typec: tcpm: only drives the connected cc line when attached
>    staging: typec: tcpci: update set_cc for different state
>    staging: typec: tcpci: Only touch target bit when enable vconn
>    staging: typec: tcpci: move tcpci driver out of staging
> 
>   .../devicetree/bindings/usb/typec-tcpci.txt        |  36 ++++
>   Documentation/devicetree/bindings/usb/typec.txt    |  46 +++++
>   drivers/staging/Kconfig                            |   2 -
>   drivers/staging/Makefile                           |   1 -
>   drivers/staging/typec/Kconfig                      |  14 --
>   drivers/staging/typec/Makefile                     |   1 -
>   drivers/staging/typec/TODO                         |   5 -
>   drivers/usb/typec/Kconfig                          |   7 +
>   drivers/usb/typec/Makefile                         |   1 +
>   drivers/{staging => usb}/typec/tcpci.c             | 185 ++++++++++++++++-----
>   drivers/{staging => usb}/typec/tcpci.h             |   0
>   drivers/usb/typec/tcpm.c                           |  22 ++-
>   drivers/usb/typec/typec.c                          |  45 +++++
>   include/linux/usb/tcpm.h                           |   9 +-
>   include/linux/usb/typec.h                          |   2 +
>   15 files changed, 306 insertions(+), 70 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/usb/typec-tcpci.txt
>   create mode 100644 Documentation/devicetree/bindings/usb/typec.txt
>   delete mode 100644 drivers/staging/typec/Kconfig
>   delete mode 100644 drivers/staging/typec/Makefile
>   delete mode 100644 drivers/staging/typec/TODO
>   rename drivers/{staging => usb}/typec/tcpci.c (73%)
>   rename drivers/{staging => usb}/typec/tcpci.h (100%)
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
