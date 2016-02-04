From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: Add a binding for Mediatek Video Processor
Date: Thu, 4 Feb 2016 12:04:14 -0600
Message-ID: <CAL_JsqJqQ+QRgg6HGQeGk0=rBEwQq7i-ZfoDahZwXLuvMC-=_A@mail.gmail.com>
References: <1451902316-55931-1-git-send-email-tiffany.lin@mediatek.com>
 <1451902316-55931-2-git-send-email-tiffany.lin@mediatek.com>
 <20160104141506.GA22801@rob-hp-laptop> <1454586583.7571.3.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454586583.7571.3.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: tiffany lin <tiffany.lin@mediatek.com>
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Daniel Kurtz <djkurtz@chromium.org>, =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?= <Andrew-CT.Chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 4, 2016 at 5:49 AM, tiffany lin <tiffany.lin@mediatek.com> wrote:
> Hi Rob,
>
>
>
>
> On Mon, 2016-01-04 at 22:15 +0800, Rob Herring wrote:
>> On Mon, Jan 04, 2016 at 06:11:49PM +0800, Tiffany Lin wrote:
>> > From: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
>> >
>> > Add a DT binding documentation of Video Processor Unit for the
>> > MT8173 SoC from Mediatek.
>> >
>> > Signed-off-by: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
>> > Signed-off-by: Tiffany Lin <tiffany.lin@mediatek.com>
>>
>> Please add acks when sending new versions as I already acked the last
>> version.
>>
> Since we remove iommu attach and add 4GB support for VPU.
> We send the new device tree and binding document.
> We do not add Acked-by in v4 patches.

Okay, then you should explain that in the patch.

Rob
