From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 5/8] dt-bindings: fsi: Add OCC documentation
Date: Mon, 20 Nov 2017 17:41:45 -0600
Message-ID: <CAL_JsqLj_Lag-6c67=fuaTuaPhs18u=y8Su+Tu7ga1gFZV+voQ@mail.gmail.com>
References: <1511207217-14075-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1511207217-14075-6-git-send-email-eajames@linux.vnet.ibm.com>
 <20171120213913.6j7qgcgobc2ocqey@rob-hp-laptop> <647df116-c434-ae4e-8a16-54145f57ab5c@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <647df116-c434-ae4e-8a16-54145f57ab5c-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, bradleyb-r5pk2Da7Bxt8sGd51Jp2sdBPR1lH4CV8@public.gmane.org, Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 20, 2017 at 4:03 PM, Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
>
>
> On 11/20/2017 03:39 PM, Rob Herring wrote:
>>
>> On Mon, Nov 20, 2017 at 01:46:54PM -0600, Eddie James wrote:
>>>
>>> From: "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
>>>
>>> Document the bindings for the P9 OCC device. OCC devices are accessed
>>> through the SBEFIFO.
>>>
>>> Signed-off-by: Edward A. James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt | 18
>>> ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>>> b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>>> new file mode 100644
>>> index 0000000..79094f5
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>>> @@ -0,0 +1,18 @@
>>> +Device-tree bindings for P9 On-Chip Controller
>>> +----------------------------------------------
>>> +
>>> +The POWER9 On-Chip Controller is accessed through the SBEFIFO. All OCC
>>> nodes
>>> +must be child nodes of SBEFIFO devices (see ibm,p9-sbefifo.txt).
>>> +
>>> +Required properties:
>>> + - compatible = "ibm,p9-occ";
>>> +
>>> +Optional properties:
>>> + - reg = <processor index>;    : Index for the processor this OCC is on.
>>
>> reg should be how the parent (SBEFIFO) addresses this device. Would all
>> of these child devices be a unique processor?
>
>
> Yes. The "processor" here is indicating which P9 processor in the system,
> not whatever processor(s) this kernel is running on. We use this device tree
> on the service processor, which can be talking to multiple P9 chips (over
> SBEFIFO). This could probably be clarified by saying "P9 chip" or something.

Ah, okay.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
