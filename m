From: Shubhrajyoti Datta <shubhrajyoti.datta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2 2/2] gpio: xilinx: Add clock support
Date: Thu, 10 Nov 2016 11:38:44 +0530
Message-ID: <CAKfKVtEiUqOCnerqY1ETNR_nN=vAhWtNyxhpDuUP6inS3T_08A@mail.gmail.com>
References: <1478668191-26322-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1478668191-26322-2-git-send-email-shubhrajyoti.datta@xilinx.com>
 <20161109062734.GX14444@xsjsorenbubuntu> <CAKfKVtGxaWYEVPaU_G0Z7HJm4_ZAcTisZBj-BtSmAdL1+w+7xw@mail.gmail.com>
 <20161109171852.GC14444@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161109171852.GC14444@xsjsorenbubuntu>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 9, 2016 at 10:48 PM, S=C3=B6ren Brinkmann
<soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
[...]
>>
>> My idea was to keep the clk name optional since there is only one clock.
>> Or do you think we should mandate the name if clk is provided.
>
> I'd make 'clock-names' mandatory if 'clocks' is present. That way there
> won't be any trouble if this IP ever consumed additional clocks in the
> future.
fixed that in v3.

Thanks
>
>         S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
