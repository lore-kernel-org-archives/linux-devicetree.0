From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH v9 00/13] media: staging/imx7: add i.MX7 media driver
Date: Fri, 18 Jan 2019 18:28:41 +0000
Message-ID: <m3bm4dg6qu.fsf@linaro.org>
References: <20181122151834.6194-1-rui.silva@linaro.org>
 <757f8c52-7c23-7cf7-32ee-75ddba767ff8@xs4all.nl>
 <CAOMZO5BCPAmcE=fU0fA9hgwZ89JMEtO5hOb15b7VwtD6i1LwSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-reply-to: <CAOMZO5BCPAmcE=fU0fA9hgwZ89JMEtO5hOb15b7VwtD6i1LwSg@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, linux-media <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Oi Fabio,
On Fri 18 Jan 2019 at 16:49, Fabio Estevam wrote:
> Hi Rui,
>
> On Fri, Dec 7, 2018 at 10:44 AM Hans Verkuil 
> <hverkuil@xs4all.nl> wrote:
>
>> I got a few checkpatch warnings about coding style:
>>
>> CHECK: Alignment should match open parenthesis
>> #953: FILE: drivers/staging/media/imx/imx7-media-csi.c:911:
>> +static struct v4l2_mbus_framefmt *imx7_csi_get_format(struct 
>> imx7_csi *csi,
>> +                                       struct 
>> v4l2_subdev_pad_config *cfg,
>>
>> CHECK: Alignment should match open parenthesis
>> #1341: FILE: drivers/staging/media/imx/imx7-media-csi.c:1299:
>> +       ret = v4l2_async_register_fwnode_subdev(&csi->sd,
>> +                                       sizeof(struct 
>> v4l2_async_subdev),
>>
>> CHECK: Lines should not end with a '('
>> #684: FILE: drivers/staging/media/imx/imx7-mipi-csis.c:669:
>> +static struct csis_pix_format const *mipi_csis_try_format(
>>
>> CHECK: Alignment should match open parenthesis
>> #708: FILE: drivers/staging/media/imx/imx7-mipi-csis.c:693:
>> +static struct v4l2_mbus_framefmt *mipi_csis_get_format(struct 
>> csi_state *state,
>> +                                       struct 
>> v4l2_subdev_pad_config *cfg,
>>
>> CHECK: Alignment should match open parenthesis
>> #936: FILE: drivers/staging/media/imx/imx7-mipi-csis.c:921:
>> +       ret = v4l2_async_register_fwnode_subdev(mipi_sd,
>> +                               sizeof(struct 
>> v4l2_async_subdev), &sink_port, 1,
>>
>> Apparently the latest coding style is that alignment is more 
>> important than
>> line length, although I personally do not agree. But since you 
>> need to
>> respin in any case due to the wrong SPDX identifier you used 
>> you might as
>> well take this into account.
>>
>> I was really hoping I could merge this, but the SPDX license 
>> issue killed it.
>
> Do you plan to submit a new version?

Yeah, I will try to send one next week. I think have all this
addressed in a branch, I will need to rebase again.

---
Cheers,
	Rui
