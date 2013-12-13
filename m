From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [PATCH v6 15/15] usb: phy-mxs: Add sync time after controller
 clear phcd
Date: Fri, 13 Dec 2013 14:50:33 +0800
Message-ID: <CAL411-oMFOebQ5sEivQ9eu1-=8ayD_O8twtwoG3cO=nA9vA6Eg@mail.gmail.com>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
 <1386897825-6130-16-git-send-email-peter.chen@freescale.com>
 <20131213043923.GJ867@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131213043923.GJ867@saruman.home>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "balbi@ti.com" <balbi@ti.com>
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>, devicetree@vger.kernel.org, m.grzeschik@pengutronix.de, frank.li@freescale.com, linux-doc@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, rob.herring@calxeda.com, Peter Chen <peter.chen@freescale.com>, kernel@pengutronix.de, grant.likely@linaro.org, Shawn Guo <shawn.guo@linaro.org>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 13, 2013 at 12:39 PM, Felipe Balbi <balbi@ti.com> wrote:
> On Fri, Dec 13, 2013 at 09:23:45AM +0800, Peter Chen wrote:
>> After clear portsc.phcd, PHY needs 200us stable time for switch
>> 32K clock to AHB clock.
>>
>> Signed-off-by: Peter Chen <peter.chen@freescale.com>
>> ---
>>  drivers/usb/phy/phy-mxs-usb.c |   11 +++++++++++
>>  1 files changed, 11 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
>> index 885f8d9..68bd981 100644
>> --- a/drivers/usb/phy/phy-mxs-usb.c
>> +++ b/drivers/usb/phy/phy-mxs-usb.c
>> @@ -156,6 +156,15 @@ static inline bool is_imx6sl_phy(struct mxs_phy *mxs_phy)
>>       return mxs_phy->data == &imx6sl_phy_data;
>>  }
>>
>> +/*
>> + * PHY needs some 32K cycles to switch from 32K clock to
>> + * bus (such as AHB/AXI, etc) clock.
>> + */
>> +static void mxs_phy_clock_switch_delay(void)
>> +{
>> +     usleep_range(300, 400);
>> +}
>
> shouldn't this be handled by clk_set_parent() itself ?
>
> --

This clock switching is finished by hardware, no related clkgates are
at clock module.

-- 
BR,
Peter Chen
