From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v2 1/2] dmaengine: add Qualcomm BAM dma driver
Date: Thu, 23 Jan 2014 14:17:19 -0600
Message-ID: <9038342A-D629-479C-819B-EF5F4DB52B50@codeaurora.org>
References: <1389380874-22753-1-git-send-email-agross@codeaurora.org> <201401172349.28229.arnd@arndb.de> <20140120225245.GA3530@qualcomm.com> <5548936.L46nLkuVIz@wuerfel> <20140121230103.GA3554@qualcomm.com>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140121230103.GA3554@qualcomm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine <dmaengine@vger.kernel.org>, linux-arm-msm@vger.kernel.org, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On Jan 21, 2014, at 5:01 PM, Andy Gross <agross@codeaurora.org> wrote:

> On Tue, Jan 21, 2014 at 09:03:43AM +0100, Arnd Bergmann wrote:
>> On Monday 20 January 2014 16:52:45 Andy Gross wrote:
>>=20
>>>>> +#ifdef CONFIG_OF
>>>>> +static const struct of_device_id bam_of_match[] =3D {
>>>>> +	{ .compatible =3D "qcom,bam-v1.4.0", },
>>>>> +	{ .compatible =3D "qcom,bam-v1.4.1", },
>>>>> +	{}
>>>>> +};
>>>>> +MODULE_DEVICE_TABLE(of, bam_of_match);
>>>>> +#endif
>>>>=20
>>>> Also, you can remove the #ifdef here and the of_match_ptr() below.
>>>>=20
>>>=20
>>> If this is removed, then I'll have to add the OF dependency in the =
Kconfig,
>>> correct?
>>=20
>> I believe it will still compile without the CONFIG_OF dependency, bu=
t
>> having the dependency still makes sense as it's impossible to use th=
e
>> driver without CONFIG_OF.
>>=20
>> The best dependency line is probably
>>=20
>> 	depends on (ARCH_MSM && OF) || COMPILE_TEST"
>>=20
>> If you expect the same driver to be used on non-MSM platforms from
>> qualcomm, e.g. some networking or server equipment, you can also jus=
t
>> drop the ARCH_MSM dependency.
>=20
>=20
> Thanks for the clarification.  I think I'll probably do:
> ARCH_MSM_DT || (COMPILE_TEST && ARM)

Didn=92t you need it to be:

ARCH_MSM_DT || (COMPILE_TEST && OF && ARM)

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
