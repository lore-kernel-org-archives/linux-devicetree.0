From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 0/2] add dts for PopMetal board
Date: Thu, 05 Mar 2015 08:56:04 +0800
Message-ID: <54F7A9A4.2030209@rock-chips.com>
References: <1425201914-4695-1-git-send-email-andy.yan@rock-chips.com> <2239622.yIer0hBRK8@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2239622.yIer0hBRK8@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, naobsd@gmail.com, romain.perier@gmail.com, b.galvani@gmail.com, galak@codeaurora.org, linux-kernel@vger.kernel.org, ijc+devicetree@hellion.org.uk, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, mark.yao@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Heiko:
  Thanks very much.
On 2015=E5=B9=B403=E6=9C=8805=E6=97=A5 03:57, Heiko Stuebner wrote:
> Hi Andy,
>
> Am Sonntag, 1. M=C3=A4rz 2015, 17:25:14 schrieb Andy Yan:
>> PopMetal is a rockchip rk3288 based board made by ChipSpark,
>> which has many interface such as VGA,HDMI,usb,ir,sdcad and lots of
>> sensors such as gyroscope(L3G4200D),accelerometer(mma8452),compass(A=
K8963C).
>>
>> http://wiki.chipspark.com/en/index.php?title=3DPopMetal
>>
>> This patch add basic support for it, which can boot the board
>> into a shell with linux boot logo on hdmi, sdcard and many
>> sensors enabled. More feather will be enabled later.
> I've added both patches to my dts branch
>
>
> Heiko
>
>
>
