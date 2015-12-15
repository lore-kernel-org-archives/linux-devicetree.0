From: Dirk Behme <dirk.behme@gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: r8a7795: Add Cortex-A57 CPU cores
Date: Tue, 15 Dec 2015 09:48:46 +0100
Message-ID: <566FD3EE.8040908@gmail.com>
References: <1449236333-4410-1-git-send-email-dirk.behme@gmail.com>
 <1449236333-4410-2-git-send-email-dirk.behme@gmail.com>
 <20151211230751.GD6496@verge.net.au>
 <CANqRtoSeibffbaoVGV7Y_gyuXxCOu+1PmRf3imQ8OKhV6VoAMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CANqRtoSeibffbaoVGV7Y_gyuXxCOu+1PmRf3imQ8OKhV6VoAMQ@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>
Cc: SH-Linux <linux-sh@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Gaku Inami <gaku.inami.xw@bp.renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-Id: devicetree@vger.kernel.org

On 15.12.2015 09:38, Magnus Damm wrote:
> Hi Simon,
>
> On Sat, Dec 12, 2015 at 8:07 AM, Simon Horman <horms@verge.net.au> wrote:
>> On Fri, Dec 04, 2015 at 02:38:52PM +0100, Dirk Behme wrote:
>>> From: Gaku Inami <gaku.inami.xw@bp.renesas.com>
>>>
>>> Add Cortex-A57 CPU cores to r8a7795 SoC for a total of 4 x Cortex-A57.
>>>
>>> Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
>>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>> Sigend-off-by: Dirk Behme <dirk.behme@gmail.com>
>>
>> Thanks, I have queued this up for v4.5.
>
> Thanks. May I ask if CPU hotplug is known to work?


I didn't test that.


> Also, which version
> of the boot loader stack is required?


I've the U-Boot / boot loader stack from BSP v3.0.2 on the board. I 
haven't tested v3.0.3, yet.


Best regards

Dirk

