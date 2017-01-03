From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx6qdl-nitrogen6_max: fix sgtl5000
 pinctrl init
Date: Tue, 3 Jan 2017 21:30:47 +0800
Message-ID: <20170103133045.GD20956@dragon>
References: <20170103112247.4563-1-gary.bisson@boundarydevices.com>
 <20170103112247.4563-2-gary.bisson@boundarydevices.com>
 <20170103114316.GC20956@dragon>
 <20170103115530.vngqbev7nsavgtdc@t450s.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170103115530.vngqbev7nsavgtdc@t450s.lan>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: fabio.estevam@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 03, 2017 at 12:55:49PM +0100, Gary Bisson wrote:
> Hi Shawn,
> 
> On Tue, Jan 03, 2017 at 07:43:17PM +0800, Shawn Guo wrote:
> > On Tue, Jan 03, 2017 at 12:22:46PM +0100, Gary Bisson wrote:
> > > This patch fixes the following error:
> > > sgtl5000 0-000a: Error reading chip id -6
> > > imx-sgtl5000 sound: ASoC: CODEC DAI sgtl5000 not registered
> > > imx-sgtl5000 sound: snd_soc_register_card failed (-517)
> > > 
> > > The problem was that the pinctrl group was linked to the sound driver
> > > instead of the codec node. Since the codec is probed first, the sys_mclk
> > > was missing and it would therefore fail to initialize.
> > > 
> > > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > 
> > Should we have it go as a fix for v4.10-rc cycles?  In that case, please
> > add a Fixes: tag.  Also, do we need to apply it for stable kernel?
> 
> Sure it'd be great if it could be in v4.10.
> Fixes: b32e700256bc ("ARM: dts: imx: add Boundary Devices Nitrogen6_Max board")
> 
> As for stable kernel, I guess it wouldn't hurt but it's not mandatory in
> my opinion.

I wouldn't bother stable kernel then.

> 
> Do you want me to re-send with the Fixes line?

No.  I can add the Fixes tag.

> What about the SOM2
> patch, should it include a Fixes line although it works thanks to
> U-Boot?

Yes, please give me the Fixes tag, and I will send both patches for
v4.10 inclusion.

Shawn
