From: Keerthy <a0393675@ti.com>
Subject: Re: [PATCH 3/3] ARM: configs: keystone: Enable PINCTRL_SINGLE Config
Date: Mon, 6 Jun 2016 10:26:00 +0530
Message-ID: <57550260.6030902@ti.com>
References: <1464006547-19569-1-git-send-email-j-keerthy@ti.com>
 <1464006547-19569-4-git-send-email-j-keerthy@ti.com>
 <5743CC80.4070404@ti.com> <5743D0FD.5070804@ti.com>
 <6325832e-24d2-43c7-09b4-a73b6549ee2c@oracle.com> <57451A36.8050809@ti.com>
 <5754F00C.108@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5754F00C.108@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>, Lokesh Vutla <lokeshvutla@ti.com>, Keerthy <j-keerthy@ti.com>, ssantosh@kernel.org, "Cooper Jr., Franklin" <fcooper@ti.com>
Cc: nm@ti.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, m-karicheri2@ti.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On Monday 06 June 2016 09:07 AM, Keerthy wrote:
>
>
> On Wednesday 25 May 2016 08:51 AM, Keerthy wrote:
>> Hi Santosh,
>>
>> On Tuesday 24 May 2016 09:59 PM, Santosh Shilimkar wrote:
>>> Hi Keerthy,
>>>
>>> On 5/23/2016 8:56 PM, Keerthy wrote:
>>>>
>>>>
>>>> On Tuesday 24 May 2016 09:07 AM, Lokesh Vutla wrote:
>>>>>
>>>>>
>>>>> On Monday 23 May 2016 05:59 PM, Keerthy wrote:
>>>>>> keystone-k2l devices use pinmux and are compliant with
>>>>>> PINCTRL_SINGLE.
>>>>>> Hence enable the config option.
>>>>>>
>>>>>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>>>>>
>>>>> A similar patch[1] is already posted.
>>>>>
>>>>> [1]https://patchwork.kernel.org/patch/8958091/
>>>>
>>>> Ah I had not seen them. If they are already reviewed and closer to be
>>>> merged then Patch 2 and Patch 3 of this series can be dropped.
>>>>
>>> Once the 4.7-rc2 is out, please rebase these floating patches
>>> against it and post a consolidated patches. I will line them
>>> up for 4.8
>>
>> Thanks for the quick response. I will wait for 4.7-rc2 and send the
>> re-based series.
>
> Now the 4.7-rc2 is tagged i will be sending a consolidated series.

Santosh,

I posted a consolidated series for k2l.

Franklin,

Could you re-post k2g series on top of the series i posted today.

Regards,
Keerthy


>
>>
>> Regards,
>> Keerthy
>>
>>>
>>> Regards,
>>> Santosh
