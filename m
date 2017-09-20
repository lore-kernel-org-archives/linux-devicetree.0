From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] arm64: dt marvell: extend AP806 system controller size
Date: Wed, 20 Sep 2017 09:51:05 +0200
Message-ID: <87shfhreom.fsf@free-electrons.com>
References: <d230651ed28aa4344bab7e13e9964d69673ecace.1505461807.git.baruch@tkos.co.il>
        <877ewusr2h.fsf@free-electrons.com>
        <20170919160813.yz4ez2hsuaejbf4t@tarshish>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170919160813.yz4ez2hsuaejbf4t@tarshish> (Baruch Siach's
        message of "Tue, 19 Sep 2017 19:08:13 +0300")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Baruch,
 
 On mar., sept. 19 2017, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:

> Hi Gregory,
>
> On Tue, Sep 19, 2017 at 04:25:58PM +0200, Gregory CLEMENT wrote:
>>  On ven., sept. 15 2017, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:
>> 
>> > Extend the container size to 0x2000 to include the gpio controller at
>> > offset 0x1040.
>> >
>> > While at it, add start address notation to the gpio node name to match
>> > its 'offset' property.
>> >
>> > Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
>> 
>> I made a quick test on a mcbin and I confirm that the watchdog is here
>> and usable.
>> 
>> Tested-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> and 
>> Applied on mvebu/dt64
>
> This is meant to be a reply to https://patchwork.kernel.org/patch/9947525/, 
> right?

Yes!
Sorry for hte confusion.

>
> Anyway, I see the right patch[1] at mvebu/dt64.
>
> Thanks,
> baruch
>
> [1] http://git.infradead.org/linux-mvebu.git/commitdiff/e34ffe32f6e7ae9191d14226ff9d8c0c47400a71
>
>> > ---
>> >  arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
>> > index 4d360713ed12..30d48ecf46e0 100644
>> > --- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
>> > +++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
>> > @@ -254,7 +254,7 @@
>> >  
>> >  			ap_syscon: system-controller@6f4000 {
>> >  				compatible = "syscon", "simple-mfd";
>> > -				reg = <0x6f4000 0x1000>;
>> > +				reg = <0x6f4000 0x2000>;
>> >  
>> >  				ap_clk: clock {
>> >  					compatible = "marvell,ap806-clock";
>> > @@ -265,7 +265,7 @@
>> >  					compatible = "marvell,ap806-pinctrl";
>> >  				};
>> >  
>> > -				ap_gpio: gpio {
>> > +				ap_gpio: gpio@1040 {
>> >  					compatible = "marvell,armada-8k-gpio";
>> >  					offset = <0x1040>;
>> >  					ngpios = <20>;
>
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.52.368.4656, http://www.tkos.co.il -

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
