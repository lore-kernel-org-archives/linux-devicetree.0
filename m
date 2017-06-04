From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v7 16/34] [media] add Omnivision OV5640 sensor driver
Date: Sun, 4 Jun 2017 11:00:14 -0700
Message-ID: <3e953953-7bf4-912f-73f7-db568d5df504@gmail.com>
References: <1495672189-29164-1-git-send-email-steve_longerbeam@mentor.com>
 <1495672189-29164-17-git-send-email-steve_longerbeam@mentor.com>
 <20170529155511.GI29527@valkosipuli.retiisi.org.uk>
 <c50c3c5f-71cf-fa73-f5a8-a4b5f59a87dc@gmail.com>
 <20170530065632.GK29527@valkosipuli.retiisi.org.uk>
 <ab04379b-d005-1251-343b-5e490ee6e72d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <ab04379b-d005-1251-343b-5e490ee6e72d@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail
List-Id: devicetree@vger.kernel.org



On 06/03/2017 11:02 AM, Steve Longerbeam wrote:
> Hi Sakari,
> 
> 
> On 05/29/2017 11:56 PM, Sakari Ailus wrote:
>> Hi Steve,
>>
>> On Mon, May 29, 2017 at 02:50:34PM -0700, Steve Longerbeam wrote:
>>>> <snip>
>>>>
>>>>> +
>>>>> +static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>>>>> +{
>>>>> +    struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>>>>> +    struct ov5640_dev *sensor = to_ov5640_dev(sd);
>>>>> +    int ret = 0;
>>>>> +
>>>>> +    mutex_lock(&sensor->lock);
>>>> Could you use the same lock for the controls as you use for the 
>>>> rest? Just
>>>> setting handler->lock after handler init does the trick.
>>>
>>> Can you please rephrase, I don't follow. "same lock for the controls as
>>> you use for the rest" - there's only one device lock owned by this 
>>> driver
>>> and I am already using that same lock.
>>
>> There's another in the control handler. You could use your own lock 
>> for the
>> control handler as well.
> 
> I still don't understand.
> 

Hi Sakari, sorry I see what you are referring to now. The lock
in 'struct v4l2_ctrl_handler' can be overridden by a caller's own
lock. Yes that's a good idea, I'll do that.

Steve
