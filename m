From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'"
 breaks console on tty0
Date: Tue, 17 Mar 2015 11:11:05 +0100
Message-ID: <5507FDB9.1080309@redhat.com>
References: <55070544.9010908@redhat.com> <550717A0.3060603@hurleysoftware.com> <87r3sowk51.fsf@igel.home> <5507E4FC.1060005@redhat.com> <20150317100917.GM4278@bivouac.eciton.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150317100917.GM4278-t77nlHhSwNqAroYi2ySoxKxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andreas Schwab <schwab-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 17-03-15 11:09, Leif Lindholm wrote:
> On Tue, Mar 17, 2015 at 09:25:32AM +0100, Hans de Goede wrote:
>> On 17-03-15 01:19, Andreas Schwab wrote:
>>> Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org> writes:
>>>
>>>> I don't see this as a regression, but rather a misconfiguration.
>>>
>>> It breaks booting on PowerMac.
>>
>> Actually that is more likely to be caused by:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/of?id=106937e8ccdcf0f4b95fbf0fe9abd42766cade33
>
> If so, I would appreciate a test of my proposed fix:
> http://www.spinics.net/lists/stable/msg82878.html

Yeah I have testing that on my todo list for today :)

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
