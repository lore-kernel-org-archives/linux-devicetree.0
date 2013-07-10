From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH V2 4/4] extcon: palmas: Option to disable ID/VBUS detection
 based on platform
Date: Wed, 10 Jul 2013 16:34:55 +0900
Message-ID: <51DD0E9F.1030305@samsung.com>
References: <1373436959-32444-1-git-send-email-ldewangan@nvidia.com>
 <1373436959-32444-5-git-send-email-ldewangan@nvidia.com>
 <51DD0578.6090804@samsung.com> <51DD09B7.50604@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <51DD09B7.50604@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob@landley.net" <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kishon@ti.com" <kishon@ti.com>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>
List-Id: devicetree@vger.kernel.org

On 07/10/2013 04:13 PM, Laxman Dewangan wrote:
> On Wednesday 10 July 2013 12:25 PM, Chanwoo Choi wrote:
>> Hi Laxman,
>>
>> On 07/10/2013 03:15 PM, Laxman Dewangan wrote:
>>> Should you define duplicate meaning variables in each other structure?
>>> - disable_vbus_detection - enable_vbus_detection
>>> - disable_id_detection - enable_id_detection
>>>
>>> I think that it isn' efficient code. I'd like you to simplify this patch
>>> by using only one variable instead of duplicate meaning variables.
> 
> Originally this patch came form TI and not sure that they are using the both cable detection or only single type.
> For Nvidia Tegra platform, on some design, we are using only ID detection and hence this option get added.
> 

I agree that user can determine whether specific irq is used or not according to dt data.


> I did not like to break the TI design/code and hence added the option such that if there is no initialisation of this member or dts entry then assume it as the cable detection is enabled. Hence it need explicitly entry for disable the cable type detction. This is what for platform data structure.
> 
> On other structure, I use as other way to use in rest of code to make logic as
> 
> if (palmas_usb->enable_id_detction)
>    xxx.
> 
> rathar than
> 
> if (!palmas_usb->disable_id_detction)
>    xxx.
> 
> 
> On rest of code, do now wan to use the pdata.

This patch store same meaning to two different variables which are included in different structure.
If we try to change the state of vbus/id detection on runtime, we have to modify two variables.
I think it isn't right.

struct palmas_platform_data {
	....
	bool disable_vbus_detection;
	bool disable_id_detection;
};

struct palmas_usb {
	...
	bool enable_vbus_detection;
	bool enable_id_detection;
};

You could only use the variables in struct palmas_usb without variables in struct palmas_platform_data
because extcon-palmas driver store only the pointer of 'struct palmas_usb' to dev->p->driver_data
by using platform_set_drvdata().

It is meaning to use 'struct palmas_usb' on other function except for palmas_usb_probe() in extcon-palmas.c.


if (node && !pdata) {
	...
	palmas_usb->wakeup = of_property_red_bool(node, "ti,wakeup);
	palmas_usb->enable_vbus_detection = of_property_red_bool(node, "ti,enable_vbus_detection);
	palmas_usb->enable_id_detection = of_property_red_bool(node, "ti,enable_id_detection);
} else (!pdata) {
	palmas_usb->wakeup = true;
	palmas_usb->enable_vbus_detection = true;
	palmas_usb->enable_id_detection = true;
}







