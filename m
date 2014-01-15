From: Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 7/7] ARM: brcmstb: dts: add a reference DTS for Broadcom 7445
Date: Wed, 15 Jan 2014 10:22:07 -0800
Message-ID: <61E0E2A7-F7FC-4397-8E92-06CC409912B9@gmail.com>
References: <1389743333-16741-1-git-send-email-marc.ceeeee@gmail.com> <1389743333-16741-8-git-send-email-marc.ceeeee@gmail.com> <201401151410.39112.arnd@arndb.de>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201401151410.39112.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Thank you for the suggestion - it's exactly what we were looking for!

Regards,
Marc

Sent from my phone

> On Jan 15, 2014, at 5:10 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> 
>> On Wednesday 15 January 2014, Marc Carino wrote:
>> +       gen-ctrl {
>> +               compatible = "brcm,brcmstb-gen-ctrl-v1";
>> +               reg = <0xf0404304 0x4
>> +                      0xf0404308 0x4
>> +                      0xf03e2578 0x4
>> +                      0xf03e2488 0x10
>> +                      0xf0452000 0x20>;
>> +       };
> 
> Sorry I didn't get back to you on this when we discussed the previous
> version. I'm actually less happy with this DT representation than the
> original. What I take from your description is that you have multiple
> register ranges that basically combine more-or-less random registers
> that belong into different Linux subsystems.
> 
> I think the best way to deal with this is to have the "syscon" driver
> handle the multiplexing between the various drivers that need access
> to the registers. It would look something like (taking the numbers
> from your previous patch):
> 
>    ahb {
>        ranges = <0 0xf0000000 0x1000000>; /* 16 MB remapped registers */
> 
>        hif-cpubuictrl: syscon@3e2400 {
>            compatible = "brcm,7445-cpubioctrl", "syscon";
>            reg = <0x3e2000, 0x1000>;
>        };
> 
>        hif-continuation: syscon@45200 {
>            compatible = "brcm,7445-hif-continuation", "syscon";
>            reg = <0x452000, 0x1000>;
>        };
> 
>        sun-top-ctrl: ...
>    };
> 
> This lets the syscon driver find and map the three register areas.
> Drivers that need access to the registers then do 
> 
>    reset {
>        compatible = "brcm,7445-reset-ctrl";
>        syscon = <&sun-top-ctrl 0x300 0x100>;
>        #reset-cells = <1>;
>    };
> 
> And then you can add a regular device driver to drivers/reset that provides
> a device_reset() API to other drivers, or a system-reset function to be
> registered as arm_pm_restart. This driver would use
> syscon_regmap_lookup_by_phandle() to get access to a regmap pointer,
> and then use either hardcoded offsets into the regmap, or get those
> offsets from numbers in the devicetree, as provided in the example
> above.
> 
>    Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
