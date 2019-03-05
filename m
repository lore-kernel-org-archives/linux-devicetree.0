From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC PATCH nand-next 0/2] meson-nand: support for older SoCs
Date: Tue, 5 Mar 2019 23:12:51 +0100
Message-ID: <CAFBinCC7P40sqrDGTuM8M=jVOFTgZLDUK6rGdNpigFoepyCASw@mail.gmail.com>
References: <20190301182922.8309-1-martin.blumenstingl@googlemail.com> <98776767-c4d7-1207-6d42-97105f289bec@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <98776767-c4d7-1207-6d42-97105f289bec@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liang Yang <liang.yang@amlogic.com>
Cc: linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, jianxin.pan@amlogic.com
List-Id: devicetree@vger.kernel.org

Hi Liang,

On Mon, Mar 4, 2019 at 5:55 AM Liang Yang <liang.yang@amlogic.com> wrote:
>
> Hello Martin,
>
> On 2019/3/2 2:29, Martin Blumenstingl wrote:
> > Hi Liang,
> >
> > I am trying to add support for older SoCs to the meson-nand driver.
> > Back when the driver was in development I used an early revision (of
> > your driver) and did some modifications to make it work on older SoCs.
> >
> > Now that the driver is upstream I wanted to give it another try and
> > make a real patch out of it. Unfortunately it's not working anymore.
> >
> > As far as I know the NFC IP block revision on GXL is similar (or even
> > the same?) as on all older SoCs. As far as I can tell only the clock
> > setup is different on the older SoCs (which have a dedicated NAND
> > clock):
> > - we don't need the "amlogic,mmc-syscon" property on the older SoCs
> >    because we don't need to setup any muxing (common clock framework
> >    will do everything for us)
> > - "rx" and "tx" clocks don't exist
> > - I could not find any other differences between Meson8, Meson8b,
> >    Meson8m2, GXBB and GXL
> >
> That is right. the serials NFC is almost the same except:
> 1) The clock control and source that M8-serials are not share with EMMC.
> 2) The base register address
> 3) DMA encryption option which we don't care on NFC driver.
great, thank you for confirming this!

> > In this series I'm sending two patches which add support for the older
> > SoCs.
> >
> > Unfortunately these patches are currently not working for me (hence the
> > "RFC" prefix). I get a (strange) crash which is triggered by the
> > kzalloc() in meson_nfc_read_buf() - see below for more details.
> >
> > Can you please help me on this one? I'd like to know whether:
> > - the meson-nand driver works for you on GXL or AXG on linux-next?
> >    (I was running these patches on top of next-20190301 on my M8S
> >    board which uses a 32-bit Meson8m2 SoC. I don't have any board using
> >    a GXL SoC which also has NAND)
> Yes, it works on AXG platform using a MXIC slc nand flash(MX30LF4G); but
> i an not sure it runs the same flow with yours. because i see the print
> "Counld not find a valid ONFI parameter page, ...." in yours. i will try
> to reproduce it on AXG(i don't have a M8 platform now).
I'm looking forward to hear about the test results on your AXG boards
for reference: my board has a SK Hynix H27UCG8T2B (ID bytes: 0xad 0xde
0x94 0xeb 0x74 0x44, 20nm MLC)
I have another board (where I haven't tested the NFC driver yet) with
a SK Hynix H27UCG8T2E (ID bytes: 0xad 0xde 0x14 0xa7 0x42 0x4a, 1Ynm
MLC). if it helps with your analysis I can test on that board as well

> > - you see any issue with my patches? (maybe I missed more differences
> >    between GXL and the older SoCs)
> >
> i think it is ok now.
many thanks for checking my patches!


Regards
Martin
