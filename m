From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v1 09/12] usb: dwc3: Registering a role switch in the DRD
 code.
Date: Wed, 5 Dec 2018 08:56:31 +0800
Message-ID: <3601762f-f013-05f8-4348-d6267b8f1a9b@huawei.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
 <20181203034515.91412-10-chenyu56@huawei.com>
 <20181204105416.GA10657@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204105416.GA10657@kuha.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: liuyu712@hisilicon.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org



On 2018/12/4 18:54, Heikki Krogerus wrote:
> On Mon, Dec 03, 2018 at 11:45:12AM +0800, Yu Chen wrote:
>> The Type-C drivers use USB role switch API to inform the
>> system about the negotiated data role, so registering a role
>> switch in the DRD code in order to support platforms with
>> USB Type-C connectors.
>>
>> Cc: Felipe Balbi <balbi@kernel.org>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: Yu Chen <chenyu56@huawei.com>
>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>
>> --
>> v0:
>> The patch is provided by Heikki Krogerus. I modified and test it
>> on Hikey960 platform.
>> --
>> ---
>>  drivers/usb/dwc3/core.h |  2 ++
>>  drivers/usb/dwc3/drd.c  | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 51 insertions(+)
> 
> You need to select USB_ROLE_SWITCH in Kconfig:
> 
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 1a0404fda596..3a0cb9f1f38a 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -42,6 +42,7 @@ config USB_DWC3_DUAL_ROLE
>         bool "Dual Role mode"
>         depends on ((USB=y || USB=USB_DWC3) && (USB_GADGET=y || USB_GADGET=USB_DWC3))
>         depends on (EXTCON=y || EXTCON=USB_DWC3)
> +       select USB_ROLE_SWITCH
>         help
>           This is the default mode of working of DWC3 controller where
>           both host and gadget features are enabled.
> 

OK.

Thanks!
