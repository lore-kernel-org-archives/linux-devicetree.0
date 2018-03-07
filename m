From: Gaku Inami <gaku.inami.xh@renesas.com>
Subject: RE: [PATCH 3/5] arm64: dts: renesas: r8a7795: Add cpu
 capacity-dmips-mhz
Date: Wed, 7 Mar 2018 08:23:50 +0000
Message-ID: <OSBPR01MB180025867BBE83FBCCE1A139A2D80@OSBPR01MB1800.jpnprd01.prod.outlook.com>
References: <1519697995-6061-1-git-send-email-gaku.inami.xh@renesas.com>
 <1519697995-6061-4-git-send-email-gaku.inami.xh@renesas.com>
 <CAMuHMdWswL8N3uTCcGmWSfa98_bpz7_11PDs=m+_RC--wBVu6w@mail.gmail.com>
 <OSBPR01MB1800C2DBEAB2BC506BF80AB9A2D80@OSBPR01MB1800.jpnprd01.prod.outlook.com>
 <CAMuHMdXYZB8emmj5TdZih-VQ5SVF-F0LkBRsPPGe=XGvNDt_Lg@mail.gmail.com>
 <20180307081112.scl7cwnat562muer@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180307081112.scl7cwnat562muer@verge.net.au>
Content-Language: ja-JP
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Geert-san, Simon-san,

> -----Original Message-----
> From: linux-renesas-soc-owner@vger.kernel.org [mailto:linux-renesas-soc-owner@vger.kernel.org] On Behalf Of Simon
> Horman
> Sent: Wednesday, March 7, 2018 5:11 PM
[snip]
> >
> > Documentation/devicetree/bindings/arm/cpu-capacity.txt:
> >
> > "capacity-dmips-mhz is an optional cpu node [1] property: u32 value
> >  representing CPU capacity expressed in normalized DMIPS/MHz. At boot time, the
> >  maximum frequency available to the cpu is then used to calculate the capacity
> >  value internally used by the kernel."
> >
> > IIUIC, you should thus not use 15532585 and 6241541 directly, but
> > scale them to the frequency.
> >
> > So the formula for CA53 becomes:
> >
> > 1024 / (15532585 / 1500) * (6241541 / 1200) = 514
> >
> > > Considering cpufreq is available later, is it better to set the value(514)
> > > for CA53 scaled by different maximum frequencies?
> >
> > DT describes the hardware, not software limitations, so IMHO 514 is the correct
> > value.

Sorry, I misunderstood the intention of definition in DT.
Thanks for your detailed explanation. I understood it.

> Yes agreed. Please refresh this patchset accordingly.

I will update v2 patch.

Regards,
Inami
