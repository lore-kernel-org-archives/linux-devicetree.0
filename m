From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/7] MIPS: Add support for OCTEON cn78xx and cn73xx.
Date: Thu, 04 Feb 2016 17:31:55 -0800
Message-ID: <56B3FB8B.1050001@gmail.com>
References: <1454632974-7686-1-git-send-email-ddaney.cavm@gmail.com> <20160205012235.GF1620@darkstar.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160205012235.GF1620-4/PLUo9XfK9owWHViPbQSXlKr5M7+etX9Sl0XMgJPXI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/04/2016 05:22 PM, Aaro Koskinen wrote:
> Hi,
>
> On Thu, Feb 04, 2016 at 04:42:47PM -0800, David Daney wrote:
>> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>
>> The OCTEON III cn78xx and cn73xx family of SoCs has some architectural
>> differences from previous OCTEON processors.
>
> Did you test this series also on older OCTEONs? A lot of common files
> seems to be modified, so it would be good to describe how it was tested.
>

Yes, I tried to be very careful not to break things that already work.

Tested on:

  CN7890 -- OCTEON III
  CN7360 -- OCTEON III
  CN5750 -- OCTEON Plus


In the case of CN5750, I booted a full Debian system from the on-board 
CF with no problem.

In any event, this is code that we have been running internally across 
all OCTEON models for several years.

David.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
