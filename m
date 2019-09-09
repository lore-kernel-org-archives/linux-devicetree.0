From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: add support for A1 based Amlogic AD401
Date: Mon, 9 Sep 2019 19:24:19 +0200
Message-ID: <CAFBinCAJG4=M3BSXfREGU+iadMPkc7=yt3AdcqA1KAhQx6Wh9w@mail.gmail.com>
References: <1567667251-33466-1-git-send-email-jianxin.pan@amlogic.com>
 <1567667251-33466-5-git-send-email-jianxin.pan@amlogic.com>
 <CAFBinCBSmW4y-Dz7EkJMV8HOU4k6Z0G-K6T77XnVrHyubaSsdg@mail.gmail.com>
 <be032a85-b60d-f7f0-8404-b27784d809df@amlogic.com> <CAFBinCD7gFzOsmZCB8T1KJKVsgL7WMhoEkj3dRzyqwAnjC0CNA@mail.gmail.com>
 <a82336e2-44df-5682-1c86-daf8a8448d30@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a82336e2-44df-5682-1c86-daf8a8448d30@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Carlo Caione <carlo@caione.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Tao Zeng <tao.zeng@amlogic.com>
List-Id: devicetree@vger.kernel.org

Hi Jianxin,

On Mon, Sep 9, 2019 at 2:03 PM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
>
> Hi Martin,
>
> On 2019/9/7 23:02, Martin Blumenstingl wrote:
> > Hi Jianxin,
> >
> > On Fri, Sep 6, 2019 at 7:58 AM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
> > [...]
> >>> also I'm a bit surprised to see no busses (like aobus, cbus, periphs, ...) here
> >>> aren't there any busses defined in the A1 SoC implementation or are
> >>> were you planning to add them later?
> >> Unlike previous series,there is no Cortex-M3 AO CPU in A1, and there is no AO/EE power domain.
> >> Most of the registers are on the apb_32b bus.  aobus, cbus and periphs are not used in A1.
> > OK, thank you for the explanation
> > since you're going to re-send the patch anyways: can you please
> > include the apb_32b bus?
> > all other upstream Amlogic .dts are using the bus definitions, so that
> > will make A1 consistent with the other SoCs
> In A1 (and the later C1), BUS is not mentioned in the memmap and register spec.
> Registers are organized and grouped by functions, and we can not find information about buses from the SoC document.
do you know why the busses are not part of the documentation?

> Maybe it's better to remove bus definitions for these chips.
my understanding is that devicetree describes the hardware
so if there's a bus in hardware (that we know about) then we should
describe it in devicetree

personally I think busses also make the .dts easier to read:
instead of a huge .dts with all nodes on one level it's split into
multiple smaller sub-nodes - thus making it easier to keep track of
"where am I in this file".


Martin
