From: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCHv3] arm64: dts: Add base stratix 10 dtsi
Date: Wed, 23 Sep 2015 17:43:25 -0500
Message-ID: <CADhT+wccWpy9VhZv=yWRiA4tf1SO_1-EAu6_cc+UkPJOWX0Bpw@mail.gmail.com>
References: <1442353625-4552-1-git-send-email-dinguyen@opensource.altera.com>
	<20150923055450.GA4883@svinekod>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150923055450.GA4883@svinekod>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 23, 2015 at 12:54 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>> +/ {
>> +     compatible = "altr,socfpga-stratix10";
>> +     #address-cells = <2>;
>> +     #size-cells = <2>;
>
> [...]
>
>> +     soc {
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>> +             compatible = "simple-bus";
>> +             device_type = "soc";
>> +             interrupt-parent = <&intc>;
>
> As far as I am aware, this requires a (non-empty) ranges property, given the
> parent node has {address,size}-cells = <2>.
>
> Does the kernel not complain currently?
>

I do not see any complaints without ranges here, but with ranges, I get:

DTC     arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb
Warning (ranges_format): /soc has empty "ranges" property but its
#address-cells (1) differs from / (2)
Warning (ranges_format): /soc has empty "ranges" property but its
#size-cells (1) differs from / (2)

Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
