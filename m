From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'"
 breaks console on tty0
Date: Mon, 16 Mar 2015 19:12:28 +0100
Message-ID: <55071D0C.2050700@redhat.com>
References: <55070544.9010908@redhat.com> <550717A0.3060603@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550717A0.3060603-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 16-03-15 18:49, Peter Hurley wrote:
> Hi Hans,
>
> On 03/16/2015 12:31 PM, Hans de Goede wrote:
>> Hi All,
>>
>> While updating my local working tree to 4.0-rc4 this morning I noticed that I no longer
>> get console / kernel messages output on the hdmi output of my ARM board / on tty0
>>
>> This is caused by:
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/of?id=2fa645cb2703d9b3786d850db815414dfeefa51d
>>
>> Reverting this commit fixes this for me.
>>
>> What is happening here is that the "add_preferred_console("stdout-path", 0, NULL);"
>> happens before the tty0 registers stopping tty0 from becoming part of the console list
>> since there already is a preferred console at that time.
>>
>> This is an undesirable behavior change caused by the commit in question, on boards
>> where there is both video output, and a serial console configured through stdout-path
>> we want to have console output on both as we do not know which of the 2 will actually
>> be hooked up by the user.
>
> I don't see this as a regression, but rather a misconfiguration.

As said it is an undesirable behavior change, whether you want to call that a regression
or not is not all that interesting. Fixing it however is important, as e.g. Fedora
ARM images rely on this behavior, both "regular" arm as well as aarch64.

> 1. Your DT indicates the stdout device is a serial console; that is
>     the expected outcome. Here's what ePAPR has to say on the chosen/stdout-path
>     property node:
>
>     "A string that specifies the full path to the node representing the device to be
>     used for boot console output. If the character ":" is present in the value it
>     terminates the path. The value may be an alias."
>
>     If the serial console is not the stdout device then the DT should not
>     claim it is.
>
> 2. The tty0 console is not now, and has never been, always enabled.
>
>     The tty0 console is only enabled when either,
>       a) there is no other console
>       b) when specified on the command line (ie., "console=tty0") or
>          by prom/dt.
>
>     Your situation is akin to adding the serial console to the command line; if
>     "console=tty0" is not also explicitly added, there is no boot console output
>     to tty0.
>
> 3. This same breakage will happen if any other device registers a console matching
>     the stdout-path at console_init() time (ie, with console_initcall() macro) before
>     the dummy console. The order in which consoles are inited via console_initcall()
>     is dependent on link order, so essentially not controllable across different
>     subsystems (or if there were consoles defined with the arch itself).
>
> That said, I'll look into fixing your use-case automagically without requiring
> configuration changes.

Thanks!

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
