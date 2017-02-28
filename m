From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: hisilicon: add bindings for
 hi3798cv200 SoC and Poplar board
Date: Tue, 28 Feb 2017 11:42:27 +0000
Message-ID: <20170228114227.GA17088@griffinp-mac>
References: <1487752716-14824-1-git-send-email-xuejiancheng@hisilicon.com>
 <1487752716-14824-2-git-send-email-xuejiancheng@hisilicon.com>
 <ef8cca92-7f1f-40bd-4023-2e64dcf69a68@suse.de>
 <798bfd0e-bd8d-a75d-e841-53d82b513f94@hisilicon.com>
 <14a08c7d-8e25-bb5c-d700-46a07107e52f@linaro.org>
 <e9385988-27bc-b930-cbed-807beafb64bc@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <e9385988-27bc-b930-cbed-807beafb64bc@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: devicetree@vger.kernel.org, mark.gregotski@linaro.org, arnd@arndb.de, catalin.marinas@arm.com, will.deacon@arm.com, yanhaifeng@hisilicon.com, xuwei5@hisilicon.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Alex Elder <elder@linaro.org>, Jiancheng Xue <xuejiancheng@hisilicon.com>, hermit.wangheming@hisilicon.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Andreas,

On Mon, 27 Feb 2017, Andreas F=E4rber wrote:

> Hi,
> =

> Am 27.02.2017 um 03:48 schrieb Alex Elder:
> > On 02/26/2017 07:24 PM, Jiancheng Xue wrote:
> >> On 2017/2/26 9:32, Andreas F=E4rber wrote:
> >>> Am 22.02.2017 um 09:38 schrieb Jiancheng Xue:
> >>>> Add bindings for HiSilicon hi3798cv200 SoC and Poplar Board.
> >>>>
> >>>> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> >>>> ---
> >>>>  Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt | 4 +=
+++
> >>>>  1 file changed, 4 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilic=
on.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
> >>>> index f1c1e21..1fd3dd7 100644
> >>>> --- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
> >>>> +++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
> >>>> @@ -4,6 +4,10 @@ Hi3660 SoC
> >>>>  Required root node properties:
> >>>>  	- compatible =3D "hisilicon,hi3660";
> >>>>  =

> >>>> +Hi3798cv200 Poplar Board
> >>>> +Required root node properties:
> >>>> +	- compatible =3D "hisilicon,hi3798cv200-poplar", "hisilicon,hi3798=
cv200";
> >>>
> >>> Please remember to CC previous reviewers.
> >>>
> >> Sorry for that.
> >>
> >>> This still looks wrong: Why is this not "hisilicon,poplar" if you cho=
ose
> >>> against "tocoding,poplar"? =

> >>
> >> I didn't think it was very important thing whether the compatbile stri=
ng contained
> >> a preceding SoC name or not. I just referred to the hikey board and so=
me other
> >> HiSilicon boards. I wanted to keep using the same rule with them.
> > =

> > The way Jiancheng defined this was consistent with the pattern
> > used for all other definitions of platforms found in this
> > documentation file.  Why make this one different?
> =

> I am not familiar with other HiSilicon DTs but rather with several other
> vendors' DTs. This seems inconsistent with the rest. The only other one
> with SoC names in the board compatible I know of is i.MX6, where there's
> variations between single, dual and quad versions.

I've not checked all the subarchs, but STMicroelectronics chipsets I've been
involved with upstreaming also use <soc>-<board> compatible strings.

For STi b2120 board it could actually have STiH410 or STiH407 SoC. But
others like stih418-b2199 and stih410-b2260 only have one SoC. Also stm32
arch does the same thing.

Just having a quick look around arch/arm64/ as above examples were arch/arm/
and I see quite a few other examples as well e.g.

compatible =3D "mediatek,mt6755-evb", "mediatek,mt6755";
compatible =3D "mediatek,mt8173-evb", "mediatek,mt8173";
compatible =3D "fsl,ls1043a-qds", "fsl,ls1043a";
compatible =3D "samsung,exynos7-espresso", "samsung,exynos7";
compatible =3D "zte,zx296718-evb", "zte,zx296718";
compatible =3D "lge,lg1313-ref", "lge,lg1313";
compatible =3D "rockchip,rk3368-evb-act8846", "rockchip,rk3368";

Some subarchs have a mix within them, which maybe due to the SoC also
being part of the board name on some reference boards. But both ways seem t=
o be
used in the kernel. So IMHO it would be better to see consistency in
arch/arm64/hisilicon* even though there is not consistency across all of
arch/arm64/* and arch/arm/*.

regards,

Peter.
