From: Jeppe Ledet-Pedersen <jlp-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: add Cypress FM33256B Processor Companion driver
Date: Tue, 26 Apr 2016 16:42:40 +0200
Message-ID: <571F7E60.9040106@gomspace.com>
References: <1461150471-23163-1-git-send-email-jlp@gomspace.com>
 <1461150471-23163-2-git-send-email-jlp@gomspace.com>
 <20160422193232.GA9737@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160422193232.GA9737@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22/04/16 21:32, Rob Herring wrote:
> On Wed, Apr 20, 2016 at 01:07:49PM +0200, Jeppe Ledet-Pedersen wrote:
[snip]
>> +
>> +The MFD exposes two subdevices:
>> +- The FRAM: "cypress,fm33256b-fram"
>> +- The RTC: "cypress,fm33256b-rtc"
>> +
>> +Example:
>> +
>> +spi1: spi@f800800 {
>> +	status = "okay";
>> +	cs-gpios = <&pioC 25 0>;
>> +
>> +	fm33256b@0 {
>> +		compatible = "cypress,fm33256b";
>> +		spi-max-frequency = <10000000>;
>> +		cypress,charge-enabled;
>> +		cypress,charge-fast;
>> +		reg = <0>;
>> +	};
> 
> Where's the 2nd sub device?

Hi Rob,

Right now I just add the two sub-devices using mfd_add_devices in the
fm33256b_probe function in my MFD driver. Would it be better to check
for compatible child nodes before adding each sub-device, like it's done
in drivers/mfd/tc3589x.c?

Thanks,

-Jeppe


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
