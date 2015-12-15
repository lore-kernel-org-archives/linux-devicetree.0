From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 2/6] ARM: DTS: da850: Use the new DT bindings for the
 eDMA3
Date: Tue, 15 Dec 2015 16:05:32 +0200
Message-ID: <56701E2C.7060308@ti.com>
References: <1449237210-16381-1-git-send-email-peter.ujfalusi@ti.com>
 <1449237210-16381-3-git-send-email-peter.ujfalusi@ti.com>
 <566FDF93.7050005@ti.com> <566FFD1C.4080000@ti.com> <56701A47.9090105@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56701A47.9090105@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, khilman@deeprootsystems.com
List-Id: devicetree@vger.kernel.org

On 12/15/2015 03:48 PM, Sekhar Nori wrote:
>>> These correspond to PRU events. It is true that most likely they wi=
ll
>>> never be used for peripheral DMA and can be dedicated as memcpy
>>> channels. However, since this is being encoded in DT, we need to be=
 sure
>>> that they will never be used for peripheral DMA on this board.
>>>
>>> So, I would prefer if you do not reserve any channels for memcpy un=
til
>>> there is a real need/usecase for them. I know the board file has th=
ese
>>> reserved but board file could be updated as you liked. With DT we n=
eed
>>> to maintain backward compatibility. So I would rather do it when th=
ere
>>> is an actual need for it.
>>
>> If we do not reserve channels for memcpy then you will have no suppo=
rt for
>> memcpy on these boards. Not sure if we use memcpy in any of our driv=
ers in
>> daVinci, so it might be just fine to not have DMA memcpy support at =
all.
>=20
> Not that I know of. No driver uses DMA memcpy
>=20
>> But how about using edma1's reserved channels as memcpy (19-23, 30-3=
1)? I
>=20
> I think this is much more reasonable.
>=20
>> don't know which channels the DSP would use on these boards, so it i=
s never
>> going to be safe from that point.
>=20
> Yeah, and thats why I think its better to add it as and when there is=
 a
> real need for it. At least at that point we are sure of the usecase.

OK, I'll disable the memcpy for now.

>>> In future, if/when we gain QDMA support, the QDMA channels could be=
 used
>>> for memcopy.
>>
>> Well, in short there is no way to get the qDMA working in a differen=
t way
>> either. qDMA channel is in essence using 'normal' eDMA channel. This=
 means
>> that we still need to reserve the eDMA channel to be used for memcpy=
, but
>> instead of SW triggering it (as we do it right now), we would need t=
o use the
>> channel as qDMA and set things up accordingly. I don't really see th=
e benefit
>> for qDMA mode to be honest.
>=20
> I guess the only advantage is that they will not clash with periphera=
l
> mode usage. But even then, some sort of reservation is needed. So I
> guess QDMA is no better than the EDMA reserved channels?

It will clash with the peripheral mode use since it needs to take one o=
f the
eDMA channels. qDMA mode is basically differs from the mode we are usin=
g by
how the channel is triggered. Currently we start the memcpy with SW tri=
gger.
In qDMA mode we can select a paRAM parameter which if it is updated wil=
l do
the triggering. It is useful if you have mostly constant memcpy paramet=
ers and
you only need to change one thing in there (reusing the paRAM slot), li=
ke you
change the dst address. In this case you just update the dst and the qD=
MA will
be triggered. I don't think we can take advantage of this feature via d=
maengine.

--=20
P=E9ter
