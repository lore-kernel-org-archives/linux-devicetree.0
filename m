From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: Re: [RFC PATCH 0/9] dt: dependencies (for deterministic driver initialization
 order based on the DT)
Date: Wed, 27 Aug 2014 20:14:01 +0200
Message-ID: <53FE1FE9.6070109@ahsoftware.de>
References: <20140825133714.GH4163@ulmo.nvidia.com> <20140826084208.AE5F0C40989@trevor.secretlab.ca> <20140826084922.GG17263@ulmo> <53FC566C.30904@ahsoftware.de> <20140826101107.GC32315@leverpostej> <20140827103432.64927C409CB@trevor.secretlab.ca> <20140827144403.GB13850@arm.com> <53FE05AE.9000406@wwwdotorg.org> <53FE07BE.7000809@ahsoftware.de> <53FE0966.5020206@wwwdotorg.org> <20140827175243.GJ13850@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140827175243.GJ13850-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 27.08.2014 19:52, schrieb Catalin Marinas:

>> Irrespective though, a new kernel needs to work against an old DT,
>
> I fully agree. But we shouldn't really extend the "old DT" statement to
> a new ARMv8 SoC ;).

Or any new v7 SoC. And even poor users of current ARM HW do want use 
their HW. And they don't care if they have to change the DT if they 
finally are able to use their board, which happens seldom enough. (I'm 
not speaking about companies which are able to spend many man-years to 
fix one kernel version for use with one specific HW).

Regards,

Alexander Holler
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
