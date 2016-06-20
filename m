Return-Path: <han.xu@nxp.com>
From: Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH v2 4/6] mtd: nand: gpmi: correct bitflip for erased NAND
 page
Date: Mon, 20 Jun 2016 16:45:32 +0000
Message-ID: <AM4PR0401MB18410DF669E46477346DC47F972A0@AM4PR0401MB1841.eurprd04.prod.outlook.com>
References: <1465578094-8816-1-git-send-email-han.xu@nxp.com>
	<1465578094-8816-5-git-send-email-han.xu@nxp.com>,<20160614211401.40c26b37@bbrezillon>
In-Reply-To: <20160614211401.40c26b37@bbrezillon>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM4PR0401MB18410DF669E46477346DC47F972A0AM4PR0401MB1841_"
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--_000_AM4PR0401MB18410DF669E46477346DC47F972A0AM4PR0401MB1841_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________
From: Boris Brezillon <boris.brezillon@free-electrons.com>
Sent: Tuesday, June 14, 2016 1:14 PM
To: Han Xu
Cc: richard@nod.at; dwmw2@infradead.org; computersforpeace@gmail.com; robh+=
dt@kernel.org; pawel.moll@arm.com; mark.rutland@arm.com; ijc+devicetree@hel=
lion.org.uk; galak@codeaurora.org; devicetree@vger.kernel.org; linux-mtd@li=
sts.infradead.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] mtd: nand: gpmi: correct bitflip for erased NAN=
D page

On Fri, 10 Jun 2016 12:01:32 -0500
Han Xu <han.xu@nxp.com> wrote:

> i.MX6QP and i.MX7D BCH module integrated a new feature to detect the
> bitflip number for erased NAND page. So for these two platform, set the
> erase threshold to ecc_strength and if bitflip detected, GPMI driver
> will correct the data to all 0xFF.
>
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  drivers/mtd/nand/gpmi-nand/bch-regs.h  | 10 ++++++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  5 +++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 27 ++++++++++++++++++++++++++-
>  3 files changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpm=
i-nand/bch-regs.h
> index 228142c..2c44b88 100644
> --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
> +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> @@ -30,7 +30,13 @@
>  #define BM_BCH_CTRL_COMPLETE_IRQ             (1 << 0)
>
>  #define HW_BCH_STATUS0                               0x00000010
> +
>  #define HW_BCH_MODE                          0x00000020
> +#define BP_BCH_MODE_ERASE_THRESHOLD          0
> +#define BM_BCH_MODE_ERASE_THRESHOLD  (0xff << BP_BCH_MODE_ERASE_THRESHOL=
D)
> +#define BF_BCH_MODE_ERASE_THRESHOLD(v)               \
> +     (((v) << BP_BCH_MODE_ERASE_THRESHOLD) & BM_BCH_MODE_ERASE_THRESHOLD=
)
> +
>  #define HW_BCH_ENCODEPTR                     0x00000030
>  #define HW_BCH_DATAPTR                               0x00000040
>  #define HW_BCH_METAPTR                               0x00000050
> @@ -125,4 +131,8 @@
>        )
>
>  #define HW_BCH_VERSION                               0x00000160
> +#define HW_BCH_DEBUG1                                0x00000170
> +#define BP_BCH_DEBUG1_ERASED_ZERO_COUNT      0
> +#define BM_BCH_DEBUG1_ERASED_ZERO_COUNT              \
> +             (0x1ff << BP_BCH_DEBUG1_ERASED_ZERO_COUNT)
>  #endif
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpm=
i-nand/gpmi-lib.c
> index 358ff5d..0b5666a 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -298,6 +298,11 @@ int bch_set_geometry(struct gpmi_nand_data *this)
>                        | BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this=
),
>                        r->bch_regs + HW_BCH_FLASH0LAYOUT1);
>
> +     /* Set erase threshold to ecc_strength for mx6qp and mx7 */
> +     if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this))
> +             writel(BF_BCH_MODE_ERASE_THRESHOLD(ecc_strength),
> +                     r->bch_regs + HW_BCH_MODE);
> +
>        /* Set *all* chip selects to use layout 0. */
>        writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index aedaff3..03bdb4d 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1043,6 +1043,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd,=
 struct nand_chip *chip,
