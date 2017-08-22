From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: net: bluetooth: Add
 broadcom-bluetooth
Date: Tue, 22 Aug 2017 13:01:20 +0200
Message-ID: <f2fcf522-cd1e-e748-0ee7-ad28bbf8ae5d@i2se.com>
References: <1501576704-26423-1-git-send-email-loic.poulain@gmail.com>
 <20170822074726.e424lflqxn6mb4xd@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170822074726.e424lflqxn6mb4xd-ZC1Zs529Oq4@public.gmane.org>
Content-Language: en-US
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,


Am 22.08.2017 um 09:47 schrieb Maxime Ripard:
> Hi Loic,
>
> On Tue, Aug 01, 2017 at 10:38:22AM +0200, Loic Poulain wrote:
>> Add binding document for serial bluetooth chips using
>> Broadcom protocol.
>>
>> Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> v2: dt-bindings as separate patch
>>      rebase on upcoming pi3 dts changes
>>
>>   .../devicetree/bindings/net/broadcom-bluetooth.txt | 29 ++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
>>
>> diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
>> new file mode 100644
>> index 0000000..c51ea1b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
>> @@ -0,0 +1,29 @@
>> +Broadcom Bluetooth Chips
>> +---------------------
>> +
>> +This documents the binding structure and common properties for serial
>> +attached Broadcom devices.
>> +
>> +Serial attached Broadcom devices shall be a child node of the host UART
>> +device the slave device is attached to.
>> +
>> +Required properties:
>> +
>> + - compatible: should contain one of the following:
>> +   * "brcm,bcm43438-bt"
>> +
>> +Optional properties:
>> +
>> + - max-speed: see Documentation/devicetree/bindings/serial/slave-device.txt
>> +
>> +Example:
>> +
>> +&uart2 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&uart2_pins>;
>> +
>> +       bluetooth {
>> +               compatible = "brcm,bcm43438-bt";
>> +               max-speed = <921600>;
>> +       };
>> +};
> Thanks a lot for working on that, I've made a similar attempt a few
> weeks ago but didn't manage to get it to work.
>
> The way it's hooked in our boards is a bit more complex though, even
> if it could be because we're using a different part.
>
> In order to get it running we need:
>    - two clocks, called in the broadcom datasheets lpo and tcxo.
>    - three GPIOs, device wakeup, host wakeup and a shutdown GPIO (which
>      might be the BT_ON you were discussing about)
>    - two regulators called vbat and reg-en for us (I guess they're
>      meant to power the chip, and its registers)
>
> Do you know if you're also using those? Or could it be that it's just
> hardwired to some non-gatable crystal / regulator on the RPI?

unfortunately the Foundation doesn't provide the full schematics for RPI 
3 or RPI Zero W (which uses the same chip).

Please also take a look at the RPI Zero W device tree sources, which 
describe the wifi part of the chip [1]. It contains a line called WL_ON 
on gpio41 and the low power clock on gpio43.

Stefan

[1] - 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts?h=next-20170822

>
> Thanks!
> Maxime
>
