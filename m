From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: juno: update definition for programmable
 replicator.
Date: Tue, 21 Feb 2017 13:53:00 +0000
Message-ID: <2c0e2e3a-f852-7184-036f-536d94e80c23@arm.com>
References: <1487358790-2618-1-git-send-email-mike.leach@linaro.org>
 <2ba59da5-fc79-ab53-2f2a-2ddc6e5e9c3d@arm.com>
 <DB6PR0802MB219850A35C8DAD5CB2858C1C8C510@DB6PR0802MB2198.eurprd08.prod.outlook.com>
 <798053cd-ae5a-dc04-12c9-9df9e0d66b4d@arm.com>
 <CAJ9a7VhKtS-nrSBWQzMWkO1E1BajZY2aGBurdRAB05tGy2xs9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJ9a7VhKtS-nrSBWQzMWkO1E1BajZY2aGBurdRAB05tGy2xs9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Mike Leach <Mike.Leach-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mike,

On 21/02/17 12:46, Mike Leach wrote:
> The messages are not a normal linux / kernel warning message, but a
> result of the offline trace decode process:-
> 
>   110739: I_OVERFLOW : Overflow.
>   110741: I_ASYNC : Alignment Synchronisation.
>   110754: I_TRACE_INFO : Trace Info.; PCTL=0x0
>   110757: I_TRACE_ON : Trace On.
> 
> If this is sufficient with an explanation I'm happy to add it to the patch.
> 

Oh OK, then no need to add to changelog as it requires the knowledge of
this tool to understand which is not part of the kernel tree. I will try
to push it as a fix and lets see how that goes.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