>  {
>        struct gpmi_nand_data *this =3D nand_get_controller_data(chip);
>        struct bch_geometry *nfc_geo =3D &this->bch_geometry;
> +     void __iomem *bch_regs =3D this->resources.bch_regs;
>        void          *payload_virt;
>        dma_addr_t    payload_phys;
>        void          *auxiliary_virt;
> @@ -1051,6 +1052,8 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd,=
 struct nand_chip *chip,
>        unsigned char *status;
>        unsigned int  max_bitflips =3D 0;
>        int           ret;
> +     int bitflips =3D 0;
> +     int bitflip_flag =3D 0;

Hm, I would choose another name, but I'm not even sure this is really
needed (see below).

>
>        dev_dbg(this->dev, "page number is : %d\n", page);
>        ret =3D read_page_prepare(this, buf, nfc_geo->payload_size,
> @@ -1088,8 +1091,20 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd=
, struct nand_chip *chip,
>                           payload_virt, payload_phys);
>
>        for (i =3D 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
> -             if ((*status =3D=3D STATUS_GOOD) || (*status =3D=3D STATUS_=
ERASED))
> +             if (*status =3D=3D STATUS_GOOD)
> +                     continue;
> +             if (*status =3D=3D STATUS_ERASED) {
> +                     if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this)) {
> +                             bitflips =3D readl(bch_regs + HW_BCH_DEBUG1=
);

You could use ret here or define a flips variable locally to this code
(see what's done for the software correction).

BTW, why not memset-ing the data chunk here (as done for the SW
correction part). This way you wouldn't need the extra bitflips_flag
variable.

> +                             if (bitflips) {
> +                                     bitflip_flag =3D 1;
> +                                     max_bitflips =3D max_t(unsigned int=
,
> +                                                          max_bitflips,
> +                                                          bitflips);
> +                             }
> +                     }
>                        continue;
> +             }
>
>                if (*status =3D=3D STATUS_UNCORRECTABLE) {
>                        int eccbits =3D nfc_geo->ecc_strength * nfc_geo->g=
f_len;
> @@ -1098,6 +1113,10 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd=
, struct nand_chip *chip,
>                        int eccbytes;
>                        int flips;
>
> +                     /* shortcut for i.MX7 and i.MX6QP */
> +                     if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this))

You should increment mtd->ecc_stats.failed in this case.

Do you mean increase the mtd->ecc_stats.corrected when flips happened?

> +                             continue;
> +
>                        /* Read ECC bytes into our internal raw_buffer */
>                        offset =3D nfc_geo->metadata_size * 8;
>                        offset +=3D ((8 * nfc_geo->ecc_chunk_size) + eccbi=
ts) * (i + 1);
> @@ -1182,6 +1201,12 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd=
, struct nand_chip *chip,
>                chip->oob_poi[0] =3D ((uint8_t *) auxiliary_virt)[0];
>        }
>
> +     /* if bitflip occurred in erased page, change data to all 0xff */
> +     if (bitflip_flag) {
> +             memset(buf, ~0, nfc_geo->payload_size);
> +             memset(chip->oob_poi, ~0, mtd->oobsize);
> +     }
> +
>        return max_bitflips;
>  }
>



--
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
Embedded Linux Experts - Free Electrons<http://free-electrons.com/>
free-electrons.com
Free Electrons is an engineering company specialized in embedded Linux and =
more generally in Free and Open Source software for embedded systems.




