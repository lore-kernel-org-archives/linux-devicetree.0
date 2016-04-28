From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH] clk: renesas: r8a7795: Move MODEMR to DT
Date: Thu, 28 Apr 2016 10:23:44 +0200
Message-ID: <5721C890.7030803@de.bosch.com>
References: <1461823717-22517-1-git-send-email-dirk.behme@de.bosch.com>
 <CAMuHMdVYtdr8wzm91CH-TAhpbS3E=Jzy67TcjOBC1Q4G9f2bAA@mail.gmail.com>
 <5721B47D.9030206@de.bosch.com>
 <CAMuHMdUNt_yyLwPwDoQwMAGgeFrL9trH=-YvZ339ObnOPPvOPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUNt_yyLwPwDoQwMAGgeFrL9trH=-YvZ339ObnOPPvOPQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, linux-renesas-soc@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Oleksij Rempel <linux@rempel-privat.de>, Pooya Keshavarzi <Pooya.Keshavarzi@de.bosch.com>, Oleksij Rempel <fixed-term.Oleksij.Rempel@de.bosch.com>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 28.04.2016 10:07, Geert Uytterhoeven wrote:
> Hi Dirk,
>
> On Thu, Apr 28, 2016 at 8:58 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> On 28.04.2016 08:52, Geert Uytterhoeven wrote:
>>> On Thu, Apr 28, 2016 at 8:08 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>>>> @@ -46,7 +48,8 @@ Examples
>>>>
>>>>           cpg: clock-controller@e6150000 {
>>>>                   compatible = "renesas,r8a7795-cpg-mssr";
>>>> -               reg = <0 0xe6150000 0 0x1000>;
>>>> +               reg = <0 0xe6150000 0 0x1000>,
>>>> +                     <0 0xe6160060 0 0x4>;
>>>
>>>
>>> The MODEMR register is not part of the CPG block, but of the RST block.
>>> So IMHO it doesn't belong in the clock-controller node.
>>
>> Ok, fine.
>>
>> So we agree hat this ugly hard coded register address stuff has to be
>> removed and replaced by a device tree based solution. Correct?
>
> Yes we agree.
>
>>> BTW, I still prefer something like
>>> "[PATCH 0/6] arm64: renesas: Obtain MD pin values using syscon/regmap"
>>> (http://www.spinics.net/lists/linux-sh/msg44757.html).
>>
>> What's the status of this? I see there a date "1 Sep 2015" ;)
>
> We were considering alternative solutions, cfr. "[PATCH/RFC 0/6] boot-mode-reg:
> Add core" (http://www.spinics.net/lists/linux-sh/msg45969.html).
> To avoid delaying upstream r8a7795, we settled for the ugly hard coded
> register access as an interim solution.
>
>> Is this available in any testing tree we could try?
>
> It used to be part of older renesas-drivers releases.


Would it be possible to add them again then, now?


Best regards

Dirk
