From: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 4/4] Bluetooth: hci_bcm: Add serdev support
Date: Thu, 17 Aug 2017 21:30:08 +0200
Message-ID: <1BB54E03-02E8-45F9-8FBA-739172DDD166@holtmann.org>
References: <1502992791-10265-1-git-send-email-loic.poulain@gmail.com>
 <1502992791-10265-4-git-send-email-loic.poulain@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502992791-10265-4-git-send-email-loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Loic,

> Add basic support for Broadcom serial slave devices.
> Probe the serial device, retrieve its maximum speed and
> register a new hci uart device.
> 
> Tested/compatible with bcm43438 (RPi3).
> 
> Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> v2: dt-bindings as separate patch
>     rebase on upcoming pi3 dts changes
> v3: changes in bcm serdev drivers:
>     name refactoring and additional comments
>     Add generic host_set_baudrate method
>     Use agnostic device_property_read
> v4: changes in doc and dts:
>     Add additional params to broadcom bt dt-bindings
>     Set the max baudrate to 2000000 instead of 921600
>     use chosen/stdout-path instead of console=
>     remove useless earlyprintk
>     same changes in bcm283x.dtsi
> 
> drivers/bluetooth/hci_bcm.c | 85 +++++++++++++++++++++++++++++++++++++++++++--
> 1 file changed, 83 insertions(+), 2 deletions(-)

you are missing the serdev dependency.

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index 3a6ead603e49..fae5a74dc737 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -168,6 +168,7 @@ config BT_HCIUART_INTEL
 config BT_HCIUART_BCM
        bool "Broadcom protocol support"
        depends on BT_HCIUART
+       depends on BT_HCIUART_SERDEV
        select BT_HCIUART_H4
        select BT_BCM
        help

Regards

Marcel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
