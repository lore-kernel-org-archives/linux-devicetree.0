Return-Path: <SRS0=oFd4=GL=redhat.com=hdegoede@kernel.org>
Subject: Re: [PATCH 2/5] usb: typec: fusb302: remove max_snk_* for sink config
References: <1521541570-25363-1-git-send-email-jun.li@nxp.com>
 <1521541570-25363-3-git-send-email-jun.li@nxp.com>
 <6d76c9c9-5e73-bf71-c0cd-db4070dadece@redhat.com>
 <VI1PR0402MB391738D930AA33B26A53E96289AA0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <96e2a4bd-3213-0abb-c47d-91727741c7f5@redhat.com>
Date: Wed, 21 Mar 2018 13:16:06 +0100
MIME-Version: 1.0
In-Reply-To: <VI1PR0402MB391738D930AA33B26A53E96289AA0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Jun Li <jun.li@nxp.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "rmfrfs@gmail.com" <rmfrfs@gmail.com>, "yueyao.zhu@gmail.com" <yueyao.zhu@gmail.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

On 21-03-18 12:19, Jun Li wrote:
> 
>> -----Original Message-----
>> From: Hans de Goede [mailto:hdegoede@redhat.com]
>> Sent: 2018年3月20日 20:29
>> To: Jun Li <jun.li@nxp.com>; gregkh@linuxfoundation.org;
>> robh+dt@kernel.org; mark.rutland@arm.com;
>> heikki.krogerus@linux.intel.com; linux@roeck-us.net; rmfrfs@gmail.com;
>> yueyao.zhu@gmail.com
>> Cc: linux-usb@vger.kernel.org; devicetree@vger.kernel.org; dl-linux-imx
>> <linux-imx@nxp.com>
>> Subject: Re: [PATCH 2/5] usb: typec: fusb302: remove max_snk_* for sink
>> config
>>
>> Hi,
>>
>> On 20-03-18 11:26, Li Jun wrote:
>>> Since max_snk_* is to be deprecated, so remove max_snk_* by adding a
>>> variable PDO for sink config.
>>
>> NACK there are actual users of the device-properties which you are now
>> breaking. As I mentioned in another thread, you need to instead add the pdo
>> array to the fusb302_chip struct (so that it is no longer
>> const) and generate a PDO_VAR pdo based on the device-properties.
>>
> 
> OK, I did a search of those properties in dts dir of upstream kernel
> but didn't find any user of them,

Note that these properties are not accessed through the dt APIs but through the
generic device-properties API. And these are set as device-properties by the
driver instantiating the fusb302 i2c-client on (some) x86 boards:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/intel_cht_int33fe.c

 > if there are actual of users, I will create
 > a PDO_VAR pdo based on dt in v2.

Thank you.

Regards,

Hans
