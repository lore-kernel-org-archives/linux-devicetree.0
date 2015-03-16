From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'"
 breaks console on tty0
Date: Mon, 16 Mar 2015 14:23:03 -0400
Message-ID: <55071F87.1050706@hurleysoftware.com>
References: <55070544.9010908@redhat.com> <550717A0.3060603@hurleysoftware.com> <55071D0C.2050700@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55071D0C.2050700-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/16/2015 02:12 PM, Hans de Goede wrote:
> Hi,
> 
> On 16-03-15 18:49, Peter Hurley wrote:
>> Hi Hans,
>>
>> On 03/16/2015 12:31 PM, Hans de Goede wrote:
>>> Hi All,
>>>
>>> While updating my local working tree to 4.0-rc4 this morning I noticed that I no longer
>>> get console / kernel messages output on the hdmi output of my ARM board / on tty0
>>>
>>> This is caused by:
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/of?id=2fa645cb2703d9b3786d850db815414dfeefa51d
>>>
>>> Reverting this commit fixes this for me.
>>>
>>> What is happening here is that the "add_preferred_console("stdout-path", 0, NULL);"
>>> happens before the tty0 registers stopping tty0 from becoming part of the console list
>>> since there already is a preferred console at that time.
>>>
>>> This is an undesirable behavior change caused by the commit in question, on boards
>>> where there is both video output, and a serial console configured through stdout-path
>>> we want to have console output on both as we do not know which of the 2 will actually
>>> be hooked up by the user.
>>
>> I don't see this as a regression, but rather a misconfiguration.
> 
> As said it is an undesirable behavior change, whether you want to call that a regression
> or not is not all that interesting. Fixing it however is important, as e.g. Fedora
> ARM images rely on this behavior, both "regular" arm as well as aarch64.

What dts file is causing this problem?
Is it in mainline or distributed only in Fedora?


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
