From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: meson: Adding hwrev syscon node
Date: Thu, 18 Feb 2016 15:14:45 +0100
Message-ID: <CAOQ7t2byFoW657-1xnsBpeyPkB6K25R=_pPmRDmT32Sjef=kUw@mail.gmail.com>
References: <1455730114-2547-1-git-send-email-romain.perier@gmail.com>
	<CAOQ7t2add21t4hFtTeUBFe9aW0EtNvSi5KS4JMb6qVC60Fj-tA@mail.gmail.com>
	<CABgxDo+oGe47hvxiCOAUWz8zfSeVONf=3pFm+=PbNsCbr_jTpg@mail.gmail.com>
	<4158343.mkrTsd5B4G@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4158343.mkrTsd5B4G@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 18, 2016 at 1:43 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 18 February 2016 13:33:04 Romain Perier wrote:
>> 2016-02-17 21:36 GMT+01:00 Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>:
>> > On Wed, Feb 17, 2016 at 6:28 PM, Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >> These are the CBUS registers used to retrieve the revision and the
>> >> identifier of the SoC on Meson8.
>> >>
>> >> Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> >> ---
>> >>  arch/arm/boot/dts/meson8b.dtsi | 5 +++++
>> >>  1 file changed, 5 insertions(+)
>> >>
>> >> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
>> >> index 0477a81..71009dc 100644
>> >> --- a/arch/arm/boot/dts/meson8b.dtsi
>> >> +++ b/arch/arm/boot/dts/meson8b.dtsi
>> >> @@ -99,6 +99,11 @@
>> >>                 };
>> >>         };
>> >>
>> >> +       hwrev@c1107d4c {
>> >> +               compatible = "amlogic,meson8b-hwrev", "syscon";
>> >> +               reg = <0xc1107d4c 0x460>;
>> >
>> > Interesting. Where did you get 0x460?
>>
>> Carlo, Arnd.
>>
>> Well, what I did is the following :
>> - CBUS_PHY_BASE is 0xc1100000   (CBUS is a larger block of registers,
>> like slcr on zynq)
>> - the serial is at CBUS_PHY_BASE + 0x7d4c
>> - the revision is at CBUS_PHY_BASE + 0x81a8
>>
>> So I decided to create a device_node for hw revision at 0xc1107d4c, in
>> this case the lenght is 0x460...
>> Am I wrong ?
>
> Yes, you should describe the device that is actually there, which would be
> something like
>
>         cbus@c1100000 {
>                 compatible = "amlogic,meson8b-cbus", "syscon";
>                 reg = <0xc1100000 0x10000>; /* no idea what the length is, fix it */
>         };
>
> Don't just make things up because you happen to access them in a particular
> way, but try to stay as close as you can to describing the actual hardware.

Arnd,
in the cbus region are mapped a lot of different devices, do you think
that it is a good idea mapping the whole region as a single syscon
device?

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
