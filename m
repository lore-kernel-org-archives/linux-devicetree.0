From: "Wu, Songjun" <Songjun.Wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH v9 0/2] [media] atmel-isc: add driver for Atmel ISC
Date: Mon, 15 Aug 2016 15:47:21 +0800
Message-ID: <160e313b-9a3e-2ca7-93cd-ef23eb412535@microchip.com>
References: <1470899202-13933-1-git-send-email-songjun.wu@microchip.com>
 <676111f8-e179-b2cc-4792-cd4304995e31@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <676111f8-e179-b2cc-4792-cd4304995e31-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, =?UTF-8?Q?Niklas_S=c3=83=c2=b6derlund?= <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kamil Debski <kamil-MZ2JYD8fkKLYtjvyW6yDsg@public.gmane.org>, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mikhail Ulyanov <mikhail.ulyanov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, =?UTF-8?Q?Richard_R=c3=b6jfors?= <richard-hy+oXTTr619xRVliYXHCzg@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Simon Horman <horms+renesas>
List-Id: devicetree@vger.kernel.org



On 8/15/2016 15:34, Hans Verkuil wrote:
> On 08/11/2016 09:06 AM, Songjun Wu wrote:
>> The Image Sensor Controller driver includes two parts.
>> 1) Driver code to implement the ISC function.
>> 2) Device tree binding documentation, it describes how
>>    to add the ISC in device tree.
>
> So close...
>
> Running checkpatch gives me:
>
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #133:
> new file mode 100644
>
> Can you make a patch adding an entry to MAINTAINERS? No need to repost the other
> two.
>
Thank you.
Nicolas or I will make a patch to add an entry to MAINTAINERS.

> Regards,
>
> 	Hans
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
