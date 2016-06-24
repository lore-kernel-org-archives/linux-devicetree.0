From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v5 2/5] ARM: davinci: da8xx: Add CFGCHIP syscon platform
 declaration.
Date: Fri, 24 Jun 2016 11:00:24 -0500
Message-ID: <576D5918.40906@lechnology.com>
References: <1462837612-7803-1-git-send-email-david@lechnology.com>
 <1462837612-7803-3-git-send-email-david@lechnology.com>
 <7e0373cf-2ae9-e205-2226-0ded6894b709@cogentembedded.com>
 <57320FE6.60003@lechnology.com> <5745893C.5040603@ti.com>
 <576AC5CD.2010107@lechnology.com> <576CCFE9.7020005@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <576CCFE9.7020005-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

>>
>> Re: USB needing fixed, I'm not sure how to do this and I won't have time
>> for at least the next 2 or 3 months to do anything about it. The problem
>> is that the MUSB can't detect the ID pin. As a workaround, it is
>> detecting the VBUS state and using that to determine the ID pin state.
>> So, when you attach a self-powered device, it tells the VBUS to turn
>> off, which in turn triggers the workaround to say that the ID pin has
>> changed state.
>
> I seem to be missing the original problem report. Can you provide a link
> to the discussion?
>
> Thanks,
> Sekhar
>

Here is the thread: https://lkml.org/lkml/2016/5/9/942
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
