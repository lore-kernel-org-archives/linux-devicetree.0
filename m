From: "Schwarz,Andre" <andre.schwarz-P0pTl12WyEgpBod+wgzj8A@public.gmane.org>
Subject: How to register GPIOs over PCI
Date: Wed, 15 Sep 2010 21:37:31 +0200 (CEST)
Message-ID: <1054265387.16.1284579451319.JavaMail.open-xchange@proteus>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0434478395168710802=="
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============0434478395168710802==
Content-Type: multipart/alternative;
	boundary="----=_Part_15_1749540210.1284579451274"

------=_Part_15_1749540210.1284579451274
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Grant, Anton,

reading through the of/gpio docs and thinking about some improvements for o=
ur
proprietary "ancient" code gives a lot of opportunities for major improveme=
nts
... since you are authors and your quick help in the past is really appreci=
ated
I dare to address you directly ;-)

On some (mostly PowerPC) based boards we have NAND-Flash connected to a PCI
FPGA.
There's no NAND controller inside ... just bitbang. Currently there's an
implementation using "struct nand_chip" + hooks + nand_scan() inside the pc=
i
driver. Since the driver is designed to do other things and is not availabl=
e
during boot (=3Dno RFS on Nand) I definitely want to get rid of this.

To me it looks like we could use the "gpio-nand" driver. All we need is
registering the proper (mem mapped) GPIOs with the required names via
device-tree. As far as I understand the FPGA can be considered an
of_mm_gpio_chip ?

Honestly I don't know how to define it using dts syntax.

All we have regarding PCI is general bus ranges, devsel and irq lines ... a=
nd of
course the offset inside the FPGA.
I've not seen a direct representation of a PCI device - only SoC components=
.

How am I supposed to handle the unknown (=3Ddynamically assigned) base addr=
ess ?
Since the system also has PCI slots I can't make sure to always get the sam=
e
adress ...


Can you give some hints/advice how to define the FPGA as a GPIO-Controller =
?


Regards,
Andr=C3=A9
=0AMATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler=0ARegistergerich=
t: Amtsgericht Stuttgart, HRB 271090=0AGeschaeftsfuehrer: Gerhard Thullner, =
Werner Armingeon, Uwe Furtner=0A

------=_Part_15_1749540210.1284579451274
MIME-Version: 1.0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
    <title></title>
  </head>

  <body>
    Grant, Anton,<br />
    <br />
    reading through the of/gpio docs and thinking about some improvements for our proprietary &quot;ancient&quot; code gives a lot of opportunities for major improvements ... since you are authors and your quick help in the past is really appreciated I dare to address you directly ;-)<br />
    <br />
    On some (mostly PowerPC) based boards we have NAND-Flash connected to a PCI FPGA.<br />
    There&#39;s no NAND controller inside ... just bitbang. Currently there&#39;s an implementation using &quot;struct nand_chip&quot; + hooks + nand_scan() inside the pci driver. Since the driver is designed to do other things and is not available during boot (=no RFS on Nand) I definitely want to get rid of this.<br />
    <br />
    To me it looks like we could use the &quot;gpio-nand&quot; driver. All we need is registering the proper (mem mapped) GPIOs with the required names via device-tree. As far as I understand the FPGA can be considered an of_mm_gpio_chip ?<br />
    <br />
    Honestly I don&#39;t know how to define it using dts syntax.<br />
    <br />
    All we have regarding PCI is general bus ranges, devsel and irq lines ... and of course the offset inside the FPGA.<br />
    I&#39;ve not seen a direct representation of a PCI device - only SoC components.<br />
    <br />
    How am I supposed to handle the unknown (=dynamically assigned) base address ?<br />
    Since the system also has PCI slots I can&#39;t make sure to always get the same adress ...<br />
    <br />
    <br />
    Can you give some hints/advice how to define the FPGA as a GPIO-Controller ?<br />
    <br />
    <br />
    Regards,<br />
    Andr&#233;<br />
    <br />
  
<br>

MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
Registergericht: Amtsgericht Stuttgart, HRB 271090
Geschaeftsfuehrer: Gerhard Thullner, Werner Armingeon, Uwe Furtner
<br>
</body>
</html>

------=_Part_15_1749540210.1284579451274--

--===============0434478395168710802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0434478395168710802==--
