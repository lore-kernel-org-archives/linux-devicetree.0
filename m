From: Jason <jason@lakedaemon.net>
Subject: Re: [PATCH 1/3] arm: ignore devicetree blobs.
Date: Thu, 23 Feb 2012 10:56:57 -0500
Message-ID: <20120223155657.GM23524@titan.lakedaemon.net>
References: <cover.1312906908.git.jason@lakedaemon.net>
 <cover.1329936660.git.jason@lakedaemon.net>
 <3629df9b5b96d3a3a63a34ebf6ddfca2fd72ccfc.1329936660.git.jason@lakedaemon.net>
 <20120222222619.GY14173@pengutronix.de>
 <20120223091630.GA2036@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20120223091630.GA2036@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dave Martin <dave.martin@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Dave,

On Thu, Feb 23, 2012 at 09:16:30AM +0000, Dave Martin wrote:
> On Wed, Feb 22, 2012 at 11:26:19PM +0100, Uwe Kleine-K?nig wrote:
> > On Wed, Feb 22, 2012 at 07:18:44PM +0000, Jason Cooper wrote:
> > > 
> > > Signed-off-by: Jason Cooper <jason@lakedaemon.net>
> > /me claims prior art:
> > 
> > 	http://mid.gmane.org/1323808612-14976-1-git-send-email-u.kleine-koenig@pengutronix.de
> 
> Multiple people proposed this...
> 
> Grant accepted my patch, and it is already in -next:
> 
> See next-20110222
> 
> 810ae3d26507e61d1f7a69e9716443df1ce41449
> ARM: devicetree: Add .dtb files to arch/arm/boot/.gitignore

awesome, I'll drop this from the next version of the series, then.

thx,

Jason.
