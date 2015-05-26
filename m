From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3.1 4/4] of/platform: Use platform_device interface
Date: Tue, 26 May 2015 09:26:48 +0200
Message-ID: <CAPybu_0n5=TQKXXY1N+znjJ6yqX5nJHbAv__a2csQGNA66_X4A@mail.gmail.com>
References: <1429719261-18024-1-git-send-email-ricardo.ribalda@gmail.com>
 <1429719261-18024-5-git-send-email-ricardo.ribalda@gmail.com> <20150524192915.GA7170@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150524192915.GA7170-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Greg

Sorry for the mess. I did not want to spam the mailing list too much.

Repacking and resending. Thanks!

On Sun, May 24, 2015 at 9:29 PM, Greg Kroah-Hartman
<gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Fri, May 15, 2015 at 01:52:10PM +0200, Ricardo Ribalda Delgado wrote:
>> of_platform_device_create_pdata() was using of_device_add() to create
>> the devices, but of_platform_device_destroy was using
>> platform_device_unregister() to free them.
>>
>> of_device_add(), do not call insert_resource(), which initializes the
>> parent field of the resource structure, needed by release_resource(),
>> called by of_platform_device_destroy(). This leads to a NULL pointer
>> deference.
>>
>> Instead of fixing the NULL pointer deference, what could hide other bugs,
>> this patch, replaces of_device_add() with platform_device_data().
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>
>> v3.1 Fix comments by Rob Herring, thanks!
>
> 3.1?
>
> Please resend the whole series, this is a mess, I can't find where this
> goes at all...
>
> greg k-h



-- 
Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
