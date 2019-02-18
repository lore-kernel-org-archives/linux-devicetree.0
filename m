From: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH v2 07/10] usb: dwc3: Registering a role switch in the DRD
 code.
Date: Mon, 18 Feb 2019 17:30:32 +0000
Message-ID: <8162929c-0d1b-1081-4be0-d40ed6f752d6@arm.com>
References: <20190218112310.17860-1-chenyu56@huawei.com>
 <20190218112310.17860-8-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218112310.17860-8-chenyu56@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yu Chen <chenyu56@huawei.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, liuyu712@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 18/02/2019 11:23, Yu Chen wrote:
[...]
> @@ -522,6 +556,15 @@ int dwc3_drd_init(struct dwc3 *dwc)
>  		dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_OTG);
>  	}
>  
> +	dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
> +	dwc3_role_switch.set = dwc3_usb_role_switch_set;
> +	dwc3_role_switch.get = dwc3_usb_role_switch_get;
> +	dwc->role_sw = usb_role_switch_register(dwc->dev, &dwc3_role_switch);

Building arm64 defconfig gives me this:

drivers/usb/dwc3/drd.o: In function `dwc3_drd_exit':
/home/valsch01/Work/kernel/drivers/usb/dwc3/drd.c:604: undefined reference to `usb_role_switch_unregister'
/home/valsch01/Work/kernel/drivers/usb/dwc3/drd.c:604:(.text+0x814): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `usb_role_switch_unregister'
/home/valsch01/Work/kernel/drivers/usb/dwc3/drd.c:604: undefined reference to `usb_role_switch_unregister'
/home/valsch01/Work/kernel/drivers/usb/dwc3/drd.c:604:(.text+0x844): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `usb_role_switch_unregister'
drivers/usb/dwc3/drd.o: In function `dwc3_drd_init':
/home/valsch01/Work/kernel/drivers/usb/dwc3/drd.c:562: undefined reference to `usb_role_switch_register'
/home/valsch01/Work/kernel/drivers/usb/dwc3/drd.c:562:(.text+0xa20): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `usb_role_switch_register'
/home/valsch01/Work/kernel/drivers/usb/dwc3/drd.c:562: undefined reference to `usb_role_switch_register'
/home/valsch01/Work/kernel/drivers/usb/dwc3/drd.c:562:(.text+0xb4c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `usb_role_switch_register'
Makefile:1024: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1

This has CONFIG_USB_ROLE_SWITCH=m, setting it as a built-in makes the thing
linkable.

I suppose that's because defconfig gives us

  CONFIG_USB_DWC3_DUAL_ROLE=y

but then that should probably force a CONFIG_USB_ROLE_SWITCH=y. My
immediate reaction to this would be to add:

---
diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 2b1494460d0c..661b1d2efc8b 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -44,6 +44,7 @@ config USB_DWC3_DUAL_ROLE
 	bool "Dual Role mode"
 	depends on ((USB=y || USB=USB_DWC3) && (USB_GADGET=y || USB_GADGET=USB_DWC3))
 	depends on (EXTCON=y || EXTCON=USB_DWC3)
+	select USB_ROLE_SWITCH
 	help
 	  This is the default mode of working of DWC3 controller where
 	  both host and gadget features are enabled.
---
  
Not sure how acceptable that is though.


> +	if (ret) {
> +		dwc3_drd_exit(dwc);
> +		return PTR_ERR(dwc->role_sw);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -557,4 +600,6 @@ void dwc3_drd_exit(struct dwc3 *dwc)
>  
>  	if (!dwc->edev)
>  		free_irq(dwc->otg_irq, dwc);
> +
> +	usb_role_switch_unregister(dwc->role_sw);
>  }
> 
