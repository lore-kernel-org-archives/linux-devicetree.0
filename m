From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH V9 2/2] ARM: dts: Enable ahci sata and sata phy
Date: Mon, 3 Mar 2014 10:02:13 -0600
Message-ID: <C12D2EA6-2766-4C9A-8746-9B8E1A5844CD@codeaurora.org>
References: <1393824160-27040-1-git-send-email-yuvaraj.cd@samsung.com> <1393824160-27040-3-git-send-email-yuvaraj.cd@samsung.com> <53146E84.7060508@ti.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <53146E84.7060508@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, kgene.kim@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, mark.rutland@arm.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>, sander@humilis.net, swarren@wwwdotorg.org, b.zolnierkie@samsung.com, ks.giri@samsung.com, t.figa@samsung.com, jg1.han@samsung.com, joshi@samsung.com, grant.likely@linaro.org, christoffer.dall@linaro.com
List-Id: devicetree@vger.kernel.org


On Mar 3, 2014, at 5:59 AM, Kishon Vijay Abraham I <kishon@ti.com> wrot=
e:

>=20
>=20
> On Monday 03 March 2014 10:52 AM, Yuvaraj Kumar C D wrote:
>> This patch adds dt entry for ahci sata controller and its
>> corresponding phy controller.phy node has been added w.r.t
>> new generic phy framework.
>>=20
>> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
>=20
> This should go via exynos dt tree.
>=20
> FWIW
> Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
>> =97

Its a nit, but the subject really should have =91exynos=92 or some rela=
ted qualifier.  We aren=92t enabling ahci sata & phy for all of ARM

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation

