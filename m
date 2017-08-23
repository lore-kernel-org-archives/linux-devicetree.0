From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/4] ARM: dts: bcm2837-rpi-3-b: Add bcm43438 serial slave
Date: Wed, 23 Aug 2017 11:22:10 -0500
Message-ID: <CAL_Jsq+NnzNyvLXU=_Xv_CVY_Z7_P_D1n5qaASRvNzPQQ=j6YA@mail.gmail.com>
References: <1502992791-10265-1-git-send-email-loic.poulain@gmail.com>
 <1502992791-10265-3-git-send-email-loic.poulain@gmail.com> <972AD2C1-FE7C-412D-AEC6-FFED22EC4B77@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <972AD2C1-FE7C-412D-AEC6-FFED22EC4B77-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Cc: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 23, 2017 at 9:22 AM, Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org> wrote:
> Hi Loic,
>
>> Add BCM43438 (bluetooth) as a slave device of uart0 (pl011/ttyAMA0).
>> This allows to automatically insert the bcm43438 to the bluetooth
>> subsystem instead of relying on userspace helpers (hciattach).
>>
>> Overwrite chosen/stdout-path to use 8250 aux uart as console.
>>
>> Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> v2: dt-bindings as separate patch
>>     rebase on upcoming pi3 dts changes
>> v3: changes in bcm serdev drivers:
>>     name refactoring and additional comments
>>     Add generic host_set_baudrate method
>>     Use agnostic device_property_read
>> v4: changes in doc and dts:
>>     Add additional params to broadcom bt dt-bindings
>>     Set the max baudrate to 2000000 instead of 921600
>>     use chosen/stdout-path instead of console=
>>     remove useless earlyprintk
>>     same changes in bcm283x.dtsi
>>
>> arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 10 ++++++++++
>> 1 file changed, 10 insertions(+)
>
> do you mind resending the 2 pending patches with Rob’s ack on it. And ensure that this goes with DT tree since I can currently not take it since net-next has not pulled in the pending DT patches.

They will go thru arm-soc via the sub-arch maintainer (Florian I think).

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
