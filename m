From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v12 00/13] media: staging/imx7: add i.MX7 media driver
Date: Tue, 5 Feb 2019 13:14:36 +0200
Message-ID: <20190205111435.2oz46dqphfdt6mn5@kekkonen.localdomain>
References: <20190204120039.1198-1-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20190204120039.1198-1-rui.silva@linaro.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rui,

On Mon, Feb 04, 2019 at 12:00:26PM +0000, Rui Miguel Silva wrote:
> Hi,
> This series introduces the Media driver to work with the i.MX7 SoC. it uses the
> already existing imx media core drivers but since the i.MX7, contrary to
> i.MX5/6, do not have an IPU and because of that some changes in the imx media
> core are made along this series to make it support that case.
> 
> This patches adds CSI and MIPI-CSI2 drivers for i.MX7, along with several
> configurations changes for this to work as a capture subsystem. Some bugs are
> also fixed along the line. And necessary documentation.
> 
> For a more detailed view of the capture paths, pads links in the i.MX7 please
> take a look at the documentation in PATCH 10.
> 
> The system used to test and develop this was the Warp7 board with an OV2680
> sensor, which output format is 10-bit bayer. So, only MIPI interface was
> tested, a scenario with an parallel input would nice to have.
> 
> Bellow goes an example of the output of the pads and links and the output of
> v4l2-compliance testing.
> 
> The v4l-utils version used is:
> v4l2-compliance SHA: 1a6c8fe9a65c26e78ba34bd4aa2df28ede7d00cb, 32 bits
> 
> The Media Driver fail some tests but this failures are coming from code out of
> scope of this series (imx-capture), and some from the sensor OV2680
> but that I think not related with the sensor driver but with the testing and
> core.
> 
> The csi and mipi-csi entities pass all compliance tests.
> 
> Cheers,
>     Rui
> 
> v11->v12:
>   Sakari:
>     - check v4l2_ctrl_handler_free and init when exposed to userspace
>     - check csi_remove missing v4l2_async_notifier_unregister
>     - media device unregister before ctrl_handler_free
>     - GPL => GPL v2
>     - Fix squash of CSI patches, issue on v11
>     - add Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com> 10--13
>     - mipi_s_stream check for ret < 0 and call pm_runtime_put_noidle
>     - use __maybe_unused in pm functions
>     - Extra space before labels

For patches 1, 2 and 4:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks!

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
