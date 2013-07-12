From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: tvp7002: add OF support
Date: Fri, 12 Jul 2013 10:13:41 +0530
Message-ID: <CA+V-a8u0G6m+VoSc4FPmDxEYmE_vQaL7zu3fUFk3iVKnOywnRA@mail.gmail.com>
References: <1371923055-29623-1-git-send-email-prabhakar.csengg@gmail.com>
 <1371923055-29623-3-git-send-email-prabhakar.csengg@gmail.com>
 <51D05568.3090009@gmail.com> <CA+V-a8sW+D8trces5AXu__Lw9F7TO6fCcQW+LGZKRhA41uOEfw@mail.gmail.com>
 <51DF2BF6.30509@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <51DF2BF6.30509@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, LMML <linux-media@vger.kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LKML <linux-kernel@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sakari Ailus <sakari.ailus@iki.fi>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 12, 2013 at 3:34 AM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> On 07/11/2013 07:09 PM, Prabhakar Lad wrote:
> [...]
>
>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/tvp7002.t=
xt
>>>> b/Documentation/devicetree/bindings/media/i2c/tvp7002.txt
>>>> new file mode 100644
>>>> index 0000000..9daebe1
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/i2c/tvp7002.txt
>>>> @@ -0,0 +1,43 @@
>>>> +* Texas Instruments TV7002 video decoder
>>>> +
>
> [...]
>
>>>> +
>>>> +- ti,tvp7002-fid-polarity: Active-high Field ID polarity of the
>>>> endpoint.
>>>
>>>
>>> I thought it was agreed 'field-even-active' would be used instead o=
f
>>> this device specific property. Did you run into any issues with tha=
t ?
>>>
>>>
>> Argh I some how missed it out, sorry this should be 'field-even-acti=
ve'
>
>
> OK.
>
>
>>> And include/media/tvp70002.h:
>>>
>>>   * fid_polarity:
>>>   *                      0 ->  the field ID output is set to logic =
1 for
>>> an
>>> odd
>>>   *                           field (field 1) and set to logic 0 fo=
r an
>>> even
>>>   *                           field (field 0).
>>>   *                      1 ->  operation with polarity inverted.
>>>
>>>
>>> Do you know if the chip automatically selects video sync source
>>> (sync-on-green
>>> vs. VSYNC/HSYNC) and there is no need to configure this on the anal=
ogue
>>> input
>>> side ? At least the driver seems to always select the default SOGIN=
_1
>>> input
>>> (TVP7002_IN_MUX_SEL_1 register is set only at initialization time).
>>>
>> Yes the driver is selecting the default SOGIN_1 input.
>>
>>> Or perhaps it just outputs on SOGOUT, VSOUT, HSOUT lines whatever i=
s fed
>>> to
>>> its analogue inputs, and any further processing unit need to determ=
ine
>>> what
>>> synchronization signal is present and should be used ?
>>>
>>
>> Yes that correct, there is a register (Sync Detect Status) which
>> detects the sync for you.
>>
>>> I suspect that we don't need, e.g. another endpoint node to specify=
 the
>>> configuration of the TVP7002 analogue input interface, that would c=
ontain
>>> a property like video-sync.
>>>
>>>
>> If I understand correctly you mean if there are two tvp7002 devices
>> connected
>> we don=92t need to specify video-sync property, but my question how =
do we
>> specify this property in common then ?
>
>
> No, I thought about two port sub-nodes of a single device node, one f=
or the
> TVP7002 video input and one for the output. But it seems there is no =
need
> for that, i.e. to specify the input configuration statically in the
> firmware.
> The chip detects the signals automatically, i.e. it uses whatever is
> available,
> and it allows querying the selection status at run time. What would r=
eally
> need to be configured statically in DT in that case then ? Some initi=
al
> video
> sync configuration ? I guess it could be well hard coded in the drive=
r,
> since
> the hardware does run time detection anyway.
>
Yes the chip detects the signal automatically, What I want to configure=
 in
the DT case is say if SOG signal is detected, I want to invert the pola=
rity
of it this is what I am trying to set in DT case whether to invert or n=
ot.
0 =3D Normal operation (default)
1 =3D SOG output polarity inverted

Something similar to fid_polarity.

Regards,
--Prabhakar Lad
