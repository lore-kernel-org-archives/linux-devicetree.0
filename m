From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: mfd: Add bindings for ZII RAVE devices
Date: Thu, 20 Jul 2017 07:26:56 -0700
Message-ID: <CAHQ1cqE+GF88u0esFQXO_QdC3idoS+=N9HDaST0G6uVt2_XksQ@mail.gmail.com>
References: <20170718175604.11735-1-andrew.smirnov@gmail.com>
 <20170718175604.11735-3-andrew.smirnov@gmail.com> <20170720090446.gk5xxdimfrgj3tll@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170720090446.gk5xxdimfrgj3tll@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chris Healy <cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 20, 2017 at 2:04 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Where is patch 1?
>

lkml.kernel.org/r/20170718175604.11735-2-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

I dropped you from CC list to spare you the e-mail traffic, but I can
add you back if you'd prefer that.

>> Cc: cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>> Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Cc: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/mfd/zii,rave-sp.txt        | 39 ++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
>> new file mode 100644
>> index 000000000000..61d9105ded07
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
>> @@ -0,0 +1,39 @@
>> +Zodiac Inflight Innovations RAVE Supervisory Processor
>> +
>> +RAVE Supervisory Processor communicates with SoC over UART. It is
>> +expected that its device-tree node is specified as a child of a node
>
> Nit: Device Tree
>
> Once fixed, please apply my:
>
> For my own reference:
>   Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>

OK. Will do.

Thanks,
Andrey Smirnov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
