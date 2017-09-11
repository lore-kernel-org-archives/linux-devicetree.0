From: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 10/13] openrisc: add simple_smp dts and defconfig for simulators
Date: Tue, 12 Sep 2017 07:55:18 +0900
Message-ID: <CAAfxs76zOKM3vs=9_vwpNnceua-THV=h6Y4xAtg-kU=wpRq46g@mail.gmail.com>
References: <cover.1504129273.git.shorne@gmail.com> <37f0d48de4690694c18be3d32483dafee0730859.1504129273.git.shorne@gmail.com>
 <20170911223712.GA31546@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170911223712.GA31546@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Openrisc <openrisc-cunTk1MwBs9a3B2Vnqf2dGD2FQJk+8+b@public.gmane.org>, Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 12, 2017 at 7:37 AM, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org> wrote:
> On Thu 2017-08-31 07:03:11, Stafford Horne wrote:
>> From: Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>
>>
[...]
>> +++ b/arch/openrisc/boot/dts/simple_smp.dts
>> @@ -0,0 +1,58 @@
>> +/dts-v1/;
>> +/ {
>> +     compatible = "opencores,or1ksim";
>
> You may want to add some comment on top, explaining what this
> is... and perhaps link to some page documenting how to set up
> qemu/FPGAs?

Sure, I can create an entry in Documentation/devicetree/binding
documenting this since its been there for a while but was never properly
documented.

But, just to be clear, what do you mean by page?  Are you suggesting
linking to a web page?  Or do you mean something in Documentation/...?

-Stafford
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
