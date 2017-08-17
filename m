From: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 4/4] Bluetooth: hci_bcm: Add serdev support
Date: Thu, 17 Aug 2017 21:48:48 +0200
Message-ID: <C0CDF47D-95D8-4270-A6C2-F83C00954A95@holtmann.org>
References: <1502992791-10265-1-git-send-email-loic.poulain@gmail.com>
 <1502992791-10265-4-git-send-email-loic.poulain@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502992791-10265-4-git-send-email-loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, stefan.wahren-eS4NqCHxEME@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
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

I decided to amend your patch with the required Kconfig addition and then just applied 1/4 and 4/4 to bluetooth-next tree.

For 2/4 and 3/4, I think they should go through the DT tree since they depend on other changes. I can not apply since none of these changes are in any of my parent trees.

Regards

Marcel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
