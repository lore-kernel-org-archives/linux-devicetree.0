From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 3/3] of: support passing console options with stdout-path
Date: Thu, 26 Feb 2015 09:09:55 -0500
Message-ID: <54EF2933.3020408@hurleysoftware.com>
References: <1417110967-16284-1-git-send-email-leif.lindholm@linaro.org> <1417110967-16284-4-git-send-email-leif.lindholm@linaro.org> <54EF09AA.2080706@hurleysoftware.com> <20150226134646.GB8806@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150226134646.GB8806-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, ijc-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 02/26/2015 08:46 AM, Andrew Lunn wrote:
> On Thu, Feb 26, 2015 at 06:55:22AM -0500, Peter Hurley wrote:
>> On 11/27/2014 12:56 PM, Leif Lindholm wrote:
>>> Support specifying console options (like with console=ttyXN,<options>)
>>> by appending them to the stdout-path property after a separating ':'.
>>>
>>> Example:
>>>         stdout-path = "uart0:115200";
>>
>> This format breaks DT earlycon because libfdt doesn't recognize ':' as a
>> path terminator.
>>
>> It's simple enough to fix this directly in early_init_dt_scan_chosen_serial()
>> but perhaps it would better to teach fdt_path_offset() to recognize ':'?
> 
> Hi Peter
> 
> ePAPR says for stdout-path in Chosen:
> 
> A string that specifies the full path to the node representing the
> device to be used for boot console output. If the character ":" is
> present in the value it terminates the path. The value may be an
> alias.
> 
> So it is probably wise to implement this properly.

Sorry if I was unclear. My question was not _whether_ to fix this
for earlycon, but rather _how_.

IOW, is the ':' character accepted as a path terminator for
1. all nodes, so fix this in fdt_path_offset();
2. only chosen nodes;
3. unique to stdout-path, so fix this in early_init_dt_scan_chosen_serial()?

Regards,
Peter Hurley

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
