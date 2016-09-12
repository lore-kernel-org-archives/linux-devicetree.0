From: Shubhrajyoti Datta <shubhrajyoti.datta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv5] watchdog: xilinx: Add clock support
Date: Mon, 12 Sep 2016 15:19:38 +0530
Message-ID: <CAKfKVtFYEqz2Be81hBBX3Nb9kRR+4QUpdP5iJs88HoyYoC3-jQ@mail.gmail.com>
References: <1470984421-3494-1-git-send-email-shubhrajyoti.datta@xilinx.com> <20160812190123.GB16954@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160812190123.GB16954@rob-hp-laptop>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Aug 13, 2016 at 12:31 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Aug 12, 2016 at 12:17:01PM +0530, Shubhrajyoti Datta wrote:
>> Add support for the clock. Currently we enable
>> at probe and relinquish at remove.
>>
>> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>> Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> ---
>> v2:
>> fix spaces and error path.
>> v3
>> do not fail existing dts
>> v4:
>> fix the error prints as the clock is optional
>> v5:
>> remove some more prints
>>
>>  .../devicetree/bindings/watchdog/of-xilinx-wdt.txt |  3 +++
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

If there are no further comments can this be applied.

>
>>  drivers/watchdog/of_xilinx_wdt.c                   | 25 +++++++++++++++=
+++++--
>>  2 files changed, 26 insertions(+), 2 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