--_000_AM4PR0401MB18410DF669E46477346DC47F972A0AM4PR0401MB1841_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;back=
ground-color:#FFFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p><br>
</p>
<br>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Boris Brezillon &lt=
;boris.brezillon@free-electrons.com&gt;<br>
<b>Sent:</b> Tuesday, June 14, 2016 1:14 PM<br>
<b>To:</b> Han Xu<br>
<b>Cc:</b> richard@nod.at; dwmw2@infradead.org; computersforpeace@gmail.com=
; robh&#43;dt@kernel.org; pawel.moll@arm.com; mark.rutland@arm.com; ijc&#43=
;devicetree@hellion.org.uk; galak@codeaurora.org; devicetree@vger.kernel.or=
g; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org<br>
<b>Subject:</b> Re: [PATCH v2 4/6] mtd: nand: gpmi: correct bitflip for era=
sed NAND page</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Fri, 10 Jun 2016 12:01:32 -0500<br>
Han Xu &lt;han.xu@nxp.com&gt; wrote:<br>
<br>
&gt; i.MX6QP and i.MX7D BCH module integrated a new feature to detect the<b=
r>
&gt; bitflip number for erased NAND page. So for these two platform, set th=
e<br>
&gt; erase threshold to ecc_strength and if bitflip detected, GPMI driver<b=
r>
&gt; will correct the data to all 0xFF.<br>
&gt; <br>
&gt; Signed-off-by: Han Xu &lt;han.xu@nxp.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/mtd/nand/gpmi-nand/bch-regs.h&nbsp; | 10 &#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; drivers/mtd/nand/gpmi-nand/gpmi-lib.c&nbsp; |&nbsp; 5 &#43;&#43;=
&#43;&#43;&#43;<br>
&gt;&nbsp; drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 27 &#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;-<br>
&gt;&nbsp; 3 files changed, 41 insertions(&#43;), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/=
gpmi-nand/bch-regs.h<br>
&gt; index 228142c..2c44b88 100644<br>
&gt; --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h<br>
&gt; &#43;&#43;&#43; b/drivers/mtd/nand/gpmi-nand/bch-regs.h<br>
&gt; @@ -30,7 &#43;30,13 @@<br>
&gt;&nbsp; #define BM_BCH_CTRL_COMPLETE_IRQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1 &lt;&lt; 0)<br>
&gt;&nbsp; <br>
&gt;&nbsp; #define HW_BCH_STATUS0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000010<=
br>
&gt; &#43;<br>
&gt;&nbsp; #define HW_BCH_MODE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000020<br>
&gt; &#43;#define BP_BCH_MODE_ERASE_THRESHOLD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&gt; &#43;#define BM_BCH_MODE_ERASE_THRESHOLD&nbsp; (0xff &lt;&lt; BP_BCH_M=
ODE_ERASE_THRESHOLD)<br>
&gt; &#43;#define BF_BCH_MODE_ERASE_THRESHOLD(v)&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; (((v) &lt;&lt; BP_BCH_MODE_ERASE_THRESHO=
LD) &amp; BM_BCH_MODE_ERASE_THRESHOLD)<br>
&gt; &#43;<br>
&gt;&nbsp; #define HW_BCH_ENCODEPTR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; 0x00000030<br>
&gt;&nbsp; #define HW_BCH_DATAPTR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000040<=
br>
&gt;&nbsp; #define HW_BCH_METAPTR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000050<=
br>
&gt; @@ -125,4 &#43;131,8 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
&gt;&nbsp; <br>
&gt;&nbsp; #define HW_BCH_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000160<=
br>
&gt; &#43;#define HW_BCH_DEBUG1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000=
170<br>
&gt; &#43;#define BP_BCH_DEBUG1_ERASED_ZERO_COUNT&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0<br>
&gt; &#43;#define BM_BCH_DEBUG1_ERASED_ZERO_COUNT&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; (0x1ff &lt;&lt; BP_BCH_DEBUG1_ERASED_ZERO_COUNT)<br>
&gt;&nbsp; #endif<br>
&gt; diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-lib.c<br>
&gt; index 358ff5d..0b5666a 100644<br>
&gt; --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c<br>
&gt; &#43;&#43;&#43; b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c<br>
&gt; @@ -298,6 &#43;298,11 @@ int bch_set_geometry(struct gpmi_nand_data *t=
his)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | BF_BC=
H_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r-&gt;b=
ch_regs &#43; HW_BCH_FLASH0LAYOUT1);<br>
&gt;&nbsp; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* Set erase threshold to ecc_strength f=
or mx6qp and mx7 */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(t=
his))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; writel(BF_BCH_MODE_ERASE_THRESHOLD(ecc_strength),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r-&gt;bch_regs &#43=
; HW_BCH_MODE);<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Set *all* chip selects to=
 use layout 0. */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; writel(0, r-&gt;bch_regs &#4=
3; HW_BCH_LAYOUTSELECT);<br>
&gt;&nbsp; <br>
&gt; diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand=
/gpmi-nand/gpmi-nand.c<br>
&gt; index aedaff3..03bdb4d 100644<br>
&gt; --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c<br>
&gt; &#43;&#43;&#43; b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c<br>
&gt; @@ -1043,6 &#43;1043,7 @@ static int gpmi_ecc_read_page(struct mtd_inf=
o *mtd, struct nand_chip *chip,<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct gpmi_nand_data *this =
=3D nand_get_controller_data(chip);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct bch_geometry *nfc_geo=
 =3D &amp;this-&gt;bch_geometry;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; void __iomem *bch_regs =3D this-&gt;reso=
