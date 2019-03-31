From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ARM: l2x0: add L210 write allocate override flag
Date: Sun, 31 Mar 2019 01:40:34 -0500
Message-ID: <5ca060e4.1c69fb81.b2f88.98ae@mx.google.com>
References: <20190318083053.24197-1-linus.walleij@linaro.org>
 <20190318140439.xmfh66mbktpd55l2@shell.armlinux.org.uk>
 <CACRpkdba=cp-jGvh+pN_Qg5cTFM+=052wiijQMra81QOG62cVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdba=cp-jGvh+pN_Qg5cTFM+=052wiijQMra81QOG62cVQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King - ARM Linux admin <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 18, 2019 at 11:14:05PM +0100, Linus Walleij wrote:
> On Mon, Mar 18, 2019 at 3:04 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> > On Mon, Mar 18, 2019 at 09:30:53AM +0100, Linus Walleij wrote:
> > > This adds support for setting the flag bit "write allocate
> > > override" to the L210 variant.
> > >
> > > The "write allocate override" bit is used on the Nomadik STn8815
> > > and is necessary to properly make use of the L210 cache on that
> > > machine without sporadic crashes.
> > >
> > > After this the platform can boot and run without any out-of-tree
> > > patches.
> >
> > This is not something that should be done by the kernel but by the
> > firmware - needing this bit set is a basic requirement of having
> > the caches enabled, and if (eg) the boot loader enables the caches
> > it too will suffer this problem.
> 
> I see your point. This U-Boot port does not enable the cache, I guess
> because it was a bit unusual for ARM926EJ-S machines to have
> L2 cache at  the time, and I remember U-Boot was not using L2CC for
> a long time (maybe still not?).
> 
> The Nomadik was unstable for years and then I looked at the
> outoftree vendor kernel and saw that it sets this bit and since I did that
> it has been rock solid.
> 
> I can of course try to recompile and reflash the U-Boot for this
> board but it is stored in NAND flash and if I break it, ugh, I have
> toasted this board and I only have one. So I'm scared about that.
> 
> I have been carrying this as an out-of-tree patch for years and I can of
> course continue to do so, I just felt it was a bit sad so I tried
> to diet down the previous patch to the single bit the Nomadik
> needs to set up for it's L2CC to work.

I'm okay with the property as properties for every last L2x0 
register bit pretty much already happened. However, can't you set the 
bit in the machine desc l2c_aux_val?

Rob
