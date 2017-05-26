From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm: dts: r7s72100: Add support for GR-Peach
Date: Fri, 26 May 2017 08:56:27 +0200
Message-ID: <20170526065627.GE2628@verge.net.au>
References: <1495567254-10226-1-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdUovD=6YfJYckoftWyJZ3eRjcKFkScj=wLhyTDSFPavgw@mail.gmail.com>
 <20170524070702.GB4253@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170524070702.GB4253@w540>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jmondi <jacopo@jmondi.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 24, 2017 at 09:07:02AM +0200, jmondi wrote:
> Hello Simon,
> 
> On Tue, May 23, 2017 at 09:25:40PM +0200, Geert Uytterhoeven wrote:
> > On Tue, May 23, 2017 at 9:20 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > > Add device tree source for Renesas GR-Peach board.
> > > GR-Peach is an RZ/A1H based board with 10MB of on-chip SRAM and 8MB
> > > QSPI flash storage.
> > > Add support for the board, and create a 2MB partition to use as rootfs.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> I forgot to change subject to "PATCH v2".
> Could you please take this one, or would you like me to resend with
> Geert's reviewed-by ?

No need to repost, I've queued-up this version for v4.13.
