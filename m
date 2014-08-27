From: zhangfei <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v2 2/3] rc: Introduce hix5hd2 IR transmitter driver
Date: Wed, 27 Aug 2014 16:49:59 +0800
Message-ID: <53FD9BB7.6080207@linaro.org>
References: <1408613086-12538-1-git-send-email-zhangfei.gao@linaro.org> <1408613086-12538-3-git-send-email-zhangfei.gao@linaro.org> <20140821100739.GA3252@gofer.mess.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20140821100739.GA3252@gofer.mess.org>
Sender: linux-media-owner@vger.kernel.org
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, =?UTF-8?B?RGF2aWQgSMOkcg==?= =?UTF-8?B?ZGVtYW4=?= <david@hardeman.nu>, arnd@arndb.de, haifeng.yan@linaro.org, jchxue@gmail.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, Guoxiong Yan <yanguoxiong@huawei.com>
List-Id: devicetree@vger.kernel.org



On 08/21/2014 06:07 PM, Sean Young wrote:
> On Thu, Aug 21, 2014 at 05:24:44PM +0800, Zhangfei Gao wrote:
>> From: Guoxiong Yan <yanguoxiong@huawei.com>

>> +	rdev->driver_type =3D RC_DRIVER_IR_RAW;
>> +	rdev->allowed_protocols =3D RC_BIT_ALL;
>> +	rdev->priv =3D priv;
>> +	rdev->open =3D hix5hd2_ir_open;
>> +	rdev->close =3D hix5hd2_ir_close;
>> +	rdev->driver_name =3D IR_HIX5HD2_NAME;
>> +	rdev->map_name =3D RC_MAP_LIRC;
>
> I'm not sure RC_MAP_LIRC is appropriate. If the hardware has no impli=
cit
> remote, can this be stored in device tree like the sunxi-cir.c driver=
 does?

OK=EF=BC=8C got it.
Will set optional property "linux,rc-map-name" for the map_name.
We usually use user space lirc decoder, so this optional property may=20
not need to be set in dts.

>
>> +	rdev->input_name =3D "Hisilicon hix5hd2 Remote Control Receiver";
>
> It would be useful is rdev->input_phys, rdev->input_id,
> rdev->timeout, rdev->rx_resolution are set correctly.

OK, will set rdev->timeout, rdev->rx_resolution
Not sure the usage of rdev->input_id, why is it required?

Thanks for the suggestion.
