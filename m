From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/fdt: fix aliases with baudrate in earlycon
Date: Tue, 13 Oct 2015 15:16:15 -0500
Message-ID: <CAL_JsqJ-09qS8Db3EYs_+CWdssYiOf42BqcxV8qE3Z0+TXJY5A@mail.gmail.com>
References: <1444465770-3103-1-git-send-email-stefan@agner.ch> <5619090F.7040108@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5619090F.7040108-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 10, 2015 at 7:48 AM, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org> wrote:
> On 10/10/2015 04:29 AM, Stefan Agner wrote:
>> Many boards use an alias in the stdout-path specification along
>> with console options after a colon (e.g. serial0:115200n8). When
>> using earlycon, this specification currently does not work. While
>> fdt_path_offset supports alias resolution, it does not remove the
>> console options by itself. Use the fdt_path_offset_namelen variant
>> and provide the length of the alias to enable aliases with console
>> options in the stdout-path.
>>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>> ---
>> Hi,
>>
>> Stumbled upon this while testing 32-bit ARM earlycon support. It
>> seems that this once already came up on the list:
>> https://lkml.org/lkml/2015/3/13/562
>
> Yeah, looks like my patch got lost somewhere.
> https://lkml.org/lkml/2015/4/8/604

Sorry about that. I forgot about it after getting the dtc dependency
done I guess.

I've now applied this version.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
