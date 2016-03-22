From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [RFC PATCH v1 0/4] Add Rockchip RGA support
Date: Tue, 22 Mar 2016 11:24:06 +0100
Message-ID: <56F11D46.8080208@suse.de>
References: <1458552518-25527-1-git-send-email-ykk@rock-chips.com>
 <1511371.I0NIYzh3kP@diego> <56EFE66A.8020404@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56EFE66A.8020404@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Joonyoung Shim <jy0922.shim@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Mark Yao <mark.yao@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi Yakir,

Am 21.03.2016 um 13:17 schrieb Yakir Yang:
> On 03/21/2016 07:29 PM, Heiko St=FCbner wrote:
>> Am Montag, 21. M=E4rz 2016, 17:28:38 schrieb Yakir Yang:
>>> This patch set would add the RGA direct rendering based 2d graphics
>>> acceleration module.
>> very cool to see that.
> ;)
>>> This patch set is based on git repository below:
>>> git://people.freedesktop.org/~airlied/linux drm-next
>>> commit id: 568d7c764ae01f3706085ac8f0d8a8ac7e826bd7
>>>
>>> And the RGA driver is based on Exynos G2D driver, it only manages t=
he
>>> command lists received from user, so user should make the command l=
ist
>>> to data and registers needed by operation to use.
>>>
>>> I have prepared an userspace demo application for testing:
>>>     https://github.com/yakir-Yang/libdrm-rockchip
>>> That is a rockchip libdrm library, and I have write a simple test c=
ase
>>> "rockchip_rga_test" that would test the below RGA features:
>>> - solid
>>> - copy
>>> - rotation
>>> - flip
>>> - window clip
>>> - dithering
>> Did you submit your libdrm changes as well?
>>
>> Userspace-interfaces need to be stable so the other side must also g=
et
>> accepted - even before the kernel change if I remember correctly.
>=20
> Got it, and I just saw exynos_fimg2d already landed at mainline libdr=
m.
> But I don't find the way to submit patches to libdrm, would you like
> share some helps here ;)

If you're using Exynos as an example, please keep in mind that the
libdrm license is MIT/X11, not GPL as the kernel. For our Linux distro
we had to disable some Exynos parts because they snuck some GPL code in
there and redistributing libdrm under GPL would cause a big headache
(review of all packages directly or indirectly linking against it).

Thanks,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=FC=
rnberg)
