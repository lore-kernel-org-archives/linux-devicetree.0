From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: tvp7002: add OF support
Date: Sun, 14 Jul 2013 21:42:58 +0200
Message-ID: <51E2FF42.2090507@gmail.com>
References: <1371923055-29623-1-git-send-email-prabhakar.csengg@gmail.com> <1371923055-29623-3-git-send-email-prabhakar.csengg@gmail.com> <51D05568.3090009@gmail.com> <CA+V-a8sW+D8trces5AXu__Lw9F7TO6fCcQW+LGZKRhA41uOEfw@mail.gmail.com> <51DF2BF6.30509@gmail.com> <CA+V-a8u0G6m+VoSc4FPmDxEYmE_vQaL7zu3fUFk3iVKnOywnRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+V-a8u0G6m+VoSc4FPmDxEYmE_vQaL7zu3fUFk3iVKnOywnRA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, LMML <linux-media@vger.kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LKML <linux-kernel@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sakari Ailus <sakari.ailus@iki.fi>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Prabhakar,

On 07/12/2013 06:43 AM, Prabhakar Lad wrote:
> On Fri, Jul 12, 2013 at 3:34 AM, Sylwester Nawrocki
> <sylvester.nawrocki@gmail.com>  wrote:
>> On 07/11/2013 07:09 PM, Prabhakar Lad wrote:
[...]
>>>> And include/media/tvp70002.h:
>>>>
>>>>    * fid_polarity:
>>>>    *                      0 ->   the field ID output is set to log=
ic 1 for
>>>> an
>>>> odd
>>>>    *                           field (field 1) and set to logic 0 =
for an
>>>> even
>>>>    *                           field (field 0).
>>>>    *                      1 ->   operation with polarity inverted.
>>>>
>>>>
>>>> Do you know if the chip automatically selects video sync source
>>>> (sync-on-green
>>>> vs. VSYNC/HSYNC) and there is no need to configure this on the ana=
logue
>>>> input
>>>> side ? At least the driver seems to always select the default SOGI=
N_1
>>>> input
>>>> (TVP7002_IN_MUX_SEL_1 register is set only at initialization time)=
=2E
>>>>
>>> Yes the driver is selecting the default SOGIN_1 input.
>>>
>>>> Or perhaps it just outputs on SOGOUT, VSOUT, HSOUT lines whatever =
is fed
>>>> to
>>>> its analogue inputs, and any further processing unit need to deter=
mine
>>>> what
>>>> synchronization signal is present and should be used ?
>>>>
>>>
>>> Yes that correct, there is a register (Sync Detect Status) which
>>> detects the sync for you.
>>>
>>>> I suspect that we don't need, e.g. another endpoint node to specif=
y the
>>>> configuration of the TVP7002 analogue input interface, that would =
contain
>>>> a property like video-sync.
>>>>
>>>>
>>> If I understand correctly you mean if there are two tvp7002 devices
>>> connected
>>> we don=92t need to specify video-sync property, but my question how=
 do we
>>> specify this property in common then ?
>>
>>
>> No, I thought about two port sub-nodes of a single device node, one =
for the
>> TVP7002 video input and one for the output. But it seems there is no=
 need
>> for that, i.e. to specify the input configuration statically in the
>> firmware.
>> The chip detects the signals automatically, i.e. it uses whatever is
>> available,
>> and it allows querying the selection status at run time. What would =
really
>> need to be configured statically in DT in that case then ? Some init=
ial
>> video
>> sync configuration ? I guess it could be well hard coded in the driv=
er,
>> since
>> the hardware does run time detection anyway.
>>
> Yes the chip detects the signal automatically, What I want to configu=
re in
> the DT case is say if SOG signal is detected, I want to invert the po=
larity
> of it this is what I am trying to set in DT case whether to invert or=
 not.
> 0 =3D Normal operation (default)
> 1 =3D SOG output polarity inverted
>
> Something similar to fid_polarity.

Then as I suggested earlier, let's just add 'sync-on-green-active' DT
property for that. I wouldn't expect the DT properties to be directly
replacing your driver platform_data members. Saying in the binding that
this is a normal operation and that is an inverted one is not very usef=
ul
in general, as you would need to dig in the binding's description what
"normal" exactly means. sync-on-green-active =3D <1>; seems much more
explicit than, e.g. sync-on-green-inverted. By looking at the
sync-on-green-active property each device driver would determine whethe=
r
it means normal or inverted operation for its device.

--
Thanks,
Sylwester
