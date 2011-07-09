From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] of: add devicetree API for regulator
Date: Sat, 9 Jul 2011 10:14:14 +0900
Message-ID: <20110709011412.GE18860@opensource.wolfsonmicro.com>
References: <1310120428-22700-1-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-2-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-3-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-4-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-5-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-6-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-7-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-8-git-send-email-haojian.zhuang@marvell.com>
	<CACxGe6teb+-xYGUXAcjwubxNhNQ-9395PjjE=fDnmZQHbgR0tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6teb+-xYGUXAcjwubxNhNQ-9395PjjE=fDnmZQHbgR0tw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: eric.y.miao@gmail.com, nico@fluxnic.net, devicetree-discuss@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@marvell.com>, haojian.zhuang@gmail.com, samuel.ortiz@intel.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, alan@linux.intel.com
List-Id: devicetree@vger.kernel.org

On Fri, Jul 08, 2011 at 08:51:17AM -0600, Grant Likely wrote:
> Hi Haojian,
> 
> On Fri, Jul 8, 2011 at 4:20 AM, Haojian Zhuang
> <haojian.zhuang@marvell.com> wrote:
> > Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
> 
> No commit description?

Gah, don't bury major API changes like this in the middle of enourmous
and not perceptibly related machine specific patch serieses if you
expect people to actually see them.
