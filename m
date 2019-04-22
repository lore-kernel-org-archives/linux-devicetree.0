Return-Path: <SRS0=wpX5=SY=gmail.com=papadakospan@kernel.org>
Date: Mon, 22 Apr 2019 09:40:22 +0300
From: "Leonidas P. Papadakos" <papadakospan@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: set TX PBL for rk3328-roc-cc gmac
Message-Id: <1555915222.1262.0@gmail.com>
In-Reply-To: <8865b046-fb3a-4071-335c-66abb344d7f4@gmail.com>
References: <20190417210059.26262-1-papadakospan@gmail.com>
	<8865b046-fb3a-4071-335c-66abb344d7f4@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-AxW4ihTRDv//G8uHH2zd"
To: Peter Geis <pgwipeout@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jose Abreu <jose.abreu@synopsys.com>, Robin Murphy <robin.murphy@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--=-AxW4ihTRDv//G8uHH2zd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable



=CE=A3=CF=84=CE=B9=CF=82 =CE=9A=CF=85=CF=81, 21 =CE=91=CF=80=CF=81, 2019 at=
 7:00 =CE=9C=CE=9C, =CE=BF/=CE=B7 Peter Geis=20
<pgwipeout@gmail.com> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
> Thanks for sharing that thread, it's nice to finally have an answer=20
> to why we have these issues.
> I've tested this on *my* Firefly rk3328-roc-cc, and while this patch=20
> succeeds in preventing the tx lockup, iperf3 drops to a delightful=20
> 15mbps.
>=20
> It would seem we have significant differences between manufacturing=20
> runs of the various boards.
> The auto adjustment feature that was discussed in that thread is=20
> probably the only thing that will solve this for all boards.
> Until then I don't think we are going to get a solution that works=20
> for all.

Indeed that feature would be optimal. Just to confirm, you have=20
replaced force_thresh_dma_mode with this txpbl thing, right?
That is the only ethernet modification I have in the dts, done though=20
u-boot. That is on linux 5.1

> fdt rm /ethernet@ff540000 snps,force_thresh_dma_mode
> fdt set /ethernet@ff540000 snps,txpbl <0x4>

=

--=-AxW4ihTRDv//G8uHH2zd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><br></div></div><div id=3D"geary-q=
uote" dir=3D"auto"><br>=CE=A3=CF=84=CE=B9=CF=82 =CE=9A=CF=85=CF=81, 21 =CE=
=91=CF=80=CF=81, 2019 at 7:00 =CE=9C=CE=9C, =CE=BF/=CE=B7 Peter Geis &lt;pg=
wipeout@gmail.com&gt; =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:<br><blockquote =
type=3D"cite"><div class=3D"plaintext" style=3D"white-space: pre-wrap;">Tha=
nks for sharing that thread, it's nice to finally have an answer to why we =
have these issues.
I've tested this on *my* Firefly rk3328-roc-cc, and while this patch succee=
ds in preventing the tx lockup, iperf3 drops to a delightful 15mbps.

It would seem we have significant differences between manufacturing runs of=
 the various boards.
The auto adjustment feature that was discussed in that thread is probably t=
he only thing that will solve this for all boards.
Until then I don't think we are going to get a solution that works for all.=
</div></blockquote><span style=3D"white-space: pre-wrap;"><br></span><div><=
span style=3D"white-space: pre-wrap;">Indeed that feature would be optimal.=
 Just to confirm, you have replaced force_thresh_dma_mode with this txpbl t=
hing, right?</span></div><div><span style=3D"white-space: pre-wrap;">That i=
s the only ethernet modification I have in the dts, done though u-boot. Tha=
t is on linux 5.1</span></div><div><span style=3D"white-space: pre-wrap;"><=
br></span></div><blockquote type=3D"cite"><div><span style=3D"white-space: =
pre-wrap;">fdt rm /ethernet@ff540000 snps,force_thresh_dma_mode</span></div=
></blockquote><blockquote type=3D"cite"><span style=3D"white-space: pre-wra=
p;">fdt set /ethernet@ff540000 snps,txpbl &lt;0x4&gt;</span></blockquote></=
div>=

--=-AxW4ihTRDv//G8uHH2zd--
