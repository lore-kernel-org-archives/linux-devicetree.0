From: okaya@codeaurora.org
Subject: Re: [PATCH V17 2/3] dmaengine: qcom_hidma: add debugfs hooks
Date: Wed, 27 Apr 2016 09:25:06 -0400
Message-ID: <64be6f181a4c5b712fc3893e9ecd19df@codeaurora.org>
References: <1460384473-5775-1-git-send-email-okaya@codeaurora.org>
 <1460384473-5775-3-git-send-email-okaya@codeaurora.org>
 <20160426033029.GB2274@localhost>
 <b068ead6474f2ffee5acef9ea799aba3@codeaurora.org>
 <20160426162529.GK2274@localhost> <571F9D76.2060809@codeaurora.org>
 <20160427081501.GV2274@localhost> <57207CB1.4040307@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <57207CB1.4040307@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, shankerd@codeaurora.org, vikrams@codeaurora.org, mark.rutland@arm.com, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2016-04-27 04:47, Marc Zyngier wrote:
> On 27/04/16 09:15, Vinod Koul wrote:
>> On Tue, Apr 26, 2016 at 12:55:18PM -0400, Sinan Kaya wrote:
>>> On 4/26/2016 12:25 PM, Vinod Koul wrote:
>>>> On Tue, Apr 26, 2016 at 08:08:16AM -0400, okaya@codeaurora.org=20
>>>> wrote:
>>>>> On 2016-04-25 23:30, Vinod Koul wrote:
>>>>>> On Mon, Apr 11, 2016 at 10:21:12AM -0400, Sinan Kaya wrote:
>>>>>>=20
>>>>>>> +static int hidma_chan_stats(struct seq_file *s, void *unused)
>>>>>>> +{
>>>>>>> +	struct hidma_chan *mchan =3D s->private;
>>>>>>> +	struct hidma_desc *mdesc;
>>>>>>> +	struct hidma_dev *dmadev =3D mchan->dmadev;
>>>>>>> +
>>>>>>> +	pm_runtime_get_sync(dmadev->ddev.dev);
>>>>>>=20
>>>>>> debug shouldn't power up device, why do you want to do that
>>>>>=20
>>>>>=20
>>>>> Clocks are turned off while the hw is idle. I can=E2=80=99t reach=
 hw
>>>>> registers without restoring power.
>>>>=20
>>>> Hmm, have you thought about using regmap?
>>>>=20
>>>=20
>>> To be honest, I didn't know what regmap is but I just read some cod=
e
>>> and looked at how it is used. Feel free to correct me if I got it
>>> wrong.
>>>=20
>>> Regmap seems to be designed for *slow* speed peripherals to improve=
=20
>>> frequent
>>> accesses by the SW. It looks like it is used by MFD, SPI and I2C=20
>>> drivers.
>>>=20
>>> It seems to cache the register contents and flush/invalidate them=20
>>> only when
>>> needed.
>>>=20
>>> The MMIO version seems to be assuming the presence of device-tree=20
>>> like CLK
>>> API which doesn't exist on ACPI systems and is not portable.
>>>=20
>>> My reaction is that it is a lot of code with no added functionality=
=20
>>> to what
>>> HIDMA driver is trying to achieve.
>>>=20
>>> Given that the use case here is only for debug purposes; I think it=
=20
>>> is OK
>>> to keep this runtime call here. I don't want to add any overhead in=
to=20
>>> the
>>> existing code just to support the debug use case.
>>>=20
>>> None of my register read/writes are slow. This file will only be us=
ed=20
>>> to
>>> troubleshoot customer issues.
>=20
> I'd recommend you actually run perf on a a few of your MMIO accesses.=
 I
> believe the result will be eye opening. On the KVM side, we've trimme=
d
> our MMIO access as much as possible, using a memory-based cache=20
> (similar
> to regmap in concept). This has made some code paths about 40% faster=
=2E
>=20
>> $ is always faster than MMIO. This way you can give reg contents to=20
>> users
>> without waking up hw.
>=20
> Indeed. MMIO access sucks rocks, even on a very fast box. Actually, t=
he
> faster the box is, the slower MMIO feels (compared to memory).
>=20
> Thanks,
>=20
> 	M.


Agreed. However, I need to understand how regmap really works under the=
=20
covers and whether it is compatible with the hardware.
