From: Hans Verkuil <hansverk@cisco.com>
Subject: Re: [PATCH v3 0/9] Add MT8173 Video Decoder Driver
Date: Wed, 8 Jun 2016 07:13:02 +0900
Message-ID: <575746EE.3030706@cisco.com>
References: <1464611363-14936-1-git-send-email-tiffany.lin@mediatek.com>
 <20160607112235.475c2e4c@recife.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160607112235.475c2e4c@recife.lan>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Tiffany Lin <tiffany.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, PoChun.Lin@mediatek.com, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Pawel Osciak <posciak@chromium.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 06/07/2016 11:22 PM, Mauro Carvalho Chehab wrote:
> Em Mon, 30 May 2016 20:29:14 +0800
> Tiffany Lin <tiffany.lin@mediatek.com> escreveu:
>
>> ==============
>>   Introduction
>> ==============
>>
>> The purpose of this series is to add the driver for video codec hw embedded in the Mediatek's MT8173 SoCs.
>> Mediatek Video Codec is able to handle video decoding of in a range of formats.
>>
>> This patch series add Mediatek block format V4L2_PIX_FMT_MT21, the decoder driver will decoded bitstream to
>> V4L2_PIX_FMT_MT21 format.
>>
>> This patch series rely on MTK VPU driver in patch series "Add MT8173 Video Encoder Driver and VPU Driver"[1]
>> and patch "CHROMIUM: v4l: Add V4L2_PIX_FMT_VP9 definition"[2] for VP9 support.
>> Mediatek Video Decoder driver rely on VPU driver to load, communicate with VPU.
>>
>> Internally the driver uses videobuf2 framework and MTK IOMMU and MTK SMI both have been merged in v4.6-rc1.
>>
>> [1]https://patchwork.linuxtv.org/patch/33734/
>> [2]https://chromium-review.googlesource.com/#/c/245241/
>
> Hmm... I'm not seeing the firmware for this driver at the
> linux-firmware tree:
> 	https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/log/
>
> Nor I'm seeing any pull request for them. Did you send it?
> I'll only merge the driver upstream after seeing such pull request.

Mauro, are you confusing the decoder and encoder driver? I haven't thoroughly reviewed the decoder driver
yet, so there is no pull request for the decoder driver.

The only pull request I made was for the encoder driver.

Regards,

	Hans
