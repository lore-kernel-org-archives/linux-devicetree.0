From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [RFC 3/4] MIPS: Ingenic: Initial X1000 SoC support
Date: Sun, 11 Mar 2018 03:05:11 +0800
Message-ID: <1520708711.24016.27.camel@flygoat.com>
References: <20170927151527.25570-1-prasannatsmkumar@gmail.com>
         <20170927151527.25570-4-prasannatsmkumar@gmail.com>
         <20180306000832.GL4197@saruman>
         <CANc+2y5_R5xYQuLbW7NAjO4mcW5RNn3Da77tAhYU5zj=0rkBDQ@mail.gmail.com>
         <20180307143541.GN4197@saruman>
         <CANc+2y5wsvGWszu3pePYhs2wb1_AgPdjG+ugfOCzbZVfVHDMvw@mail.gmail.com>
         <1520437971.3731.22.camel@flygoat.com>
         <CANc+2y42BAF=bZo9WxujMBR-x6y=rKDagA3R68phuAsi1P8BLw@mail.gmail.com>
         <CA+7wUsyTrHZ=yk7EObc4ZaeXFcdgxVZL=9v2Mtz9=1_5dBz6Hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+7wUsyTrHZ=yk7EObc4ZaeXFcdgxVZL=9v2Mtz9=1_5dBz6Hg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Malaterre <malat@debian.org>, PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Cc: James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, linux-clk@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>, Dominik Peklo <dom.peklo@gmail.com>
List-Id: devicetree@vger.kernel.org

在 2018-03-07三的 19:13 +0100，Mathieu Malaterre写道：
> > > [1] https://pan.baidu.com/s/1o8MeYts (Well you can download from
> > > this
> > > Chinese website, ingenic have a gerrit but I don't have access to
> > > it.
> > > As my experience, it's hard to develop on Chinese-made chips
> > > wihout
> > > reading Chinese documents.)
> > 
> > Can you take a diff and upload it somewhere else? Download speed is
> > a
> > couple of bytes per second. Can you put the diff in github or
> > similar
> > other service?
> > I would like to see if the port uses DT.
> 
> Technically this was documented here:
Well that's only Technically for the English world. Most Ingeinc
costumers are Chinese so they're providing detailed support for Chinese
world.
According Ingenic's announcement, the ftp have been deprecated for a
long time and it's only exsiting for archive reason.

> 
> ftp://ftp.ingenic.cn/DevSupport/Linux/Linux-3.0.8/JZ4780/JZ4780_linux
> _development_guide_EN.pdf
> 
> Go to §2.1 Download Source Code:
> 
> 1) Download repo a) $ mkdir b) $ cd c) $ wget
> http://git.ingenic.cn:8082/bj/repo d) $ chmod +x repo
> 
Repo is a sourcecode managing system used by Android. The gerrit is
still here but need extra premission to reach. Now ingenic release
there soucecode by "Baidu Netdisk". It's hard to access by foreign
users. So we put the shourcecode here: https://github.com/Ingenic-commu
nity/linux-xburst-bsp

Thanks
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>
