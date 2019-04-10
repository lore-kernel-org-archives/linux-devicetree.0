From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 0/7] sunxi: Add DT representation for the MBUS
 controller
Date: Wed, 10 Apr 2019 09:01:28 -0500
Message-ID: <20190410140128.GA6232@bogus>
References: <cover.f8909884585996f28d97f4ef95efbcab19527dc4.1554108995.git-series.maxime.ripard@bootlin.com>
 <5ca841d1.1c69fb81.f4702.b85d@mx.google.com>
 <20190408081126.t3blyvtcqslzvki2@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190408081126.t3blyvtcqslzvki2@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org, Georgi Djakov <georgi.djakov@linaro.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Yong Deng <yong.deng@magewell.com>, Frank Rowand <frowand.list@gmail.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 08, 2019 at 10:11:26AM +0200, Maxime Ripard wrote:
> On Sat, Apr 06, 2019 at 01:06:07AM -0500, Rob Herring wrote:
> > On Mon, Apr 01, 2019 at 10:56:40AM +0200, Maxime Ripard wrote:
> > > Hi,
> > >
> > > We've had for quite some time to hack around in our drivers to take into
> > > account the fact that our DMA accesses are not done through the parent
> > > node, but through another bus with a different mapping than the CPU for the
> > > RAM (0 instead of 0x40000000 for most SoCs).
> > >
> > > After some discussion after the submission of a camera device suffering of
> > > the same hacks, I've decided to put together a serie that introduce a
> > > special interconnect name called "dma" that that allows to express the DMA
> > > relationship between a master and its bus, even if they are not direct
> > > parents in the DT.
> > >
> > > Let me know what you think,
> > > Maxime
> >
> > LGTM.
> >
> > How do you propose merging this? I can take 1-5, and 6 and 7 thru
> > arm-soc?
> 
> You can merge 1-4, and I'll merge 5 through drm-misc and 6-7 through
> arm-soc

Done.

Rob
