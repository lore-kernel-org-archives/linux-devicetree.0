From: Jayachandran Chandrashekaran Nair
	<jayachandran.chandrashekaran-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/4] arm64: Broadcom Vulcan support
Date: Fri, 19 Feb 2016 12:28:26 +0530
Message-ID: <CAKc_7PXte5nmtFRv4cQXJSFuWtAWnrBazYQJAEejX8ifxXRaMQ@mail.gmail.com>
References: <1455389195-31870-1-git-send-email-jchandra@broadcom.com>
 <1455389195-31870-2-git-send-email-jchandra@broadcom.com> <20160217171616.GH32647@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160217171616.GH32647@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Zi Shen Lim <zlim-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 17, 2016 at 10:46 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi,
>
> On Sun, Feb 14, 2016 at 12:16:32AM +0530, Jayachandran C wrote:
>> From: Zi Shen Lim <zlim-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>
>> +     compatible = "brcm,vulcan-eval", "brcm,vulcan";
>
> You use "brcm,vulcan" as the compatible string for both the platform and
> the CPU nodes. You need different strings.
>
>> +
>> +     memory {
>> +             device_type = "memory";
>> +             reg = <0x00000000 0x80000000 0x0 0x80000000>,  /* 2G @ 2G  */
>> +                   <0x00000008 0x80000000 0x0 0x80000000>;  /* 2G @ 34G */
>> +     };
>
>> +/memreserve/ 0x80000000 0x00010000;
>
> What is this for?

This seems to left over from the time we were using spin. Will take
it out. Thanks.

>> +
>> +/ {
>> +     model = "Broadcom Vulcan";
>> +     compatible = "brcm,vulcan";
>
> As above, it doesn't make sense to have the same compatible string for
> both the platform as a whole and the CPU.

Will fix this in v2.

>> +                     device_type = "cpu";
>> +                     compatible = "brcm,vulcan", "arm,armv8";
>> +                     reg = <0x0 0x0>;
>> +                     enable-method = "psci";
>> +             };

Thanks for the review.

JC.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
