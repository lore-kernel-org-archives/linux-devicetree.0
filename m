From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/5] ARM: dts: add reference voltage property for MXS
 LRADC
Date: Fri, 26 Jul 2013 11:23:23 +0200
Message-ID: <51F2400B.1060701@free-electrons.com>
References: <1374501843-19651-1-git-send-email-hector.palacios@digi.com> <1374501843-19651-3-git-send-email-hector.palacios@digi.com> <51ED7B47.2090104@metafoo.de> <201307230006.53434.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201307230006.53434.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23/07/2013 00:06, Marek Vasut wrote:
> Dear Lars-Peter Clausen,
>
>> On 07/22/2013 04:04 PM, Hector Palacios wrote:
>>> Some LRADC channels have fixed pre-dividers so they can measure
>>> different voltages at full scale. The reference voltage allows to
>>> expose a scaling attribute through the IIO sysfs so that a user can
>>> compute the real voltage out of a measured sample value.
>> I've said before that I'm not convinced that this is the right way to
>> implement this. And considering what Thomas said here
>> http://www.mail-archive.com/devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org/msg36691.ht
>> ml I guess I'm not alone with that opinion.
>>
>> - Lars
> He's talking about different versions of the IP block, this is the same IP 
> block, just connected to different inputs.

I don't have any strong opinion on that and I'm certainly not an expert
but thinking about that, I feel this is different from the discussion
Thomas had. Those are reference voltages and describe how the IP block
is connected whereas what Thomas was describing is supporting multiple
versions of an IP block by describing heaps of registers in the DT. It
may look ugly here because you have a lot of channels but I find that
quite acceptable.

Regards,

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
