From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 3/4] mfd: arizona: Remove bindings covered in new
 subsystem specific docs
Date: Wed, 28 Oct 2015 18:11:06 +0900
Message-ID: <5630912A.9090601@samsung.com>
References: <1445961719-1020-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1445961719-1020-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151028090306.GJ5828@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20151028090306.GJ5828@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 2015=EB=85=84 10=EC=9B=94 28=EC=9D=BC 18:03, Lee Jones wrote:
> On Tue, 27 Oct 2015, Charles Keepax wrote:
>=20
>> Binding documentation has been added in new subsystem specific bindi=
ng
>> documents. This patch removes the now duplicate documentation from t=
he
>> MFD documentation.
>>
>> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
>> ---
>>
>> Changes since v2:
>>  - No longer moving the core regulators into the regulator binding d=
ocument,
>>    as they are properties of the device as a whole not just the regu=
lators
>>  - Moved the maintainer updates into a seperate patch
>>
>> Lee, I have removed your ack because the patch has changed a fair am=
ount.
>> Apologies if this would not have been your preference.
>=20
> That was the right thing to do.
>=20
>> Thanks,
>> Charles
>>
>>  Documentation/devicetree/bindings/mfd/arizona.txt |   15 +++-------=
-----
>>  1 files changed, 3 insertions(+), 12 deletions(-)
>=20
> Applied, thanks.

If you possible, could you pick patch1[1] which has already the acked t=
ag of me?
[1] [PATCH v3 1/4] extcon: arizona: Add extcon specific device tree bin=
ding document

Thanks,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
