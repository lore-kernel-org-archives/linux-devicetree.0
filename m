From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v8] watchdog: ts4800: add driver for TS-4800 watchdog
Date: Wed, 23 Dec 2015 08:11:17 -0800
Message-ID: <567AC7A5.1050005@roeck-us.net>
References: <1449592648-22701-1-git-send-email-damien.riegel@savoirfairelinux.com>
 <20151223154359.GA6265@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151223154359.GA6265@localhost>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/23/2015 07:43 AM, Damien Riegel wrote:
> On Tue, Dec 08, 2015 at 11:37:28AM -0500, Damien Riegel wrote:
>> This watchdog is instantiated in a FPGA that is memory mapped. It is
>> made of only one register, called the feed register. Writing to this
>> register will re-arm the watchdog for a given time (and enable it if it
>> was disable). It can be disabled by writing a special value into it.
>>
>> It is part of a syscon block, and the watchdog register offset in this
>> block varies from board to board. This offset is passed in the syscon
>> property after the phandle to the syscon node.
>>
>> Signed-off-by: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>
> Hi Guenter,
>
>
> You have reviewed this patch but not picked it up in your tree. Shall I
> expect Wim to pick it up directly for the next merge window? The board
> would be quite useless without its watchdog driver.
>
My tree is in pretty bad shape right now; It includes some older patches
which have to be replaced. I'll have to rebase it against Wim's tree
and clean it up. Hope I can do that before the weekend.

But, yes, of course, Wim can pick up your patch directly.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
