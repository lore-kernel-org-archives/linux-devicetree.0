From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] c6x: Convert to using %pOF instead of full_name
Date: Wed, 23 Aug 2017 13:11:17 -0500
Message-ID: <CAL_Jsq+FUAhv_W3uqhKWC+M0EcqQJ91B=YcerefY564twfLcBA@mail.gmail.com>
References: <20170718214339.7774-3-robh@kernel.org> <1500486128.14060.7.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500486128.14060.7.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Aurelien Jacquiot <jacquiot.aurelien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-c6x-dev-jPsnJVOj+W6hPH1hqNUYSQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 19, 2017 at 12:42 PM, Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On Tue, 2017-07-18 at 16:42 -0500, Rob Herring wrote:
>> Now that we have a custom printf format specifier, convert users of
>> full_name to use %pOF instead. This is preparation to remove storing
>> of the full path string for each node.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> Cc: Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>
>> Cc: linux-c6x-dev-jPsnJVOj+W6hPH1hqNUYSQ@public.gmane.org
>> ---
>>  arch/c6x/platforms/megamod-pic.c | 22 +++++++++++-----------
>>  arch/c6x/platforms/plldata.c     |  4 ++--
>>  arch/c6x/platforms/timer64.c     |  8 ++++----
>>  3 files changed, 17 insertions(+), 17 deletions(-)
>
> For the c6x bits:
> Acked-by: Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Please take this thru the c6x tree.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
