From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/1] arm64: dts: r8a7795: add IMR-LX4 support
Date: Sun, 19 Feb 2017 20:58:19 +0300
Message-ID: <d685231a-4509-7728-0f68-29d13703db27@cogentembedded.com>
References: <20170214210301.620322370@cogentembedded.com>
 <3f007932-d120-b0c0-2080-ce8eeb9418af@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3f007932-d120-b0c0-2080-ce8eeb9418af-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Konstantin Kozhevnikov <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/15/2017 12:45 PM, Sergei Shtylyov wrote:

>> Describe the IMR-LX4 devices in the R8A7795 device tree.
>>
>> Based on the original (and large) patch by Konstantin Kozhevnikov
>> <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>.
>>
>> Signed-off-by: Konstantin Kozhevnikov
>> <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>
>> ---
>> This patch is against the 'renesas-devel-20170213-v4.10-rc8' tag of Simon
>> Horman's 'renesas.git' repo.
>
>    The binding was documented in the IMR driver patch. I don't expect it to
> change even if the driver would be rewritten for DRM.
>
> [...]
>> Index: renesas/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> ===================================================================
>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> @@ -1419,6 +1419,38 @@
>>              status = "disabled";
>>          };
>>
>> +        imr-lx4@fe860000 {
>> +            compatible = "renesas,imr-lx4";
>
>    The manual seems to suggest that IMR-LX4 devicec are different between 7795

    Devices, of course. :-)

> and 7796 SoCs, so we may need SoC specific compatibility. I'll look into this...

    Found no difference between 7795/7796 (other than performance).

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
