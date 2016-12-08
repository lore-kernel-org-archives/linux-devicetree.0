From: Christopher Bostic <christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 04/16] drivers/fsi: Add fsi master definition
Date: Thu, 8 Dec 2016 16:49:06 -0600
Message-ID: <CAA0LjjUOuQXW_pJ0yM=vtKKS09Y-oALUvhF9KPDzx0GF+Xkmew@mail.gmail.com>
References: <1481076574-54711-1-git-send-email-christopher.lee.bostic@gmail.com>
 <20161207090610.GB14742@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161207090610.GB14742-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, Open List OF Flattened dev tree bindings <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Moderated list: ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Linux open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 7, 2016 at 3:06 AM, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Tue, Dec 06, 2016 at 08:09:30PM -0600, Chris Bostic wrote:
>> From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
>>
>> Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/fsi/fsi-core.c   | 20 ++++++++++++++++++++
>>  drivers/fsi/fsi-master.h | 37 +++++++++++++++++++++++++++++++++++++
>>  2 files changed, 57 insertions(+)
>>  create mode 100644 drivers/fsi/fsi-master.h
>>
>> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
>> index 3d55bd5..ce9428d 100644
>> --- a/drivers/fsi/fsi-core.c
>> +++ b/drivers/fsi/fsi-core.c
>> @@ -17,6 +17,26 @@
>>  #include <linux/fsi.h>
>>  #include <linux/module.h>
>>
>> +#include "fsi-master.h"
>> +
>> +static atomic_t master_idx = ATOMIC_INIT(-1);
>
> You don't really want/need an atomic variable, please use the simple ida
> interface instead.

Greg,

Will make the change to simple ida interface.

Thanks for your feedback,
Chris

>
> thanks,
>
> greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