urces.bch_regs;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *payload_virt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_addr_t&nbsp;&nbsp;&nbsp;=
 payload_phys;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *auxiliary_virt;<br>
&gt; @@ -1051,6 &#43;1052,8 @@ static int gpmi_ecc_read_page(struct mtd_inf=
o *mtd, struct nand_chip *chip,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *status;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int&nbsp; max_bitfl=
ips =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int bitflips =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int bitflip_flag =3D 0;<br>
<br>
Hm, I would choose another name, but I'm not even sure this is really<br>
needed (see below).<br>
<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_dbg(this-&gt;dev, &quot;=
page number is : %d\n&quot;, page);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D read_page_prepare(th=
is, buf, nfc_geo-&gt;payload_size,<br>
&gt; @@ -1088,8 &#43;1091,20 @@ static int gpmi_ecc_read_page(struct mtd_in=
fo *mtd, struct nand_chip *chip,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; payload_virt, payload_phys);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; nfc_geo=
-&gt;ecc_chunk_count; i&#43;&#43;, status&#43;&#43;) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if ((*status =3D=3D STATUS_GOOD) || (*status =3D=3D STATUS_ERASED))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (*status =3D=3D STATUS_GOOD)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (*status =3D=3D STATUS_ERASED) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (GPMI_IS_MX6QP(t=
his) || GPMI_IS_MX7(this)) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; bitflips =3D readl(bch_regs &#43; HW_BCH_DEBUG=
1);<br>
<br>
You could use ret here or define a flips variable locally to this code<br>
(see what's done for the software correction).<br>
<br>
BTW, why not memset-ing the data chunk here (as done for the SW<br>
correction part). This way you wouldn't need the extra bitflips_flag<br>
variable.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bitflips) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; bitflip_flag =3D 1;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; max_bitflips =3D max_t(unsigned int,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_bitflips,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bitflips);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (*status =3D=3D STATUS_UNCORRECTABLE) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ecc=
bits =3D nfc_geo-&gt;ecc_strength * nfc_geo-&gt;gf_len;<br>
&gt; @@ -1098,6 &#43;1113,10 @@ static int gpmi_ecc_read_page(struct mtd_in=
fo *mtd, struct nand_chip *chip,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ecc=
bytes;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fli=
ps;<br>
&gt;&nbsp; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* shortcut for i.M=
X7 and i.MX6QP */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (GPMI_IS_MX6QP(t=
his) || GPMI_IS_MX7(this))<br>
<br>
You should increment mtd-&gt;ecc_stats.failed in this case.</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Do you mean increase the&nbsp;<span style=3D"font-=
family: Calibri, Arial, Helvetica, sans-serif, &quot;Apple Color Emoji&quot=
;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;,=
 &quot;Android Emoji&quot;, EmojiSymbols; font-size: 13.3333px;">mtd-&gt;ec=
