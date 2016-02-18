From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v8 0/2] Add Rockchip Inno-HDMI driver
Date: Thu, 18 Feb 2016 15:55:00 +0800
Message-ID: <56C578D4.30108@rock-chips.com>
References: <1454049768-30872-1-git-send-email-ykk@rock-chips.com>
 <56C560B2.6020208@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56C560B2.6020208@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <treding@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Ken Mixte <kmixter@google.com>, Ben Chan <benchan@google.com>, Zheng Yang <zhengyang@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

Thanks for your apply ;)

- Yakir

On 02/18/2016 02:12 PM, Mark yao wrote:
> On 2016=E5=B9=B401=E6=9C=8829=E6=97=A5 14:42, Yakir Yang wrote:
>> Here are a brief introduction to Innosilicon HDMI IP:
>>    - Support HDMI 1.4a, HDCP 1.2 and DVI 1.0 standard compliant=20
>> transmitter
>>    - Support HDMI1.4 a/b 3D function defined in HDMI 1.4 a/b spec
>>    - Digital video interface supports a pixel size of 24, 30, 36,=20
>> 48bits color depth in RGB
>>    - S/PDIF output supports PCM, Dolby Digital, DTS digital audio=20
>> transmission
>>      (32-192kHz Fs) using IEC60958 and IEC 61937
>>    - The EDID and CEC function are also supported by Innosilicon HDM=
I=20
>> Transmitter Controlle
>>
>> Changes in v8:
>> - Don't check whether encoder output format is RGB colorspace, cause=
=20
>> driver
>>    default configure the output colorspace to RGB. (ZhengYang)
>> - Correct the check condition in inno_hdmi_config_video_csc()=20
>> (ZhengYang)
>>      - if (data->enc_out_format =3D=3D data->enc_out_format) {
>>      + if (data->enc_in_format =3D=3D data->enc_out_format) {
>>
>> Changes in v7:
>> - Correct the module licnese statement (Paul)
>>       - MODULE_LICENSE("GPL");
>>       + MODULE_LICENSE("GPLv2");
>> - Start indentation with tabs and fix the misspell in Kconfig (Paul)
>> - Carry the lost device-binding document (Heiko)
>>
>> Changes in v6:
>> - Rebase the Makefile/Kconfig files which add by Chris's=20
>> rockchip-mipi driver (Caeser)
>>
>> Changes in v5:
>> - Use hdmi_infoframe helper functions to packed the infoframe (Russe=
ll)
>> - Remove the unused double wait_for_completion_timeout for ddc=20
>> transfer (Russell)
>> - Remove the unused local variable in "inno_hdmi_i2c_write()"=20
>> function (Russell)
>>
>> Changes in v4:
>> - Modify the commit title "drm/rockchip: hdmi: ..." (Mark)
>> - Correct the "DKMS" to "DPMS" (Mark)
>> - Fix over 80 characters problems (Mark)
>> - Remove encoder .prepare/.commit helper functions, and move the vop=
=20
>> mode
>> configure function into encoder .enable helper functions. (Mark)
>>
>> Changes in v3:
>> - Use encoder enable/disable function, and remove the encoder DPMS=20
>> function
>> - Keep HDMI PLL power on in standby mode
>>
>> Changes in v2:
>> - Using DRM atomic helper functions for connector init (Mark)
>> - Remove "hdmi->connector.encoder =3D encoder;" (Mark)
>> - Add the Acked-by tags from Rob
>> - Correct the misspell "rk3036-dw-hdmi" (Heiko)
>>
>> Yakir Yang (2):
>>    drm/rockchip: hdmi: add Innosilicon HDMI support
>>    dt-bindings: add document for Innosilicon HDMI on Rockchip platfo=
rm
>>
>>   .../display/rockchip/inno_hdmi-rockchip.txt        |  50 ++
>>   drivers/gpu/drm/rockchip/Kconfig                   |   8 +
>>   drivers/gpu/drm/rockchip/Makefile                  |   1 +
>>   drivers/gpu/drm/rockchip/inno_hdmi.c               | 939=20
>> +++++++++++++++++++++
>>   drivers/gpu/drm/rockchip/inno_hdmi.h               | 362 ++++++++
>>   5 files changed, 1360 insertions(+)
>>   create mode 100644=20
>> Documentation/devicetree/bindings/display/rockchip/inno_hdmi-rockchi=
p.txt
>>   create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.c
>>   create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.h
>>
>
> Applied to my branch :-) .
>
> Thanks.
>
