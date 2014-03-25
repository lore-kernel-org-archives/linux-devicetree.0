From: Radha Mohan <mohun106-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: Add initial dts for Cavium Thunder SoC
Date: Tue, 25 Mar 2014 16:34:49 +0530
Message-ID: <CAC8NTUUjLotVbrY1h3pv8HcEhxFuOYyaC6o+2FjpTU_X=DCJ=A@mail.gmail.com>
References: <1395652179-9216-1-git-send-email-mohun106@gmail.com>
	<1395652179-9216-3-git-send-email-mohun106@gmail.com>
	<4827584.NY6fTFPNNK@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4827584.NY6fTFPNNK@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "pkapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org" <pkapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd

On Mon, Mar 24, 2014 at 3:25 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 24 March 2014 14:39:38 mohun106-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> +       soc {
>> +               compatible = "simple-bus";
>> +               #address-cells = <2>;
>> +               #size-cells = <2>;
>> +               ranges;
>> +
>> +               clocks {
>> +                       #address-cells = <2>;
>> +                       #size-cells = <2>;
>> +                       ranges;
>> +
>> +                       refclk50mhz: refclk50mhz {
>> +                               compatible = "fixed-clock";
>> +                               #clock-cells = <0>;
>> +                               clock-frequency = <50000000>;
>> +                               clock-output-names = "refclk50mhz";
>> +                       };
>> +               };
>> +
>> +               ahci0: host-bus-adapter@810000000000 {
>> +                       compatible = "snps,spear-ahci";
>> +                       reg = <0x8100 0x0 0x0 0x1100>;
>> +                       interrupts = <1 32 4>;
>> +               };
>
>
> The use of "snps,spear-ahci" by itself seems wrong here: that is
> the specific implementation used in the ST "spear" SoC. I don't know
> why we don't already have a "generic-ahci" binding, but please add
> one so you can match against that.
>
> I would also recommend adding a more specific string for your soc.
> If you want to keep compatibility with older kernels, you can keep
> the spear string as well, but it would be nicer to drop that.
> If you can find out what version the synopsys macro has, that would
> be ideal.
>
> You could end up for instance with
>
>         compatible = "cavium,thunder-123456-ahci", "snps,ahci-1.23.45",
>                         "snps,spear-ahci", "generic-ahci";
>
> The driver only needs to match the last one of these, but if we
> find that we have to work around some bug, it's good to have the
> option of determining the exact version.

OK.

>
>> +               nic0: ethernet@843000000000 {
>> +                       compatible = "smsc,lan9115";
>> +                       reg-io-width = <4>;
>> +                       reg = <0x8430 0x0 0x0 0x1000>;
>> +                       interrupts = <1 31 4>;
>> +               };
>> +
>> +               uaa0: uart@87e024000000 {
>> +                       compatible = "arm,pl011", "arm,primecell";
>> +                       reg = <0x87e0 0x24000000 0x0 0x1000>;
>> +                       interrupts = <1 21 4>;
>> +                       clocks = <&refclk50mhz>;
>> +                       clock-names = "apb_pclk";
>> +               };
>> +
>> +               uaa1: uart@87e025000000 {
>> +                       compatible = "arm,pl011", "arm,primecell";
>> +                       reg = <0x87e0 0x25000000 0x0 0x1000>;
>> +                       interrupts = <1 22 4>;
>> +                       clocks = <&refclk50mhz>;
>> +                       clock-names = "apb_pclk";
>
> The generic name for uarts in DT is "serial", not "uart" (yes, a
> lot of others get this wrong, too).

OK :)
But I think lack of consistency in DT among various ARM platforms is
source of this confusion.

>
>         Arnd
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
