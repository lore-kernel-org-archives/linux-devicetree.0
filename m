From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH v6 00/13] media: staging/imx7: add i.MX7 media driver
Date: Thu, 02 Aug 2018 17:45:20 +0100
Message-ID: <m3a7q4u38f.fsf@linaro.org>
References: <20180522145245.3143-1-rui.silva@linaro.org>
 <267173c9-7235-6008-7248-ee06c0db3780@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-reply-to: <267173c9-7235-6008-7248-ee06c0db3780@xs4all.nl>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rob Herring <robh+dt@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Hans,
On Thu 02 Aug 2018 at 13:37, Hans Verkuil wrote:
> Hi Rui,
>
> On 05/22/18 16:52, Rui Miguel Silva wrote:
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
>> *Important note*, this code depends on Steve Longerbeam series 
>> [0]:
>> [PATCH v4 00/13] media: imx: Switch to subdev notifiers
>> which the merging status is not clear to me, but the changes in 
>> there make
>> senses to this series
>> 
>> Bellow goes an example of the output of the pads and links and 
>> the output of
>> v4l2-compliance testing.
>> 
>> The v4l-utils version used is:
>> v4l2-compliance SHA   : 
>> 47d43b130dc6e9e0edc900759fb37649208371e4 from Apr 4th.
>> 
>> The Media Driver fail some tests but this failures are coming 
>> from code out of
>> scope of this series (video-mux, imx-capture), and some from 
>> the sensor OV2680
>> but that I think not related with the sensor driver but with 
>> the testing and
>> core.
>> 
>> The csi and mipi-csi entities pass all compliance tests.
>> 
>> Cheers,
>>     Rui
>> 
>> [0]: 
>> https://www.mail-archive.com/linux-media@vger.kernel.org/msg131186.html
>
> This patch series was delayed quite a bit since the patch series 
> above
> it depends on is still not merged.
>
> But the v6 version of that series will be merged once the 4.20 
> cycle opens:
> https://www.mail-archive.com/linux-media@vger.kernel.org/msg133391.html

Good news.

>
> Sakari has a branch with that series on top of the latest 
> media_tree master:
> https://git.linuxtv.org/sailus/media_tree.git/log/?h=v4l2-fwnode
>
> Can you rebase this imx7 series on top of that? And test it 
> again with the
> *latest* v4l2-compliance? (I've added new checks recently, so 
> you need to
> update this utility)
>
> Please post the output of the v4l2-compliance test (after fixing 
> any issues
> it raises of course), either as a reply to this post or in the 
> cover letter
> of a v7 version of this series if you had to make changes.

Sure, I will rebase on top of Sakari tree and will update the 
compliance
tests and run them again.

>
> This should expedite merging this series for 4.20.
>
> Thanks!
>
> 	Hans

Ok, thanks for this. I will try to do it soon.

---
Cheers,
	Rui
