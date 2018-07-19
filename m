From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] ARM: dts: imx7d: add missing OPP property for cpu0
Date: Thu, 19 Jul 2018 09:02:15 +0530
Message-ID: <20180719033215.ww2q5mjvgdj34wny@vireshk-i7>
References: <1531896889-21377-1-git-send-email-Anson.Huang@nxp.com>
 <20180719032002.GT4576@dragon>
 <20180719032454.2bxp4eil7lfaijji@vireshk-i7>
 <20180719032609.GV4576@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180719032609.GV4576@dragon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Anson Huang <Anson.Huang@nxp.com>, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 19-07-18, 11:26, Shawn Guo wrote:
> On Thu, Jul 19, 2018 at 08:54:54AM +0530, Viresh Kumar wrote:
> > On 19-07-18, 11:20, Shawn Guo wrote:
> > > On Wed, Jul 18, 2018 at 02:54:49PM +0800, Anson Huang wrote:
> > > > Commit b97872d4eb22 ("ARM: dts: imx: Add missing OPP properties for CPUs")
> > > > added "operating-points" property for all CPUs, but missed i.MX7D's cpu0,
> > > > this patch adds it.
> > > > 
> > > > Fixes: b97872d4eb22 ("ARM: dts: imx: Add missing OPP properties for CPUs")
> > > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > 
> > > In general, when you send a patch fixing a commit, you should have the
> > > author of that commit copied.  I added Viresh here.
> > > 
> > > It looks like a wrong fix to me.  It seems that commit b97872d4eb22
> > > shouldn't change imx7d.dtsi at all.  So the correct fix would be
> > > reverting the change on imx7d.dtsi, @Viresh?
> > 
> > Wow! Can't believe such a stupid mistake got merged and no one noticed
> > :(
> > 
> > Please revert that patch and I will resend the right fix Shawn.
> 
> Please just send a incremental fix patch for that commit.

Sure. Actually I almost wrote the patch but then realized that it
wouldn't be fair for me to send a patch for something Anson has been
working on.

@Anson: Please send a patch to remove the "operating-points" property.

-- 
viresh
