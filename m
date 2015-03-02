From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] hwrng: iproc-rng200 - Add Broadcom IPROC RNG driver
Date: Mon, 2 Mar 2015 11:41:05 -0800
Message-ID: <54F4BCD1.2020401@broadcom.com>
References: <1424888184-22180-3-git-send-email-sbranden@broadcom.com> <2093191.gujNGSl66k@wuerfel> <54F1E647.10106@broadcom.com> <2555599.AxGoQ20pkj@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2555599.AxGoQ20pkj@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Thanks for the suggested change.

On 15-02-28 11:31 AM, Arnd Bergmann wrote:
> On Saturday 28 February 2015 08:01:11 Scott Branden wrote:
>>> The udelay(10) that the other drivers have seems about appropriate then,
>>> and we can independently think of a way to refine the interface.
>>> Please add a comment that explains the rate. Also, is there some kind
>>> of FIFO present in the hwrng device? If it can store close to 1ms work
>>> of data (1000 bits), you can just use an msleep(1) to wait for the
>>> pool to recover.
>> FIFO is 512 bits.  I will look as to whether we can live with 1/2
>> throughput.
>
> In that case, I think usleep_range(min(len * 8, 500), 500)) would be
> a good compromise: it waits at most until the fifo is full, but might
> return earlier if enough bits are available to fulfill the request.
OK, will change in next version.
>
> 	Arnd
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
