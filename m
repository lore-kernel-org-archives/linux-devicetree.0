From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V3 4/4] dma: add Qualcomm Technologies HIDMA channel driver
Date: Mon, 9 Nov 2015 00:00:32 +0200
Message-ID: <CAHp75VdkrjzCoM9PxoatB1otz2v+UfWcwf9=ATpq_ah0UobMMg@mail.gmail.com>
References: <1446958380-23298-1-git-send-email-okaya@codeaurora.org>
	<1446958380-23298-5-git-send-email-okaya@codeaurora.org>
	<CAHp75VebMdGRkgddoaCH_d_7hzXJt9QXqWc4yvSY=PJ-FcsRLA@mail.gmail.com>
	<563FC3EA.1040303@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <563FC3EA.1040303@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine <dmaengine@vger.kernel.org>, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 8, 2015 at 11:51 PM, Sinan Kaya <okaya@codeaurora.org> wrot=
e:
>
>
> On 11/8/2015 3:47 PM, Andy Shevchenko wrote:
>>>
>>> +       trca_resource =3D platform_get_resource(pdev, IORESOURCE_ME=
M, 0);
>>> >+       if (!trca_resource) {
>>> >+               rc =3D -ENODEV;
>>> >+               goto bailout;
>>> >+       }
>>
>> Why did you ignore my comment about this block?
>> Remove that condition entirely.
>>
>>> >+
>>> >+       trca =3D devm_ioremap_resource(&pdev->dev, trca_resource);
>>> >+       if (IS_ERR(trca)) {
>>> >+               rc =3D -ENOMEM;
>>> >+               goto bailout;
>>> >+       }
>
>
> Sorry, I didn't quite get your comment. I thought you wanted to see
> platform_get_resource and devm_ioremap_resource together.
>
> Which one do you want me to remove?

At the end you would have something like

res =3D platform_get_resource();
addr =3D devm_ioremap_resources();
if (!addr) {
=E2=80=A6
}

--=20
With Best Regards,
Andy Shevchenko
