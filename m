From: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patches] Re: [PATCH] dt-bindings: Add an enable method to RISC-V
Date: Tue, 21 Nov 2017 09:41:14 -0800 (PST)
Message-ID: <mhng-caa01618-0bb9-441c-9ed1-9baf49b86a20@palmer-si-x1c4>
References: <20171120214709.oss7rrtijw2cyjmw@rob-hp-laptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171120214709.oss7rrtijw2cyjmw@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 20 Nov 2017 13:47:09 PST (-0800), robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org wrote:
> On Mon, Nov 20, 2017 at 11:50:22AM -0800, Palmer Dabbelt wrote:
>> RISC-V doesn't currently specify a mechanism for enabling or disabling
>> CPUs.  Instead, we assume that all CPUs are enabled on boot, and if
>> someone wants to save power we instead put a CPU to sleep via a WFI
>> loop.
>>
>> This patch adds "enable-method" to the RISC-V CPU binding, which
>> currently only has the value "none".  This allows us to change the
>> enable method in the future.
>
> I think "none" should just be no cpu-enable-method property.

I'm OK with that.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
