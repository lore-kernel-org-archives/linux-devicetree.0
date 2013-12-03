From: "gwenhael.goavec" <gwenhael.goavec-merou@armadeus.com>
Subject: Re: [PATCH 1/2] ARM: imx28: add apf28 specific initialization
 (macaddr)
Date: Tue, 3 Dec 2013 09:53:35 +0100
Message-ID: <20131203095335.3c073da4@x230>
References: <1385801473-97460-1-git-send-email-gwenhael.goavec-merou@armadeus.com>
 <20131203085030.GJ10840@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131203085030.GJ10840@S2101-09.ap.freescale.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 3 Dec 2013 16:50:32 +0800
Shawn Guo <shawn.guo@linaro.org> wrote:

> On Sat, Nov 30, 2013 at 09:51:12AM +0100, Gwenhael Goavec-Merou wrote:
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@armadeus.com>
> > ---
> >  arch/arm/mach-mxs/mach-mxs.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/arch/arm/mach-mxs/mach-mxs.c b/arch/arm/mach-mxs/mach-mxs.c
> > index 3982e12..02b17f7 100644
> > --- a/arch/arm/mach-mxs/mach-mxs.c
> > +++ b/arch/arm/mach-mxs/mach-mxs.c
> > @@ -158,6 +158,7 @@ enum mac_oui {
> >  	OUI_DENX,
> >  	OUI_CRYSTALFONTZ,
> >  	OUI_I2SE,
> 
> What tree are you based on?  I do not have this OUI_I2SE thing in my
> tree.
> 
> Shawn
> 
It's the for-next[1] branch of
git://git.linaro.org/people/shawnguo/linux-2.6.git

Gwenhael

[1]
https://git.linaro.org/gitweb?p=people/shawnguo/linux-2.6.git;a=blob;f=arch/arm/mach-mxs/mach-mxs.c;h=3982e129c054da764d6035b0d2640b0f70a44760;hb=refs/heads/for-next