c_stats.corrected
 when flips happened?</span><br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Read=
 ECC bytes into our internal raw_buffer */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset =
=3D nfc_geo-&gt;metadata_size * 8;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset =
&#43;=3D ((8 * nfc_geo-&gt;ecc_chunk_size) &#43; eccbits) * (i &#43; 1);<br=
>
&gt; @@ -1182,6 &#43;1201,12 @@ static int gpmi_ecc_read_page(struct mtd_in=
fo *mtd, struct nand_chip *chip,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; chip-&gt;oob_poi[0] =3D ((uint8_t *) auxiliary_virt)[0]=
;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* if bitflip occurred in erased page, c=
hange data to all 0xff */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (bitflip_flag) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; memset(buf, ~0, nfc_geo-&gt;payload_size);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; memset(chip-&gt;oob_poi, ~0, mtd-&gt;oobsize);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return max_bitflips;<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
<br>
<br>
<br>
-- <br>
Boris Brezillon, Free Electrons<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"http://free-electrons.com" id=3D"LPlnk109747">http://free-electr=
ons.com</a>
<div id=3D"LPBorder_GT_14664411563610.06467454754431223" style=3D"margin-bo=
ttom: 20px; overflow: auto; width: 100%; text-indent: 0px;">
<table id=3D"LPContainer_14664411563580.268596464477979" cellspacing=3D"0" =
style=3D"width: 90%; position: relative; overflow: auto; padding-top: 20px;=
 padding-bottom: 20px; margin-top: 20px; border-top-width: 1px; border-top-=
style: dotted; border-top-color: rgb(200, 200, 200); border-bottom-width: 1=
px; border-bottom-style: dotted; border-bottom-color: rgb(200, 200, 200); b=
ackground-color: rgb(255, 255, 255);">
<tbody>
<tr valign=3D"top" style=3D"border-spacing: 0px;">
<td id=3D"TextCell_14664411563600.110770470441236" colspan=3D"2" style=3D"v=
ertical-align: top; position: relative; padding: 0px; display: table-cell;"=
>
<div id=3D"LPRemovePreviewContainer_14664411563600.7464945125571314"></div>
<div id=3D"LPTitle_14664411563600.4391355141115785" style=3D"top: 0px; colo=
r: rgb(0, 120, 215); font-weight: normal; font-size: 21px; font-family: wf_=
segoe-ui_light, &quot;Segoe UI Light&quot;, &quot;Segoe WP Light&quot;, &qu=
ot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif; line-he=
ight: 21px;">
<a id=3D"LPUrlAnchor_14664411563600.6924695960411547" href=3D"http://free-e=
lectrons.com/" target=3D"_blank" style=3D"text-decoration: none;">Embedded =
Linux Experts - Free Electrons</a></div>
<div id=3D"LPMetadata_14664411563600.3660209307302138" style=3D"margin: 10p=
x 0px 16px; color: rgb(102, 102, 102); font-weight: normal; font-family: wf=
_segoe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial=
, sans-serif; font-size: 14px; line-height: 14px;">
free-electrons.com</div>
<div id=3D"LPDescription_14664411563610.02917199157467465" style=3D"display=
: block; color: rgb(102, 102, 102); font-weight: normal; font-family: wf_se=
goe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, s=
ans-serif; font-size: 14px; line-height: 20px; max-height: 100px; overflow:=
 hidden;">
Free Electrons is an engineering company specialized in embedded Linux and =
more generally in Free and Open Source software for embedded systems.</div>
</td>
</tr>
</tbody>
</table>
</div>
<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_AM4PR0401MB18410DF669E46477346DC47F972A0AM4PR0401MB1841_--
