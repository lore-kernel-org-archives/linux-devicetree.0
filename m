From: Wendy Liang <wendy.liang-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Subject: How to get partition table from a device tree for a SPI FLASH driver?
Date: Mon, 8 Feb 2010 16:51:07 +1000
Message-ID: <63596c681002072251s7ca0bae0q9f60d32e4c591969@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0260156136707414318=="
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
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Michal Simek <michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============0260156136707414318==
Content-Type: multipart/alternative; boundary=0003255558f6d39e5a047f113916

--0003255558f6d39e5a047f113916
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I am trying to get Flash partition table information from the device tree in
a SPI FLASH driver in 2.6.31 kernel. I wonder whether this has been done
already.

If yes, could you please tell where I can refer to?

If no, can I do the following changes for this purpose?:

   - Add a sub-node of the SPI FLASH into the SPI controller in the DTS file
   - Add the FLASH partitions as sub-nodes into the SPI FLASH sub-node.

E.g.:
spi-controller@83400000 {
......
spi-flash@xxxxxxxx {
compatible = ",m25p80";
reg = <0x0>;
spi-max-frequency = <80000000>;
parition@0x00000000 {
label = "boot";
reg = <0x00000000 0x00040000>;
}
... ...
};
}

   - In the probe function of a SPI FLASH driver, e.g., m25p_probe() in
   m25p80.c, call of_mtd_parse_partitions().

e.g.:
if (mtd_has_partitions()) {
struct mtd_partition    *parts = NULL;
int                     nr_parts = 0;
nr_parts = of_mtd_parse_partitions(&spi->dev, spi->dev.archdata.of_node,
&parts)
... ...
}

Thanks,
Wendy

--0003255558f6d39e5a047f113916
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,<br><br>I am trying to get Flash partition table information from the=
 device tree in a SPI FLASH driver in 2.6.31 kernel. I wonder whether this =
has been done already.<br><br>If yes, could you please tell where I can ref=
er to?<br>

<br>If no, can I do the following changes for this purpose?:<br>
<ul><li>Add a sub-node of the SPI FLASH into the SPI controller in the DTS =
file</li><li>Add the FLASH partitions as sub-nodes into the SPI FLASH sub-n=
ode.</li></ul>E.g.:<br>spi-controller@83400000 {<br>......<br><div style=3D=
"margin-left: 40px;">


spi-flash@xxxxxxxx {<br><div style=3D"margin-left: 40px;">compatible =3D &q=
uot;,m25p80&quot;;<br>reg =3D &lt;0x0&gt;;<br>spi-max-frequency =3D &lt;800=
00000&gt;;<br>parition@0x00000000 {<br><div style=3D"margin-left: 40px;">la=
bel =3D &quot;boot&quot;;<br>


reg =3D &lt;0x00000000 0x00040000&gt;;<br></div>}<br>... ...<br></div>};<br=
></div>}<br><ul><li>In the probe function of a SPI FLASH driver, e.g., m25p=
_probe() in m25p80.c, call of_mtd_parse_partitions().</li></ul>e.g.:<br>

if (mtd_has_partitions()) {<br>
<div style=3D"margin-left: 40px;">struct mtd_partition=A0=A0=A0 *parts =3D =
NULL;<br>int=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nr=
_parts =3D 0;<br></div><div style=3D"margin-left: 40px;">nr_parts =3D of_mt=
d_parse_partitions(&amp;spi-&gt;dev, spi-&gt;dev.archdata.of_node, &amp;par=
ts)<br>


... ...<br></div>}<br><br>Thanks,<br>Wendy<br>

--0003255558f6d39e5a047f113916--

--===============0260156136707414318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0260156136707414318==--
