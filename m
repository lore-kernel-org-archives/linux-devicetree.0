From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2 2/4] ARM: dts: add fec phy reset for imx6sl evk board
Date: Tue, 10 Sep 2013 11:11:41 +0800
Message-ID: <20130910031138.GD5815@S2101-09.ap.freescale.net>
References: <1378182385-9205-1-git-send-email-B38611@freescale.com>
 <1378182385-9205-3-git-send-email-B38611@freescale.com>
 <20130909145333.GA5815@S2101-09.ap.freescale.net>
 <9848F2DB572E5649BA045B288BE08FBE016A7AB8@039-SN2MPN1-023.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <9848F2DB572E5649BA045B288BE08FBE016A7AB8@039-SN2MPN1-023.039d.mgd.msft.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Duan Fugang-B38611 <B38611@freescale.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2013 at 01:26:49AM +0000, Duan Fugang-B38611 wrote:
> Shawn, you cannot drop this patch.

I have to drop the patch *for now*.  Look, with the patch landed on
linux-next, people report that fec is broken as below on imx6sl-evk.

fec 2188000.ethernet eth0: no PHY, assuming direct connection to switch
libphy: PHY fixed-0:00 not found
fec 2188000.ethernet eth0: could not attach to PHY
IP-Config: Failed to open eth0
IP-Config: No network devices available

While before the patch, we can boot the board into console with NFS when
downloading kernel image from network.  This is the most used setup for
kernel developers.

> 1. Why do you get a working fec driver in kernel if U-Boot sets it up properly ?
>    Because the phy reset done by uboot, kernel cannot depend on uboot.
>    And even so, the driver still have problem for unit test.

Yeah, it should be fixed/improved without any breakage/regression on
the current use case.

> 2. You see freescale internal kernel(3.10.9) work fine. There have one driver patch don't upstream.
>    I will send it out to net tree for review.

That's where problem comes.  You should push required driver changes
upstream before sending me this patch.  You need to resolve the
dependencies between patches properly without introducing any breakages
or regressions.

That said, I'm not saying the patch is wrong, but the timing of sending
this patch for merging is wrong.

Shawn
