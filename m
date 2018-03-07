From: Gaku Inami <gaku.inami.xh@renesas.com>
Subject: RE: [PATCH 3/5] arm64: dts: renesas: r8a7795: Add cpu
 capacity-dmips-mhz
Date: Wed, 7 Mar 2018 01:48:50 +0000
Message-ID: <OSBPR01MB1800C2DBEAB2BC506BF80AB9A2D80@OSBPR01MB1800.jpnprd01.prod.outlook.com>
References: <1519697995-6061-1-git-send-email-gaku.inami.xh@renesas.com>
 <1519697995-6061-4-git-send-email-gaku.inami.xh@renesas.com>
 <CAMuHMdWswL8N3uTCcGmWSfa98_bpz7_11PDs=m+_RC--wBVu6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdWswL8N3uTCcGmWSfa98_bpz7_11PDs=m+_RC--wBVu6w@mail.gmail.com>
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Geert-san,

> -----Original Message-----
> From: geert.uytterhoeven@gmail.com [mailto:geert.uytterhoeven@gmail.com] On Behalf Of Geert Uytterhoeven
> Sent: Monday, March 5, 2018 7:24 PM
[snip]
>
> 411 for the A53 cores sounds a bit low to me, though.
> Documentation/devicetree/bindings/arm/cpu-capacity.txt uses 578.
> 
> Perhaps you already took into account the maximum clock frequencies?
> According to the binding document, you should not do that (cfr.
> "final capacities are 1024 for cluster0 and 446 for cluster1" in the
> bindings doc).

Thanks for your review.

I set 411 for CA53 based on dhrystone measurement and current implementation.

The average in 10 times of measurement as follows:

  cpu   max-freq   dhrystone
  ---------------------------------
  A57   1500 MHz  15532585 lps/s
  A53   1200 MHz   6241541 lps/s

With the value of CA57 is scaled at 1024, I end up with 411 for CA53. 
However, since cpufreq is not available on renesas-devel-20180212-v4.16-rc1,
the final capacity is set by directly using capacity-dmips-mhz in dt as below.

  $ cat /sys/devices/system/cpu/cpu*/cpu_capacity
  1024
  1024
  1024
  1024
  411
  411
  411
  411

Considering cpufreq is available later, is it better to set the value(514)
for CA53 scaled by different maximum frequencies?

Regards,
Inami
