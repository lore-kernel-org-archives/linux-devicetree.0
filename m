From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: tvp7002: add OF support
Date: Fri, 12 Jul 2013 00:04:38 +0200
Message-ID: <51DF2BF6.30509@gmail.com>
References: <1371923055-29623-1-git-send-email-prabhakar.csengg@gmail.com> <1371923055-29623-3-git-send-email-prabhakar.csengg@gmail.com> <51D05568.3090009@gmail.com> <CA+V-a8sW+D8trces5AXu__Lw9F7TO6fCcQW+LGZKRhA41uOEfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+V-a8sW+D8trces5AXu__Lw9F7TO6fCcQW+LGZKRhA41uOEfw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, LMML <linux-media@vger.kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LKML <linux-kernel@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sakari Ailus <sakari.ailus@iki.fi>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/11/2013 07:09 PM, Prabhakar Lad wrote:
[...]
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/tvp7002.tx=
t
>>> b/Documentation/devicetree/bindings/media/i2c/tvp7002.txt
>>> new file mode 100644
>>> index 0000000..9daebe1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/i2c/tvp7002.txt
>>> @@ -0,0 +1,43 @@
>>> +* Texas Instruments TV7002 video decoder
>>> +
[...]
>>> +
>>> +- ti,tvp7002-fid-polarity: Active-high Field ID polarity of the en=
dpoint.
>>
>> I thought it was agreed 'field-even-active' would be used instead of
>> this device specific property. Did you run into any issues with that=
 ?
>>
>>
> Argh I some how missed it out, sorry this should be 'field-even-activ=
e'

OK.

>> And include/media/tvp70002.h:
>>
>>   * fid_polarity:
>>   *                      0 ->  the field ID output is set to logic 1=
 for an
>> odd
>>   *                           field (field 1) and set to logic 0 for=
 an even
>>   *                           field (field 0).
>>   *                      1 ->  operation with polarity inverted.
>>
>>
>> Do you know if the chip automatically selects video sync source
>> (sync-on-green
>> vs. VSYNC/HSYNC) and there is no need to configure this on the analo=
gue
>> input
>> side ? At least the driver seems to always select the default SOGIN_=
1 input
>> (TVP7002_IN_MUX_SEL_1 register is set only at initialization time).
>>
> Yes the driver is selecting the default SOGIN_1 input.
>
>> Or perhaps it just outputs on SOGOUT, VSOUT, HSOUT lines whatever is=
 fed to
>> its analogue inputs, and any further processing unit need to determi=
ne what
>> synchronization signal is present and should be used ?
>>
>
> Yes that correct, there is a register (Sync Detect Status) which
> detects the sync for you.
>
>> I suspect that we don't need, e.g. another endpoint node to specify =
the
>> configuration of the TVP7002 analogue input interface, that would co=
ntain
>> a property like video-sync.
>>
>>
> If I understand correctly you mean if there are two tvp7002 devices c=
onnected
> we don=92t need to specify video-sync property, but my question how d=
o we
> specify this property in common then ?

No, I thought about two port sub-nodes of a single device node, one for=
 the
TVP7002 video input and one for the output. But it seems there is no ne=
ed
for that, i.e. to specify the input configuration statically in the=20
firmware.
The chip detects the signals automatically, i.e. it uses whatever is=20
available,
and it allows querying the selection status at run time. What would rea=
lly
need to be configured statically in DT in that case then ? Some initial=
=20
video
sync configuration ? I guess it could be well hard coded in the driver,=
=20
since
the hardware does run time detection anyway.

It there are real use cases I gues we could add video-sync property or=20
similar,
besides the existing signal polarity properties.

--
Thanks,
Sylwester
