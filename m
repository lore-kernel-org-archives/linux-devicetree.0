From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v3 2/3] ARM: dts: bcm2837-rpi-3-b: Add bcm43438 as
 serial slave
Date: Mon, 14 Aug 2017 19:39:06 +0200 (CEST)
Message-ID: <1880215175.270786.1502732346219@email.1und1.de>
References: <1502102366-2760-1-git-send-email-loic.poulain@gmail.com>
 <1502102366-2760-2-git-send-email-loic.poulain@gmail.com>
 <CAL_JsqKxA2pgtjmG-cxy5XPWuRWUiia-weRZDSh4++Vn=QZmqA@mail.gmail.com>
 <8186E2A3-D0AC-498F-8229-78862D363F78@holtmann.org>
 <392e6d51-33d6-1585-6582-1397a0c64852@gmail.com>
 <161632C7-EBBF-47F5-86DC-453E10395B54@holtmann.org>
 <e001e055-10a5-facd-a8e1-57c1bdb78172@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e001e055-10a5-facd-a8e1-57c1bdb78172-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Loic,

> Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> hat am 14. August 2017 um 19:32 geschrieben:
> 
> 
> 
> 
> On 14/08/2017 18:02, Marcel Holtmann wrote:
> > Hi Loic,
> >
> >>>>> Add BCM43438 as a slave device of uart0 (pl011/ttyAMA0).
> >>>>> This allows to automatically insert the bcm43438 to the bluetooth
> >>>>> subsystem instead of relying on userspace helpers (hciattach).
> >>>>>
> >>>>> Overwrite bootargs to use 8250 aux uart (ttyS0) as console instead
> >>>>> of pl011/ttyAMA0.
> >>>>>
> >>>>> Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>>>> ---
> >>>>> v2: dt-bindings as separate patch
> >>>>>      rebase on upcoming pi3 dts changes
> >>>>> v3: changes in bcm serdev drivers:
> >>>>>      name refactoring and additional comments
> >>>>>      Add generic host_set_baudrate method
> >>>>>      Use agnostic device_property_read
> >>>>>
> >>>>> arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 10 ++++++++++
> >>>>> 1 file changed, 10 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> >>>>> index 20725ca..5abc1df 100644
> >>>>> --- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> >>>>> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> >>>>> @@ -8,6 +8,11 @@
> >>>>>         compatible = "raspberrypi,3-model-b", "brcm,bcm2837";
> >>>>>         model = "Raspberry Pi 3 Model B";
> >>>>>
> >>>>> +       chosen {
> >>>>> +               /* 8250 auxiliar UART instead of pl011 */
> >>>>> +               bootargs = "earlyprintk console=ttyS0,115200";
> >>>> This is an unrelated change. "earlyprintk" is arm32 specific and only
> >>>> works with a kernel built with a specific uart type and address. Also,
> >>>> stdout-path property is preferred to set the default over "console”.
> >> I'm going to use stdout-path according to your comment.
> >> However one of the goals was to overwrite the bcm283x.dtsi bootargs,
> >> I assume the same comment apply on the dtsi (stdpath usage /earlyprintk)
> >> which should require update too.
> >>
> >>> the whole fun with the serial console on the rPI3 and the bt-miniuart overlay is something we should solve now. What is the upstream story on this since the config.txt and everything around it is confusing and also misleading since it relies on a Raspbian userspace.
> >>>
> >>> Do we need to the kernel and init to stay away from the ttyAMA0 to avoid confusing the BT chip? As I mentioned earlier, I can not even get a Fedora 26 with hciattach or btattach to work.
> >>>
> >> It is also possible to mux the auxiliary mini UART to drive the Bluetooth
> >> controller in order to keep ttyAMA0 as the "legacy" RPi ext-uart/console,
> >> however SoC spec says that this mini UART is intented to be used mainly as
> >> a console due to shallow FIFOs and no DMA.
> > what upstream kernel tree did you test this with? On a Fedora 26 kernel (now 4.12 based), I still do not have the Bluetooth hardware working.
> >
> > Regards
> >
> > Marcel
> >
> 
> I built kernel, modules and dtb from a bluetooth-next tree (4.12 and 
> 4.13-rc3).
> Using 32-bit multi_v7_defconfig + some additional confs to enable 
> miniuart (BCM2835AUX...) for console.
> I push this on a raspbian image.
> 
> my boot/config.txt is very simple (no overlay):
> 
> kernel=zImage
> device_tree=bcm2837-rpi-3-b.dtb
> # hack for miniuart serial clock
> core_freq=250
> dtparam=audio=on
> 

since the BCM2837 is a 64 bit platform, could you please test also this case?

Thanks
Stefan

> Regards,
> Loic
> 
> 
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
