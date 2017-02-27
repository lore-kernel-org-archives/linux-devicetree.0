From: Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: hisilicon: add bindings for
 hi3798cv200 SoC and Poplar board
Date: Sun, 26 Feb 2017 20:48:26 -0600
Message-ID: <14a08c7d-8e25-bb5c-d700-46a07107e52f@linaro.org>
References: <1487752716-14824-1-git-send-email-xuejiancheng@hisilicon.com>
 <1487752716-14824-2-git-send-email-xuejiancheng@hisilicon.com>
 <ef8cca92-7f1f-40bd-4023-2e64dcf69a68@suse.de>
 <798bfd0e-bd8d-a75d-e841-53d82b513f94@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <798bfd0e-bd8d-a75d-e841-53d82b513f94@hisilicon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jiancheng Xue <xuejiancheng@hisilicon.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Cc: devicetree@vger.kernel.org, mark.gregotski@linaro.org, arnd@arndb.de, catalin.marinas@arm.com, will.deacon@arm.com, yanhaifeng@hisilicon.com, xuwei5@hisilicon.com, linux-kernel@vger.kernel.org, peter.griffin@linaro.org, robh+dt@kernel.org, hermit.wangheming@hisilicon.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 02/26/2017 07:24 PM, Jiancheng Xue wrote:
> Hi Andreas,
> =

> On 2017/2/26 9:32, Andreas F=E4rber wrote:
>> Am 22.02.2017 um 09:38 schrieb Jiancheng Xue:
>>> Add bindings for HiSilicon hi3798cv200 SoC and Poplar Board.
>>>
>>> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
>>> ---
>>>  Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.=
txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>>> index f1c1e21..1fd3dd7 100644
>>> --- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>>> +++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>>> @@ -4,6 +4,10 @@ Hi3660 SoC
>>>  Required root node properties:
>>>  	- compatible =3D "hisilicon,hi3660";
>>>  =

>>> +Hi3798cv200 Poplar Board
>>> +Required root node properties:
>>> +	- compatible =3D "hisilicon,hi3798cv200-poplar", "hisilicon,hi3798cv2=
00";
>>
>> Please remember to CC previous reviewers.
>>
> Sorry for that.
> =

>> This still looks wrong: Why is this not "hisilicon,poplar" if you choose
>> against "tocoding,poplar"? =

> =

> I didn't think it was very important thing whether the compatbile string =
contained
> a preceding SoC name or not. I just referred to the hikey board and some =
other
> HiSilicon boards. I wanted to keep using the same rule with them.

The way Jiancheng defined this was consistent with the pattern
used for all other definitions of platforms found in this
documentation file.  Why make this one different?

>> Is there a second Poplar board with a different SoC? =

> =

> I can't tell about this now.

There is not.  But there could be.  In any case, I do accept
your point that there's no need to encode the SoC identity
in the board compatible string.  But I don't think doing so
causes harm.

>> Even then it would be redundant with the second
>> compatible string.

I presume you're not arguing that the second compatible
string should be eliminated; it seems your concern is only
about including the SoC in the board's compatible string.
Is that right?

> The second compatilbe string can be removed here. Thanks.

I don't think it should be.

My position, for what it's worth, is that if a change is
made to the compatible strings, it should be:

  compatible =3D "hisilicon,poplar", "hisilicon,hi3798cv200";

But I don't think it's necessary to make that change.  Tocoding
has no other DT presence in the kernel right now; it seems fine
to tag the board with "hisilicon".

					-Alex

> =

> Regards,
> Jiancheng
> =

>> Regards,
>> Andreas
>>
>>> +
>>>  Hi4511 Board
>>>  Required root node properties:
>>>  	- compatible =3D "hisilicon,hi3620-hi4511";
>>
> =
