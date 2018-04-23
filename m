From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: sun8i: h3: Add SY8106A
 regulator to Orange Pi PC
Date: Mon, 23 Apr 2018 23:04:43 +0800
Message-ID: <34DAE9CF-AB6D-4FB9-9FA6-FAE4E4D2D4C3@aosc.io>
References: <20180423144657.63264-1-icenowy@aosc.io> <20180423144657.63264-4-icenowy@aosc.io> <20180423150309.dksr2rjazlrmlzx2@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBHXM67LAKGQEDQQPCXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180423150309.dksr2rjazlrmlzx2@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B44=E6=9C=8823=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=8811=
:03:09, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>On Mon, Apr 23, 2018 at 10:46:57PM +0800, Icenowy Zheng wrote:
>> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
>>=20
>> Add SY8106A regulator to r_i2c bus and enable the r_i2c bus on
>> Orange Pi PC, then set the power supply of the ARM cores to this
>> regulator, in order to enable DVFS.
>>=20
>> Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
>> [Icenowy: Enable DVFS in this patch, slight changes and change commit
>>  message]
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> [wens-jdAy2FN1RRM@public.gmane.org: Rename regulator label]
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>
>Why is there Chen-Yu's SoB? It doesn't really make much sense, unless
>Chen-Yu would have applied this patch already, but then you wouldn't
>post it, right?

This is taken from sunxi/h3-h5-for-4.18 branch, which has
label name change from wens, and then added microvolt property.

So his SoB is from when he apply it for the first time.

>
>Maxime=20
>
>> ---

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
