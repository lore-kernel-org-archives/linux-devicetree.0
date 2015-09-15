From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 1/6] mfd: arizona: Add TST_CAP bits for headphone
 detection
Date: Tue, 15 Sep 2015 13:05:07 +0900
Message-ID: <55F798F3.3030405@samsung.com>
References: <1441973658-26234-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1441973658-26234-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20150911122451.GB11200@ck-lbox> <20150911123757.GC11200@ck-lbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20150911123757.GC11200@ck-lbox>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, lee.jones@linaro.org
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Hi Charles,

Your following patch-set[1][2] receive the ack message about almost pat=
ches.
But, a few patches[3][4][5] must need the ack message from each maintai=
ner.
[1] http://www.spinics.net/lists/devicetree/msg93383.html
[2] https://lkml.org/lkml/2015/8/11/145
[3] patch1 is included in patch-set[1]
: [PATCH v3 1/6] mfd: arizona: Add TST_CAP bits for headphone detection
[4] patch6 is included in patch-set[1]
: [PATCH v2 6/6] mfd: arizona: Update DT binding documentation for jack=
 detection
[5] patch5 is included in patch-set[2]
[PATCH RESEND 5/5] mfd: arizona: Update DT doc for new mic detection bi=
ndings

So, if all patches receive the ack message, I'll create the immutable b=
ranch
for both EXTCON and MFD. And then I'll send the pull request to the Lee=
 Jones(MFD maintainer)

Thanks,
Chanwoo Choi

On 2015=EB=85=84 09=EC=9B=94 11=EC=9D=BC 21:37, Charles Keepax wrote:
> On Florida some additional settings are required to get accurate
> measurements at the top end of the headphone detection range. This pa=
tch
> adds the bits required for this.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>=20
> Changes since v2:
>  - Removed accidental addition of Chanwoo's ack.
>=20
> Thanks,
> Charles
>=20
>  drivers/mfd/wm5110-tables.c           |    2 ++
>  include/linux/mfd/arizona/registers.h |    8 ++++++++
>  2 files changed, 10 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mfd/wm5110-tables.c b/drivers/mfd/wm5110-tables.=
c
> index acb3bb2..78032e8 100644
> --- a/drivers/mfd/wm5110-tables.c
> +++ b/drivers/mfd/wm5110-tables.c
> @@ -1908,6 +1908,7 @@ static bool wm5110_readable_register(struct dev=
ice *dev, unsigned int reg)
>  	case ARIZONA_HP1_SHORT_CIRCUIT_CTRL:
>  	case ARIZONA_HP2_SHORT_CIRCUIT_CTRL:
>  	case ARIZONA_HP3_SHORT_CIRCUIT_CTRL:
> +	case ARIZONA_HP_TEST_CTRL_1:
>  	case ARIZONA_AIF1_BCLK_CTRL:
>  	case ARIZONA_AIF1_TX_PIN_CTRL:
>  	case ARIZONA_AIF1_RX_PIN_CTRL:
> @@ -2853,6 +2854,7 @@ static bool wm5110_volatile_register(struct dev=
ice *dev, unsigned int reg)
>  	case ARIZONA_INPUT_ENABLES_STATUS:
>  	case ARIZONA_OUTPUT_STATUS_1:
>  	case ARIZONA_RAW_OUTPUT_STATUS_1:
> +	case ARIZONA_HP_TEST_CTRL_1:
>  	case ARIZONA_SLIMBUS_RX_PORT_STATUS:
>  	case ARIZONA_SLIMBUS_TX_PORT_STATUS:
>  	case ARIZONA_INTERRUPT_STATUS_1:
> diff --git a/include/linux/mfd/arizona/registers.h b/include/linux/mf=
d/arizona/registers.h
> index e96644c..fe1b5d0 100644
> --- a/include/linux/mfd/arizona/registers.h
> +++ b/include/linux/mfd/arizona/registers.h
> @@ -237,6 +237,7 @@
>  #define ARIZONA_HP1_SHORT_CIRCUIT_CTRL           0x4A0
>  #define ARIZONA_HP2_SHORT_CIRCUIT_CTRL           0x4A1
>  #define ARIZONA_HP3_SHORT_CIRCUIT_CTRL           0x4A2
> +#define ARIZONA_HP_TEST_CTRL_1                   0x4A4
>  #define ARIZONA_SPK_CTRL_2                       0x4B5
>  #define ARIZONA_SPK_CTRL_3                       0x4B6
>  #define ARIZONA_DAC_COMP_1                       0x4DC
> @@ -3548,6 +3549,13 @@
>  #define ARIZONA_HP3_SC_ENA_WIDTH                      1  /* HP3_SC_E=
NA */
> =20
>  /*
> + * R1188 (0x4A4) HP Test Ctrl 1
> + */
> +#define ARIZONA_HP1_TST_CAP_SEL_MASK             0x0003  /* HP1_TST_=
CAP_SEL - [1:0] */
> +#define ARIZONA_HP1_TST_CAP_SEL_SHIFT                 0  /* HP1_TST_=
CAP_SEL - [1:0] */
> +#define ARIZONA_HP1_TST_CAP_SEL_WIDTH                 2  /* HP1_TST_=
CAP_SEL - [1:0] */
> +
> +/*
>   * R1244 (0x4DC) - DAC comp 1
>   */
>  #define ARIZONA_OUT_COMP_COEFF_MASK              0xFFFF  /* OUT_COMP=
_COEFF - [15:0] */
>=20
