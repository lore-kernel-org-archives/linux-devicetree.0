From: Gaku Inami <gaku.inami.xh@renesas.com>
Subject: RE: [PATCH 5/5] soc: renesas: rcar-topology: Add support to be aware
 cpu capacity
Date: Tue, 6 Mar 2018 05:11:33 +0000
Message-ID: <OSBPR01MB180009CEB4121AD9859EE36AA2D90@OSBPR01MB1800.jpnprd01.prod.outlook.com>
References: <1519697995-6061-1-git-send-email-gaku.inami.xh@renesas.com>
 <1519697995-6061-6-git-send-email-gaku.inami.xh@renesas.com>
 <CAMuHMdVZzCOqatGA4PH0Gr+noTEhQ8RAW=pK5K1e7KrAM8VS-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdVZzCOqatGA4PH0Gr+noTEhQ8RAW=pK5K1e7KrAM8VS-A@mail.gmail.com>
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

[snip]

> None of the above seems R-Car specific to me. So please explain why this
> can't just be added to arch/arm64/kernel/topology.c instead, and enabled
> unconditionally.

Thanks for your feedback.

As you said, this code should not be R-Car specific. I will consider again
that it enables SD_ASYM_CPUCAPACITY unconditionally.

Regards,
Inami
