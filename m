From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 3/5] media: sunxi: Add A10 CSI driver
Date: Wed, 3 Apr 2019 12:12:21 +0300
Message-ID: <20190403091221.qd5ivgcoviazccv7@paasikivi.fi.intel.com>
References: <cover.2aba8cbd95630d87f927465cc2beb881936c83d9.1553010938.git-series.maxime.ripard@bootlin.com>
 <bf348ec10d4444dd80eab0caddc4e2d3ce3131d4.1553010938.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <bf348ec10d4444dd80eab0caddc4e2d3ce3131d4.1553010938.git-series.maxime.ripard@bootlin.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Thanks for the update and my apologies for the late review.

On Tue, Mar 19, 2019 at 04:55:46PM +0100, Maxime Ripard wrote:
> The older CSI drivers have camera capture interface different from the one
> in the newer ones.
> 
> This IP is pretty simple. Some variants (one controller out of two
> instances on some SoCs) have an ISP embedded, but there's no code that make
> use of it, so we ignored that part for now.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Could you add a sub-device for the CSI-2 receiver, please?

See e.g. drivers/media/pci/intel/ipu3/ipu3-cio2.c for an example.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
