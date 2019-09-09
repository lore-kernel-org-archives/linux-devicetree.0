From: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: add support for A1 based Amlogic AD401
Date: Tue, 10 Sep 2019 00:12:32 +0800
Message-ID: <b8350c34-1fcc-76b8-6722-1e3309089c04@amlogic.com>
References: <1567667251-33466-1-git-send-email-jianxin.pan@amlogic.com>
 <1567667251-33466-5-git-send-email-jianxin.pan@amlogic.com>
 <CAFBinCBSmW4y-Dz7EkJMV8HOU4k6Z0G-K6T77XnVrHyubaSsdg@mail.gmail.com>
 <be032a85-b60d-f7f0-8404-b27784d809df@amlogic.com>
 <CAFBinCD7gFzOsmZCB8T1KJKVsgL7WMhoEkj3dRzyqwAnjC0CNA@mail.gmail.com>
 <1jv9u1ya3o.fsf@starbuckisacylon.baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1jv9u1ya3o.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Tao Zeng <tao.zeng@amlogic.com>
List-Id: devicetree@vger.kernel.org

Hi Jerome,

On 2019/9/9 19:36, Jerome Brunet wrote:
> 
> On Sat 07 Sep 2019 at 17:02, Martin Blumenstingl wrote:
> 
>> Hi Jianxin,
>>
>> On Fri, Sep 6, 2019 at 7:58 AM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
>> [...]
>>>> also I'm a bit surprised to see no busses (like aobus, cbus, periphs, ...) here
>>>> aren't there any busses defined in the A1 SoC implementation or are
>>>> were you planning to add them later?
>>> Unlike previous series,there is no Cortex-M3 AO CPU in A1, and there is no AO/EE power domain.
>>> Most of the registers are on the apb_32b bus.  aobus, cbus and periphs are not used in A1.
>> OK, thank you for the explanation
>> since you're going to re-send the patch anyways: can you please
>> include the apb_32b bus?
> 
> unless there is an 64 bits apb bus as well, I suppose 'apb' would be enough ?
>
There is no 64bits apb bus in A1, only apb32. 
Unlike the previous series, For A1 and C1, we can not get bus information for each register from the memmap and datesheet.
Do we need to add bus description for them too? If yes, I can add 'apb' .  
>> all other upstream Amlogic .dts are using the bus definitions, so that
>> will make A1 consistent with the other SoCs
>>
>>
>> Martin
> 
> .
> 
