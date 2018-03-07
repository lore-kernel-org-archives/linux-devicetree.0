From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Subject: Re: [RFC 3/4] MIPS: Ingenic: Initial X1000 SoC support
Date: Wed, 7 Mar 2018 21:55:38 +0530
Message-ID: <CANc+2y42BAF=bZo9WxujMBR-x6y=rKDagA3R68phuAsi1P8BLw@mail.gmail.com>
References: <20170927151527.25570-1-prasannatsmkumar@gmail.com>
 <20170927151527.25570-4-prasannatsmkumar@gmail.com> <20180306000832.GL4197@saruman>
 <CANc+2y5_R5xYQuLbW7NAjO4mcW5RNn3Da77tAhYU5zj=0rkBDQ@mail.gmail.com>
 <20180307143541.GN4197@saruman> <CANc+2y5wsvGWszu3pePYhs2wb1_AgPdjG+ugfOCzbZVfVHDMvw@mail.gmail.com>
 <1520437971.3731.22.camel@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520437971.3731.22.camel@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, linux-clk@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>, Mathieu Malaterre <malat@debian.org>, Dominik Peklo <dom.peklo@gmail.com>
List-Id: devicetree@vger.kernel.org

On 7 March 2018 at 21:22, Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> =E5=9C=A8 2018-03-07=E4=B8=89=E7=9A=84 20:35 +0530=EF=BC=8CPrasannaKumar =
Muralidharan=E5=86=99=E9=81=93=EF=BC=9A
>> Hi James,
>>
>> Seems Jiaxun is interested in the board and is willing to help.
>>
>> I have been told that Ingenic is focusing on IoT market and X1000 is
>> intended for IoT segment. I think that they would be selling several
>> 100Ks of chip over the coming years. But I feel Ingenic spends time
>> only on maintaining their Linux port which is usually based on very
>> old kernel version.
>
> Ingenic is going to release their XBrust2 core with it's products such
> as X2000 a few days later. Witch is a pure MIPS64r5 with MXU2(A
> superset of MIPS's MSA SIMD instruction set). The newest kernel port of
> X1000 maintain by Ingenic is based on Linux-4.4 [1]. After communicated
> with Ingenic, they said they are forcusing on China domestic market.
> But they're looking for partners to enter foriegn market.
>
> [1] https://pan.baidu.com/s/1o8MeYts (Well you can download from this
> Chinese website, ingenic have a gerrit but I don't have access to it.
> As my experience, it's hard to develop on Chinese-made chips wihout
> reading Chinese documents.)

Can you take a diff and upload it somewhere else? Download speed is a
couple of bytes per second. Can you put the diff in github or similar
other service?
I would like to see if the port uses DT.
