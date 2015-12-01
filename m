From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 02/10] drm/hisilicon: Add DT binding docs for hi6220
 display subsystem
Date: Tue, 1 Dec 2015 07:58:58 -0600
Message-ID: <CAL_JsqLsdMb7MaDdfXGTx0-dV1y__RPhJVGSvAh=ftPpH9woKA@mail.gmail.com>
References: <1448707145-69348-1-git-send-email-xinliang.liu@linaro.org>
 <1448707145-69348-3-git-send-email-xinliang.liu@linaro.org>
 <20151130193130.GA1616@rob-hp-laptop> <CAGd==07B4e6uevH5LmW_MeG4SbViKqQ+MwKTtWtXi4UBmv6pSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAGd==07B4e6uevH5LmW_MeG4SbViKqQ+MwKTtWtXi4UBmv6pSw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Xinliang Liu <xinliang.liu@linaro.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>, Jon Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Linuxarm <linuxarm@huawei.com>, Andy Green <andy.green@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>, Xu Wei <xuwei5@hisilicon.com>, Wang Fei <w.f@huawei.com>, Feng Chen <puck.chen@hisilicon.com>, Bintian Wang <bintian.wang@huawei.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yiping Xu <xuyiping@hisilicon.com>, XinWei Kong <kong.kongxinwei@hisilicon.c>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 1, 2015 at 1:17 AM, Xinliang Liu <xinliang.liu@linaro.org> wrote:
> On 1 December 2015 at 03:31, Rob Herring <robh@kernel.org> wrote:
>
> Hi Rob, thank you for review.
>
>> On Sat, Nov 28, 2015 at 06:38:57PM +0800, Xinliang Liu wrote:
>>> Add the device tree binding documentation for hi6220 SoC display subsystem.
>>> drm master device binding doc.
>>> ADE display controller binding doc.
>>> DSI controller binding doc.

>>> +Required properties:
>>> +- compatible: Should be "hisilicon,<chip>-dss"
>>> +- #address-cells: should be set to 2.
>>> +- #size-cells: should be set to 2.
>>> +- range: to allow probing of subdevices.
>>> +
>>> +Optional properties:
>>> +- dma-coherent: Present if dma operations are coherent.
>>
>> Put this on the actually DMA master.
>
> The DMA modules reside in the begining of each channel(or plane) of ADE.
> So I need to put this dma-coherent property to ADE device node, right?

Right.

Rob
