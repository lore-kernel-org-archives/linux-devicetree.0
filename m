From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V17 2/3] dmaengine: qcom_hidma: add debugfs hooks
Date: Tue, 26 Apr 2016 12:55:18 -0400
Message-ID: <571F9D76.2060809@codeaurora.org>
References: <1460384473-5775-1-git-send-email-okaya@codeaurora.org>
 <1460384473-5775-3-git-send-email-okaya@codeaurora.org>
 <20160426033029.GB2274@localhost>
 <b068ead6474f2ffee5acef9ea799aba3@codeaurora.org>
 <20160426162529.GK2274@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160426162529.GK2274@localhost>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, shankerd@codeaurora.org, vikrams@codeaurora.org, marc.zyngier@arm.com, mark.rutland@arm.com, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/26/2016 12:25 PM, Vinod Koul wrote:
> On Tue, Apr 26, 2016 at 08:08:16AM -0400, okaya@codeaurora.org wrote:
>> On 2016-04-25 23:30, Vinod Koul wrote:
>>> On Mon, Apr 11, 2016 at 10:21:12AM -0400, Sinan Kaya wrote:
>>>
>>>> +static int hidma_chan_stats(struct seq_file *s, void *unused)
>>>> +{
>>>> +	struct hidma_chan *mchan =3D s->private;
>>>> +	struct hidma_desc *mdesc;
>>>> +	struct hidma_dev *dmadev =3D mchan->dmadev;
>>>> +
>>>> +	pm_runtime_get_sync(dmadev->ddev.dev);
>>>
>>> debug shouldn't power up device, why do you want to do that
>>
>>
>> Clocks are turned off while the hw is idle. I can=E2=80=99t reach hw
>> registers without restoring power.
>=20
> Hmm, have you thought about using regmap?
>=20

To be honest, I didn't know what regmap is but I just read some code
and looked at how it is used. Feel free to correct me if I got it=20
wrong.=20

Regmap seems to be designed for *slow* speed peripherals to improve fre=
quent
accesses by the SW. It looks like it is used by MFD, SPI and I2C driver=
s.

It seems to cache the register contents and flush/invalidate them only =
when
needed.

The MMIO version seems to be assuming the presence of device-tree like =
CLK
API which doesn't exist on ACPI systems and is not portable.

My reaction is that it is a lot of code with no added functionality to =
what
HIDMA driver is trying to achieve.=20

Given that the use case here is only for debug purposes; I think it is =
OK=20
to keep this runtime call here. I don't want to add any overhead into t=
he
existing code just to support the debug use case. =20

None of my register read/writes are slow. This file will only be used t=
o=20
troubleshoot customer issues.

--=20
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, In=
c.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Li=
nux Foundation Collaborative Project
