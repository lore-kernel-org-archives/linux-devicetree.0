From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH v7 00/12] media: staging/imx7: add i.MX7 media driver
Date: Wed, 07 Nov 2018 10:04:33 +0000
Message-ID: <m3lg65td8u.fsf@linaro.org>
References: <20180810142045.27657-1-rui.silva@linaro.org>
 <f20a9702-632e-8248-2538-af14d4a84cdc@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-reply-to: <f20a9702-632e-8248-2538-af14d4a84cdc@xs4all.nl>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, mchehab@kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Hans,
On Wed 07 Nov 2018 at 09:58, Hans Verkuil wrote:
> Hi Rui,
>
> On 08/10/18 16:20, Rui Miguel Silva wrote:
>> Hi,
>> This series introduces the Media driver to work with the i.MX7 
>> SoC. it uses the
>> already existing imx media core drivers but since the i.MX7, 
>> contrary to
>> i.MX5/6, do not have an IPU and because of that some changes in 
>> the imx media
>> core are made along this series to make it support that case.
>> 
>> This patches adds CSI and MIPI-CSI2 drivers for i.MX7, along 
>> with several
>> configurations changes for this to work as a capture subsystem. 
>> Some bugs are
>> also fixed along the line. And necessary documentation.
>> 
>> For a more detailed view of the capture paths, pads links in 
>> the i.MX7 please
>> take a look at the documentation in PATCH 14.
>> 
>> The system used to test and develop this was the Warp7 board 
>> with an OV2680
>> sensor, which output format is 10-bit bayer. So, only MIPI 
>> interface was
>> tested, a scenario with an parallel input would nice to have.
>> 
>> 
>> Bellow goes an example of the output of the pads and links and 
>> the output of
>> v4l2-compliance testing.
>> 
>> The v4l-utils version used is:
>> v4l2-compliance SHA   : 
>> 90905c2e4b17d7595256f3824e2d30d19b0df1a1 from Aug 6th
>> 
>> The Media Driver fail some tests but this failures are coming 
>> from code out of
>> scope of this series (imx-capture), and some from the sensor 
>> OV2680
>> but that I think not related with the sensor driver but with 
>> the testing and
>> core.
>> 
>> The csi and mipi-csi entities pass all compliance tests.
>
> Can you rebase and repost? Please re-run v4l2-compliance as well 
> with the latest
> compliance code.

Yup, I may take one week or so, other things in hand, but will try 
to
send it sooner than later.

>
> We should be able to merge this for 4.21 (finally!).

Yeah!! Thanks.

---
Cheers,
	Rui
