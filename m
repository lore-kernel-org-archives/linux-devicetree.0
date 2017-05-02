From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC] Documentation/devicetree: Add specification for FSI
 busses
Date: Tue, 2 May 2017 14:25:49 +0800
Message-ID: <3f346df4-b621-f2bd-0592-5016f5870865@ozlabs.org>
References: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
 <CACPK8Xf2regdT4Y-TW4nOc1qYwDcH=zYPRqdjTqL9yvZH49bRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8Xf2regdT4Y-TW4nOc1qYwDcH=zYPRqdjTqL9yvZH49bRA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Joel,

> Looks good to me Jeremy. One small question on the description, but
> please add Acked-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> to future
> revisions.

Thanks for the review!

>> +The FSI bus is probe-able, so Linux is able to enumerate FSI slaves, and
>> +engines within those slaves. However, we have a facility to match devicetree
>> +nodes to probed engines. This allows for fsi engines to expose non-probeable
>> +busses, which are then exposed by the device tree. For example, a FSI engine
> 
> A nit: Can we can expose any device as part of the engine, not just a bus?

Absolutely. I'll clarify in a future version. Something like:

  This allows for fsi engines to expose non-probeable busses, or for
  drivers to access extra device properties, by data described in the
  device tree.

Cheers,


Jeremy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
