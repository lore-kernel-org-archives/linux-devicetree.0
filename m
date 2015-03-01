From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/2] dt-bindings: add root compatible property for PopMetal
 board
Date: Sun, 01 Mar 2015 14:49:39 +0800
Message-ID: <54F2B683.9010205@rock-chips.com>
References: <1425034505-25163-1-git-send-email-andy.yan@rock-chips.com> <1425034741-25229-1-git-send-email-andy.yan@rock-chips.com> <20074998.Rot74D46YJ@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20074998.Rot74D46YJ@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, naobsd@gmail.com, romain.perier@gmail.com, b.galvani@gmail.com, galak@codeaurora.org, linux-kernel@vger.kernel.org, ijc+devicetree@hellion.org.uk, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, mark.yao@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Heiko:

On 2015=E5=B9=B403=E6=9C=8801=E6=97=A5 01:43, Heiko St=C3=BCbner wrote:
> Hi Andy,
>
> Am Freitag, 27. Februar 2015, 18:59:01 schrieb Andy Yan:
>> PopMetal board is a rk3288 based board made by ChipSpark,
>> this patch add root compatible property for it
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>>
>> ---
>>
>>   Documentation/devicetree/bindings/arm/rockchip.txt | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt
>> b/Documentation/devicetree/bindings/arm/rockchip.txt index 6809e4e..=
818d249
>> 100644
>> --- a/Documentation/devicetree/bindings/arm/rockchip.txt
>> +++ b/Documentation/devicetree/bindings/arm/rockchip.txt
>> @@ -22,3 +22,7 @@ Rockchip platforms device tree bindings
>>         - compatible =3D "firefly,firefly-rk3288", "rockchip,rk3288"=
;
>>       or
>>         - compatible =3D "firefly,firefly-rk3288-beta", "rockchip,rk=
3288";
>> +
>> +- PopMetal PopMetal-RK3288 board:
> this should probably be
> 	ChipSPARK PopMetal-RK3288 board:
   ok, this will be fixed in V2
>
>
>> +    Required root node properties:
>> +      - compatible =3D "chipspark,popmetal-rk3288", "rockchip,rk328=
8";
>
>
>
