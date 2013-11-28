From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v3 5/9] usb: gadget: s3c-hsotg: use generic
 phy_init()/phy_exit() support
Date: Thu, 28 Nov 2013 11:23:52 +0530
Message-ID: <5296DA70.8010409@ti.com>
References: <1385403367-18144-1-git-send-email-matt.porter@linaro.org>
 <1385403367-18144-6-git-send-email-matt.porter@linaro.org>
 <529476A4.8080600@ti.com> <20131127171325.GD31091@beef>
 <20131127223650.GP31091@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131127223650.GP31091@beef>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matt Porter <matt.porter@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Kamil Debski <k.debski@samsung.com>, Linux USB List <linux-usb@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tomasz Figa <t.figa@samsung.com>, Christian Daudt <bcm@fixthebug.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Kyungmin Park <kyungmin.park@samsung.com>, Felipe Balbi <balbi@ti.com>, Linaro Patches <patches@linaro.org>, Kumar Gala <galak@codeaurora.org>, Paul Zimmerman <paulz@synopsys.com>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday 28 November 2013 04:06 AM, Matt Porter wrote:
> On Wed, Nov 27, 2013 at 12:13:25PM -0500, Matt Porter wrote:
>> On Tue, Nov 26, 2013 at 03:53:32PM +0530, Kishon Vijay Abraham I wrote:
>>> Hi,
>>>
>>> On Monday 25 November 2013 11:46 PM, Matt Porter wrote:
>>>> If a generic phy is present, call phy_init()/phy_exit(). This supports
>>>> generic phys that must be soft reset before power on.
>>>>
>>>> Signed-off-by: Matt Porter <matt.porter@linaro.org>
>>>> ---
>>>>  drivers/usb/gadget/s3c-hsotg.c | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
>>>> index da3879b..8dfe33f 100644
>>>> --- a/drivers/usb/gadget/s3c-hsotg.c
>>>> +++ b/drivers/usb/gadget/s3c-hsotg.c
>>>> @@ -3622,6 +3622,9 @@ static int s3c_hsotg_probe(struct platform_device *pdev)
>>>>  		goto err_supplies;
>>>>  	}
>>>>  
>>>> +	if (hsotg->phy)
>>>
>>> IS_ERR? If your phy_get fails *phy* will have a error value..
>>
>> Yes, thanks. I'll fix these and also note that the same issue exists in
>> Kamil's patch for these same hsotg->phy conditional uses. I'll work with
>> Kamil to either get those addressed there or in a follow on fix.
> 
> I spoke too soon. If devm_phy_get fails, we don't set hsotg->phy and probe
> defer thus not reaching this point. Since hsotg->phy is either NULL or a
> valid struct phy *, this is correct as is throughout the driver.
> 
>>>
>>>> +		phy_init(hsotg->phy);
>>>> +
>>>>  	/* usb phy enable */
>>>>  	s3c_hsotg_phy_enable(hsotg);
>>>>  
>>>> @@ -3715,6 +3718,8 @@ static int s3c_hsotg_remove(struct platform_device *pdev)
>>>>  	}
>>>>  
>>>>  	s3c_hsotg_phy_disable(hsotg);
>>>> +	if (hsotg->phy)
>>>
>>> same here.
>>
>> Ok.
> 
> Same above, this will be NULL on failure (but is only applicable at this
> point on the platform data path.

Ah ok.. Btw where is phy_get being called? Is it not part of this series?

Thanks
Kishon

> 
> -Matt
> 
