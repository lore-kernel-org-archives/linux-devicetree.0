From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 0/3] ARM: sun8i: Add DMA controller support
Date: Thu, 6 Nov 2014 15:54:35 +0800
Message-ID: <CAGb2v66m6Q=YX04Yez7HD=P1G5+G_0ej2tAw9dCJMBb+EHpz1g@mail.gmail.com>
References: <1411010680-4481-1-git-send-email-wens@csie.org>
 <CAGb2v65ZkBvqSjwR0bVUu0-=5-pOmydp51K6GeMnxOa4vOtCRQ@mail.gmail.com> <20141106071123.GV1870@intel.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBUGS5SRAKGQE53DHNAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20141106071123.GV1870-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 6, 2014 at 3:11 PM, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Sep 26, 2014 at 11:06:01AM +0800, Chen-Yu Tsai wrote:
>> On Thu, Sep 18, 2014 at 11:24 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>> > Hi everyone,
>> >
>> > This is v2 of my sun8i DMA controller support series. This series
>> > adds support for the DMA controller found in the Allwinner A23 SoC.
>> > It is the same hardware as found in the A31 (sun6i) SoC. In addition
>> > to reduced physical channels and endpoints, the controller in the A23
>> > requires an undocumented register to be toggled. That seems to allow
>> > memory bus access.
>> >
>> > This series is based on my earlier "clk: sun6i: Unify AHB1 clock and
>> > fix rate calculation" series, which removes the clock muxing calls from
>> > the sun6i-dma driver. The default PLL6 pre-divider for AHB1 on the A23
>> > results in an exceedingly high clock rate for AHB1, and the system hangs.
>> > Also, on the A23, the dma controller happily works even when AHB1 is
>> > clocked from AXI.
>> >
>> >
>> > Patch 1 changes the channel count macros into runtime data binded to
>> > the DT compatible strings. It also gets rid of some hardcoded values
>> > in the interrupt handler.
>> >
>> > Patch 2 adds the channel number data for the A23 (sun8i), as well as
>> > the undocumented register quirk.
>>
>> Hi, Vinod,
>>
>> Any chance we can get patches 1 & 2 merged? You've already merged the
>> prerequisite patch "dmaengine: sun6i: Remove obsolete clk muxing code"
>> a few days ago, and patch 3 is already in arm-soc.
>
> Hi ChenYu,
>
> The patches look fine to me so I tried applying them but they fail to apply,
> can you please rebase these two and resend

Hi Vinod,

Could you publish an updated slave-dma/next branch? Currently I see it at
v3.18-rc1. And the series rebases cleanly onto it with no differences.

I'm guessing some of Maxime's cleanup work is the source of conflict.

Thanks
ChenYu
