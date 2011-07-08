From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH 1/2] dt: add helper function to read u32 arrays
Date: Fri, 8 Jul 2011 09:45:13 +0800
Message-ID: <20110708014512.GD12722@S2100-06.ap.freescale.net>
References: <1309984979-8847-1-git-send-email-robherring2@gmail.com>
	<20110706205933.GA5371@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20110706205933.GA5371@ponder.secretlab.ca>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 06, 2011 at 02:59:33PM -0600, Grant Likely wrote:
> On Wed, Jul 06, 2011 at 03:42:58PM -0500, Rob Herring wrote:
> > From: Rob Herring <rob.herring@calxeda.com>
> > 
> > Rework of_property_read_u32 to read an array of values. Then
> > of_property_read_u32 becomes an inline with array size of 1.
> > 
> > Also make struct device_node ptr const.
> > 
> > Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> > Cc: Thomas Abraham <thomas.abraham@linaro.org>
> > Cc: Grant Likely <grant.likely@secretlab.ca>
> > ---
> > 
> > Grant, 
> > 
> > Perhaps you want to roll this into the original patch?
> 
> Applied, thanks.  The original is already in devicetree/next, so I've
> just applied this on top as a separate commit.
> 
> > 
> > It would also be nice if there were empty versions of the helpers
> > as well.
> 
> Go ahead and submit a patch to add them if you need it.
> 
I'm adding one into my spi-dt series, as I need it there.

-- 
Regards,
Shawn
