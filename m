From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v4 0/4] arm64:numa: Add numa support for arm64 platforms.
Date: Tue, 30 Jun 2015 19:52:05 +0530
Message-ID: <CAFpQJXX5yscE02QLcyBDcC+ccsTOBVMQJwOdMnritozRN7ysWA@mail.gmail.com>
References: <1421924755-26029-1-git-send-email-gkulkarni@caviumnetworks.com>
	<CAFpQJXXZc0sop601wrmTe5Ng0SiSGfT9AA2Dpf=X9bgGN9srrA@mail.gmail.com>
	<20150630140123.GL27725@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150630140123.GL27725-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Roy Franz <roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "ddutile-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <ddutile-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Prasun.Kapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org" <Prasun.Kapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, ddane
List-Id: devicetree@vger.kernel.org

Hi DT maintainers,

On Tue, Jun 30, 2015 at 7:31 PM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
> On Mon, Jun 29, 2015 at 11:57:49AM +0100, Ganapatrao Kulkarni wrote:
>> Hi Catalin, Will, Mark,
>>
>> can you please have a look of numa patches and share your review comments.
>
> Nothing has changed since the last time you poked me about this series:
>
>   - There are open comments from Hanjun
IIRC, already taken care, if any open points still, it will be taker
in next version.
>   - The device-tree part hasn't been reviewed by a DT maintainer
please review!
>
> so I can't merge anything other than the Kconfig change atm.
>
> Will

thanks
Ganapat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
