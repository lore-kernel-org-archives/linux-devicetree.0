From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v4] extcon: Palmas Extcon Driver
Date: Tue, 7 May 2013 15:17:08 +0530
Message-ID: <5188CD9C.6010602@ti.com>
References: <1362662506-14823-4-git-send-email-kishon@ti.com> <1367846225-15685-1-git-send-email-kishon@ti.com> <20130506144010.GF13472@opensource.wolfsonmicro.com> <51888D55.3090907@ti.com> <20130507075824.GM7478@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130507075824.GM7478@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, gg@slimlogic.co.uk
Cc: myungjoo.ham@samsung.com, cw00.choi@samsung.com, balbi@ti.com, ldewangan@nvidia.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com, rob@landley.net, ruchika@ti.com, tony@atomide.com, sameo@linux.intel.com
List-Id: devicetree@vger.kernel.org

Hi,

On Tuesday 07 May 2013 01:28 PM, Mark Brown wrote:
> On Tue, May 07, 2013 at 10:42:53AM +0530, Kishon Vijay Abraham I wrote:
>> On Monday 06 May 2013 08:10 PM, Mark Brown wrote:
>>> On Mon, May 06, 2013 at 06:47:04PM +0530, Kishon Vijay Abraham I wrote:
>>>
>>>> +		if (palmas_usb->linkstat != PALMAS_USB_STATE_VBUS) {
>>>> +			if (palmas_usb->vbus_reg) {
>>>> +				ret = regulator_enable(palmas_usb->vbus_reg);
>>>> +				if (ret) {
>>>> +					dev_dbg(palmas_usb->dev,
>>>> +						"regulator enable failed\n");
>>>> +					goto ret0;
>
>>> This is very bad karma, why is the regulator optional?
>
>> The platform can provide it's own vbus control in which case this is
>> not needed.
>
> So why is there no interaction with this external VBUS control and how
> does the driver distinguish between that and an error getting the
> regulator?

The platform specifies if it provides its own VBUS control by the dt 
property ti,no_control_vbus. So the driver will give an error only when 
*ti,no_control_vbus* is not set. Graeme?

Thanks
Kishon
