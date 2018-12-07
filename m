From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH v9 00/13] media: staging/imx7: add i.MX7 media driver
Date: Fri, 07 Dec 2018 14:01:05 +0000
Message-ID: <m34lbp307y.fsf@linaro.org>
References: <20181122151834.6194-1-rui.silva@linaro.org>
 <757f8c52-7c23-7cf7-32ee-75ddba767ff8@xs4all.nl>
 <20181207133849.GK3095@unbuntlaptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-reply-to: <20181207133849.GK3095@unbuntlaptop>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Hans and Dan,
On Fri 07 Dec 2018 at 13:38, Dan Carpenter wrote:
> On Fri, Dec 07, 2018 at 01:44:00PM +0100, Hans Verkuil wrote:
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

I added this in the cover letter:
     - some alignment parenthesis that were left as they are, to
     be more readable

this ones were left as they are as they seem impossible to fit all
rules. I hope you really do not mind about this checks. if you
have a strong opinion about this let me know, otherwise I will
leave this as it is.

>
> I'm pretty sure it complains about both equally.  If you make 
> fix one
> warning it will complain about the other.  So you just have to 
> pick
> which warning to not care about.

Yeah, I agree with you, I normally like to avoid at all cost the
line length issue.

---
Cheers,
	Rui

>
> regards,
> dan carpenter
