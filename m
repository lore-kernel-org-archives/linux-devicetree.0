From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH v5 01/12] media: staging/imx: refactor imx media device
 probe
Date: Fri, 18 May 2018 15:18:57 +0100
Message-ID: <m3k1s1rqr2.fsf@linaro.org>
References: <20180518092806.3829-1-rui.silva@linaro.org>
 <20180518092806.3829-2-rui.silva@linaro.org>
 <1526639561.3948.2.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-reply-to: <1526639561.3948.2.camel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rob Herring <robh+dt@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, sakari.ailus@linux.intel.com, Steve Longerbeam <slongerbeam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,
Thanks for the quick review.

On Fri 18 May 2018 at 10:32, Philipp Zabel wrote:
> Hi Rui,
>
> thank you for refactoring, I think this is much better than 
> having the
> pretend capture-subsytem device in the DT.
>
> I would like to get rid of the ipu_present flag, if it can be 
> done
> reasonably. For details, see below.

Yes, I will try to come with something that will play along with 
your
comments. will be in v6.

---
Cheers,
	Rui
