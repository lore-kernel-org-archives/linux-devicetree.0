From: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 4/4] Bluetooth: hci_bcm: Add serdev support
Date: Thu, 17 Aug 2017 22:12:21 +0200
Message-ID: <77095b0a-8fc7-1d43-ee8f-166c3f05100f@gmail.com>
References: <1502992791-10265-1-git-send-email-loic.poulain@gmail.com>
 <1502992791-10265-4-git-send-email-loic.poulain@gmail.com>
 <C0CDF47D-95D8-4270-A6C2-F83C00954A95@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C0CDF47D-95D8-4270-A6C2-F83C00954A95-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, stefan.wahren-eS4NqCHxEME@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marcel,


On 17/08/2017 21:48, Marcel Holtmann wrote:
> Hi Loic,
>
>> Add basic support for Broadcom serial slave devices.
>> Probe the serial device, retrieve its maximum speed and
>> register a new hci uart device.
>>
>> Tested/compatible with bcm43438 (RPi3).
>>
>> Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> v2: dt-bindings as separate patch
>>      rebase on upcoming pi3 dts changes
>> v3: changes in bcm serdev drivers:
>>      name refactoring and additional comments
>>      Add generic host_set_baudrate method
>>      Use agnostic device_property_read
>> v4: changes in doc and dts:
>>      Add additional params to broadcom bt dt-bindings
>>      Set the max baudrate to 2000000 instead of 921600
>>      use chosen/stdout-path instead of console=
>>      remove useless earlyprintk
>>      same changes in bcm283x.dtsi
>>
>> drivers/bluetooth/hci_bcm.c | 85 +++++++++++++++++++++++++++++++++++++++++++--
>> 1 file changed, 83 insertions(+), 2 deletions(-)
> I decided to amend your patch with the required Kconfig addition and then just applied 1/4 and 4/4 to bluetooth-next tree.
>
> For 2/4 and 3/4, I think they should go through the DT tree since they depend on other changes. I can not apply since none of these changes are in any of my parent trees.
>
>
Thanks for the amend.

Indeed 2 and 3 depend on the following DT tree changes (Stefan):
[PATCH v2] ARM: dts: bcm283x: Move the BCM2837 DT contents from arm64 to 
arm.
[PATCH V2 0/3] ARM: bcm283x: Raspberry Pi Zero W support

Regards,
Loic
