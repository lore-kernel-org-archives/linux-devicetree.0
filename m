From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 08/19] ARM64: dts: Add Renesas R8A77965 SoC support
Date: Wed, 21 Feb 2018 18:06:44 +0100
Message-ID: <20180221170643.qmwztqrqafj2pcyn@verge.net.au>
References: <1519139541-18783-1-git-send-email-jacopo+renesas@jmondi.org>
 <1519139541-18783-9-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdVR6qCkBMYvnN5eqjiCgvtD1zW2gW0N=ZpAosYpp+Tj_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVR6qCkBMYvnN5eqjiCgvtD1zW2gW0N=ZpAosYpp+Tj_g@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 20, 2018 at 04:45:48PM +0100, Geert Uytterhoeven wrote:
> On Tue, Feb 20, 2018 at 4:12 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > Basic support for the Gen 3 R-Car M3-N SoC.
> >
> > Based on original work from:
> > Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Magnus Damm <damm+renesas@opensource.se>
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied with the patch subject updated to

arm64: dts: renesas: initial R8A77965 SoC device tree

Please use "arm64: dts: renesas:" as the prefix for Gen-3 DTS/DTSI patches.
