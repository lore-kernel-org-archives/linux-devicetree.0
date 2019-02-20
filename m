From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: dmaengine: Add one new cell to present
 hardware slave id
Date: Wed, 20 Feb 2019 19:29:23 +0800
Message-ID: <CAMz4kuLZH2dt5JTB1uYcLkm4EG_Av=7mnAj51s-J1-6E8+R5CA@mail.gmail.com>
References: <a9718ae1e97a5911f47874fe23c00ef297d7fed8.1548158832.git.baolin.wang@linaro.org>
 <CAK8P3a2zkhrZLMi5KZ5=fGJCt85dad3_pZC0o7GqcwJkk4es9w@mail.gmail.com>
 <CAMz4ku+PR4bHtcPu2uT2f974+FWJVi8Tp3WzmuqE1TS-M-QawQ@mail.gmail.com>
 <CAMz4kuLEut0LqZ4bSAGJDufE8xHr6DgZ3Z1RCLQ10q_k6MUesw@mail.gmail.com>
 <CAK8P3a1Zq6XjymG3sAaHGeNRxU5UXPfJPbi0A9s47cTVK7vC3g@mail.gmail.com>
 <CAMz4kuL=B53xLk4SFbrwWeUhp4P9zbUfOmXgftQCEjVSwOnD5A@mail.gmail.com>
 <CAK8P3a03rPjWQvGrDupoTAywVmjCZdpSJpqW9Sv=NVPR2uwZeQ@mail.gmail.com>
 <CAMz4kuKnVppCB0-9LVgq8bya6=iWPhMcrHL_N53QfiU5Kn9YAA@mail.gmail.com>
 <CAMuHMdWPZGYpvANL_V=YszPWjtTA+ZnU6GVDmn188LC=eC005Q@mail.gmail.com>
 <CAMz4ku+yzwaww5o06tz9-8n99UfiVh6d5UB2L12RYMpTow6K3w@mail.gmail.com>
 <20190219122027.GA21884@vkoul-mobl>
 <CAMz4kuK89AyL6PA2dRF1t=tR6-fKXKp+x3oi+cKDqSqi08xv0Q@mail.gmail.com>
 <CAK8P3a0z4YSr2BCnM91gBNduhODmx25fF7y6_wgsc_u3i_5YEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a0z4YSr2BCnM91gBNduhODmx25fF7y6_wgsc_u3i_5YEg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, eric.long@unisoc.com, arm-soc <arm@kernel.org>, Lyra Zhang <zhang.lyra@gmail.com>, Mark Brown <broonie@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson <olof@lixom.net>, Orson Zhai <orsonzhai@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 20 Feb 2019 at 17:08, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Feb 20, 2019 at 4:13 AM Baolin Wang <baolin.wang@linaro.org> wrote:
> > On Tue, 19 Feb 2019 at 20:20, Vinod Koul <vkoul@kernel.org> wrote:
> > > On 19-02-19, 17:49, Baolin Wang wrote:
> > > > On Tue, 19 Feb 2019 at 17:30, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Tue, Feb 19, 2019 at 4:15 AM Baolin Wang <baolin.wang@linaro.org> wrote:
> > > > > > On Mon, 18 Feb 2019 at 20:23, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > > On Mon, Feb 18, 2019 at 11:52 AM Baolin Wang <baolin.wang@linaro.org> wrote:
> > > > > > > > On Mon, 18 Feb 2019 at 18:31, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > > I did understand the need for a slave-id, I was instead wondering about
> > > > > > > the channel-id number. On many SoCs, all channels are equal, and you
> > > > > > > just have to pick one of those with the right capabilities for a particular
> > > > > > > slave.
> > > > > >
> > > > > > Yes, all channels are equal. We just set a unique slave id for the
> > > > > > channel for a particular slave. For example, the SPI slave can use
> > > > > > channel 10 for tx transfer by setting slave id 11, or it also can use
> > > > > > channel 9 for tx transfer by setting same slave id 11.
> > > > >
> > > > > So the channel selection is software policy, not hardware description, and
> > > > > thus doesn't belong in DT?
> > > > >
> > > > > Can't the DMA engine driver allocate channels dynamically, removing the
> > > > > need to specify this in DT?
> > > >
> > > > In theory we can do as you suggested. But we still want to
> > > > manage/assign the DMA channel resources manually for one SoC, we can
> > > > make sure some important DMA slaves (such as audio)  can request a DMA
> > > > channel at runtime firstly, another benefit is that it is easy to
> > > > debug since we can easily know which channel is assigned for this
> > > > slave.
> > >
> > > Are  you suggesting that you have more users than channels available?
> >
> > Until now we have not met this issue, but we can not make sure if this
> > can happen in future. Moreover DMA channel resources are belonging to
> > the DMA engine's hardware resources, I think it should be described in
> > DT like many other drivers did.
>
> As far as I can tell, most platforms do not describe the assignment
> of resources in DT for dma engines, the numbers in there are meant to
> describe whatever is fixed, and most platforms should do it that way.
>
> The naming is sometimes a bit confusing, as a dma request line
> assignment can be called a slave-id or a channel-id depending whose
> documentation you read. The drivers/dma/virt-dma.c implementation
> is used in some cases to represent request numbers as virtual
> channels, so a dmaengine driver can allow one dma_request_chan()
> per slave, and then assign the hardware channels dynamically
> while doing a transfer, rather than having a fixed channel assignment
> when we first ask for a channel.

Okay, sounds reasonable to me, and I think no issues will happen if we
assign channels dynamically after some slave usages' investigation.

I will remove channel id from DT in next version. Thanks for all your help.

-- 
Baolin Wang
Best Regards
