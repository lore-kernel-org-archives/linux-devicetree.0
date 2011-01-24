From: "Stanislav O. Bezzubtsev" <stas.bezzubtsev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: mtd concat OF question
Date: Mon, 24 Jan 2011 15:37:49 +0300
Message-ID: <AANLkTikuK6_=RoFkGxX8=0SciSnsivW9-NV3UDitojF_@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0734489601378380598=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============0734489601378380598==
Content-Type: multipart/alternative; boundary=000e0cd17ac623855d049a96de4c

--000e0cd17ac623855d049a96de4c
Content-Type: text/plain; charset=ISO-8859-1

Hello all.

1) Is there an ability to specify in .dts an mtd_concat partition that
consists of several parts of a same flash drive?
For example, let there be 2MB flash drive and for some hardware limitations
u-boot can be stored only at 1MB offset. So, can I specify an mtd device to
own [0 -- 1MB] and [1.5MB -- 2MB]? As far as I can see (from
the drivers/mtd/ofpart.c) there is no support for such a feature.

2) If the answer on the previous question is "no". What shall be the most
natural way to enhance the dts format? As for me it seems to be reasonable
to allow partition regs description to consists more then of 2 values (N
pairs). Example is below:

nor-flash@0,0 {
    compatible = "amd,s29gl01gp", "cfi-flash";
    bank-width = <2>;
    reg = <0x0 0x200000>;
    #address-cells = <1>;
    #size-cells = <1>;

    partition@100000 {
        label = "uboot";
        reg = <0x100000 0x80000>;
        read-only;
    };

    partition@0 {
        label = "user";
        reg = <0x000000 0x100000
                  0x180000 0x80000>;
    };
};
-- 
Regards,
    Stas.

--000e0cd17ac623855d049a96de4c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello all.<div><br></div><div>1) Is there an ability to specify in .dts an =
mtd_concat partition that consists of several parts of a same flash drive?<=
/div><div>For example, let there be 2MB flash drive and for some hardware l=
imitations u-boot can be stored only at 1MB offset. So, can I specify an mt=
d device to own [0 -- 1MB] and [1.5MB -- 2MB]? As far as I can see (from th=
e=A0drivers/mtd/ofpart.c) there is no support for such a feature.</div>
<div><br></div><div>2) If the answer on the previous question is &quot;no&q=
uot;. What shall be the most natural way to enhance the dts format? As for =
me it seems to be reasonable to allow partition regs description to consist=
s more then of 2 values (N pairs). Example is below:</div>
<div><br></div><div>nor-flash@0,0 {</div><div>=A0=A0 =A0compatible =3D &quo=
t;amd,s29gl01gp&quot;, &quot;cfi-flash&quot;;</div><div>=A0=A0 =A0bank-widt=
h =3D &lt;2&gt;;</div><div>=A0=A0 =A0reg =3D &lt;0x0 0x200000&gt;;</div><di=
v>=A0=A0 =A0#address-cells =3D &lt;1&gt;;</div>
<div>=A0=A0 =A0#size-cells =3D &lt;1&gt;;</div><div><br></div><div>=A0=A0 =
=A0partition@100000 {</div><div>=A0=A0 =A0 =A0 =A0label =3D &quot;uboot&quo=
t;;</div><div>=A0=A0 =A0 =A0 =A0reg =3D &lt;0x100000 0x80000&gt;;</div><div=
>=A0=A0 =A0 =A0 =A0read-only;</div><div>=A0=A0 =A0};</div>
<div><br></div><div>=A0=A0 =A0partition@0 {</div><div>=A0=A0 =A0 =A0 =A0lab=
el =3D &quot;user&quot;;</div><div>=A0=A0 =A0 =A0 =A0reg =3D &lt;0x000000 0=
x100000</div><div>=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x180000 0x80000&gt=
;;</div><div>=A0=A0 =A0};</div><div>};<br>-- <br>Regards,<div>
=A0=A0 =A0Stas.</div><br>
</div>

--000e0cd17ac623855d049a96de4c--

--===============0734489601378380598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0734489601378380598==--
