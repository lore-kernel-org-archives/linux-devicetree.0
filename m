From: Pankaj Pandey <pankaj.embedded-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Device tree backporting for ARM on 2.6.32 kernel
Date: Thu, 2 Aug 2012 22:14:25 +0530
Message-ID: <CAOdCjQstAMLcXOc2SfEPNX7v_-p92jNdQ5XUZXtYr-Qm=-NyFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7194786541282074120=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============7194786541282074120==
Content-Type: multipart/alternative; boundary=e89a8ff1c5a8d21dec04c64b1ff8

--e89a8ff1c5a8d21dec04c64b1ff8
Content-Type: text/plain; charset=ISO-8859-1

Dear All,

We are working on device tree backporting from  3.0 kernel   to
2.6.32-kernel.
We have backported the device tree support for arm on 2.6.32. It is able to
read machine name,
memory size and command line parameter from devicetree file for arm based
target board.
But it failed to read drivers related data from device tree.

During  debugging I found that device tree is located at 0xC1000000 upto
4KB on
main memory and that data getting memset to 0 by alloc_bootmem_core(
mm/bootmem.c)
in its first call.  And its later call of  alloc_bootmem_core  write  some
junk data at 0xC1000000
device tree memory location. Due to this corrupted Devicetree data kernel
failed to
read drivers details.

I highly appreciate if you can suggest me some pointer that how we can
avoid memset to 0 of
Device tree memory(0x1000000 upto 4KB). Please let me know if you need more
detail update.

Thanks in Advance !!

Thanks and Regards,
Pankaj Pandey

--e89a8ff1c5a8d21dec04c64b1ff8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">Dear All,=A0</div><div style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color=
:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">We are working on device tr=
ee backporting from =A03.0 kernel =A0 to 2.6.32-kernel.=A0</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
<div>We have backported the device tree support for arm on 2.6.32. It is ab=
le to read machine name,=A0</div><div>memory size and command line paramete=
r from devicetree file for arm based target board.=A0</div><div>But it fail=
ed to read drivers related data from device tree.</div>
<div><br></div><div>During =A0debugging I found that=A0device tree is locat=
ed at 0xC1000000 upto 4KB on</div><div>main memory and that data getting me=
mset=A0<font color=3D"#222222">to 0 by=A0</font><font color=3D"#000099">all=
oc_bootmem_core</font>(<font color=3D"#003300">mm/bootmem.c</font>)=A0</div=
>
<div>in its first call. =A0<font color=3D"#222222">And its later call of=A0=
=A0</font><font color=3D"#000099">alloc_bootmem_core =A0</font><font>write=
=A0</font><font color=3D"#222222">=A0some junk data at 0xC1000000=A0</font>=
</div><div><font color=3D"#222222">device tree memory location. Due to this=
 corrupted D</font>evicetree data kernel failed to=A0</div>
<div>read drivers details. =A0</div><div><br></div><div>I highly=A0apprecia=
te if you can suggest me=A0<span style=3D"text-align:left">some pointer tha=
t how we can avoid memset to 0 of</span></div><div><span style=3D"text-alig=
n:left">Device tree memory(0x1000000 upto 4KB). Please let me know if you n=
eed more detail update.</span></div>
</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:13px;background-color:rgb(255,255,255)"><br></div><div style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:r=
gb(255,255,255)">
Thanks in Advance !!</div><div style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:13px;background-color:rgb(255,255,255)"><br></div><=
div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13p=
x;background-color:rgb(255,255,255)">
Thanks and Regards,</div><div style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:13px;background-color:rgb(255,255,255)">Pankaj Pande=
y</div>

--e89a8ff1c5a8d21dec04c64b1ff8--

--===============7194786541282074120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7194786541282074120==--
