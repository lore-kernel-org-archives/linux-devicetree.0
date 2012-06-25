From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] mtd/m25p80: add device tree probe support
Date: Tue, 26 Jun 2012 00:15:08 +0800
Message-ID: <20120625161506.GH2342@S2101-09.ap.freescale.net>
References: <1311601063-16581-1-git-send-email-shawn.guo@linaro.org>
 <201206230415.18833.marex@denx.de>
 <20120625154006.GB2342@S2101-09.ap.freescale.net>
 <201206251801.22385.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <201206251801.22385.marex@denx.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Vasut <marex@denx.de>
Cc: manu <manuel.pezzin@free.fr>, patches@linaro.org, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org, Artem Bityutskiy <artem.bityutskiy@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 25, 2012 at 06:01:22PM +0200, Marek Vasut wrote:
> Dear Shawn Guo,
> 
> > On Sat, Jun 23, 2012 at 04:15:18AM +0200, Marek Vasut wrote:
> > > So is there any particular reason why this wasn't applied?
> > 
> > Let me remind Artem by resending the patch tomorrow.
> 
> Actually ... the SPI does have the heuristics to probe this chip without the 
> patch. But there was this discussion about them eventually being removed. That 
> was a point raised by you I think. Is that still valid?
> 
That was a point raised by Grant.  IIRC, the reason I made the patch
is my system does not probe the device without the patch.  I can
retest, and if it's true that the patch is not necessarily needed,
I will probably let it be.

-- 
Regards,
Shawn
