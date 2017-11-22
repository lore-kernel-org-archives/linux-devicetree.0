From: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patches] Re: [PATCH] dt-bindings: Add a RISC-V SBI firmware node
Date: Tue, 21 Nov 2017 16:36:22 -0800 (PST)
Message-ID: <mhng-40a689c5-fa7b-4cff-9739-555b7c65981f@palmer-si-x1c4>
References: <20171121200832.d55khzcufo2owcff@latitude>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171121200832.d55khzcufo2owcff@latitude>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 21 Nov 2017 12:08:32 PST (-0800), j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org wrote:
> On Tue, Nov 21, 2017 at 09:37:02AM -0800, Palmer Dabbelt wrote:
> [...]
>> This isn't really a big deal to me, as I'm only interested in RISC-V
>> systems, but there's been some pushback on the concept of an SBI so it
>> seemed like a simple way to allow people to build non-SBI (and there for not
>> really RISC-V) systems.
>
> For those reading along: I suggested the /firmware/sbi node to Palmer,
> because I'm interested in such "not really RISC-V" systems, (because it
> makes the firmware's job easier to not implement the SBI — speaking with
> my coreboot hat, here.)
>
>> One option that wouldn't require a device tree node
>> would be to have Linux boot in machine mode [...] and then provide its
>> own SBI implementation.
>
> I think this can work.

OK, sounds good!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
