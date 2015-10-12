From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation for
 mic detection
Date: Mon, 12 Oct 2015 19:16:54 +0900
Message-ID: <561B8896.7040409@samsung.com>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151007100017.GB12635@sirena.org.uk> <20151007122642.GH17172@x1>
 <20151012084554.GB8805@ck-lbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20151012084554.GB8805@ck-lbox>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Hi Charles,

On 2015=EB=85=84 10=EC=9B=94 12=EC=9D=BC 17:45, Charles Keepax wrote:
> On Wed, Oct 07, 2015 at 01:26:42PM +0100, Lee Jones wrote:
>> On Wed, 07 Oct 2015, Mark Brown wrote:
>>
>>> On Fri, Oct 02, 2015 at 05:29:22PM +0100, Charles Keepax wrote:
>>>> Add additional bindings to allow configuration of the system speci=
fic
>>>> microphone detection settings.
>>>
>>> This all seems pretty much fine to me - the things it is controllin=
g are
>>> fairly specific to the way the former Wolfson devices do, they only
>>> really make sense with a fairly particular algorithm which isn't wi=
dely
>>> implemented.
>>
>> Is that an Ack?
>=20
> I am guessing Mark is slightly hesitant to ack as he probably
> doesn't want to add reviewing all our jack detection bindings to
> his already fairly sizable work load and doing so here likely
> means it will be expected in the future. From talking to people at
> LinuxCon it looks like it is pretty unlikely the DT maintainers
> will be acking individual bindings as well, basically they are
> only really looking at major/framework things and leaving the
> rest to subsystem maintainers.
>=20
> Given that these patches only touch MFD/Extcon and extcon
> is a subsystem designed to handle things like jack detection
> isn't it really sufficient that you and Chanwoo have looked this
> and are happy with it? Otherwise I really don't see anyway to
> move this forward and would appreciate any suggestions?

I'm positive about your patches. After receiving the ack from MFD maint=
ainer
I want to apply this patch-set on extcon git repository.

Also, I reviewed this patch on previous patch[1].
[1]https://lkml.org/lkml/2015/9/11/81

Thanks,
Chanwoo Choi
