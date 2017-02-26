From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: hisilicon: add bindings for
 hi3798cv200 SoC and Poplar board
Date: Sun, 26 Feb 2017 02:32:19 +0100
Message-ID: <ef8cca92-7f1f-40bd-4023-2e64dcf69a68@suse.de>
References: <1487752716-14824-1-git-send-email-xuejiancheng@hisilicon.com>
 <1487752716-14824-2-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1487752716-14824-2-git-send-email-xuejiancheng@hisilicon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: devicetree@vger.kernel.org, mark.gregotski@linaro.org, arnd@arndb.de, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, xuwei5@hisilicon.com, yanhaifeng@hisilicon.com, peter.griffin@linaro.org, robh+dt@kernel.org, elder@linaro.org, hermit.wangheming@hisilicon.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am 22.02.2017 um 09:38 schrieb Jiancheng Xue:
> Add bindings for HiSilicon hi3798cv200 SoC and Poplar Board.
> =

> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> ---
>  Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.tx=
t b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
> index f1c1e21..1fd3dd7 100644
> --- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
> +++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
> @@ -4,6 +4,10 @@ Hi3660 SoC
>  Required root node properties:
>  	- compatible =3D "hisilicon,hi3660";
>  =

> +Hi3798cv200 Poplar Board
> +Required root node properties:
> +	- compatible =3D "hisilicon,hi3798cv200-poplar", "hisilicon,hi3798cv200=
";

Please remember to CC previous reviewers.

This still looks wrong: Why is this not "hisilicon,poplar" if you choose
against "tocoding,poplar"? Is there a second Poplar board with a
different SoC? Even then it would be redundant with the second
compatible string.

Regards,
Andreas

> +
>  Hi4511 Board
>  Required root node properties:
>  	- compatible =3D "hisilicon,hi3620-hi4511";

-- =

SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=FCrnberg)
