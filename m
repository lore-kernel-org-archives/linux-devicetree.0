From: Christian Rund <Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Subject: Re: devicetree-discuss Digest, Vol 7, Issue 7
Date: Wed, 14 Jan 2009 09:48:04 +0100
Message-ID: <OF6F480DF5.6AB595D3-ONC125753E.002F20DB-C125753E.0030587B@de.ibm.com>
References: <mailman.11.1231894807.11123.devicetree-discuss@ozlabs.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1417898718=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <mailman.11.1231894807.11123.devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multipart message in MIME format.
--===============1417898718==
Content-Type: multipart/alternative; boundary="=_alternative 00305879C125753E_="

This is a multipart message in MIME format.
--=_alternative 00305879C125753E_=
Content-Type: text/plain; charset="US-ASCII"

devicetree-discuss-bounces+christian.rund=de.ibm.com-mnsaURCQ41sdnm+yROfE0A@public.gmane.org wrote on 
14.01.2009 02:00:07:

> ----------------------------------------------------------------------
> 
> Message: 1
> Date: Tue, 13 Jan 2009 16:24:11 -0700
> From: "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Subject: Re: Device Tree documentation discussion for Cell/B.E.
>    binding DRAFT   - see Digest, Vol 6, Issues 1, 7, 9, 10, 11
> To: "Christian Rund" <Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
> Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
> Message-ID:
>    <fa686aa40901131524r1df29b32ybfb355ed039b2f86-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
> Content-Type: text/plain; charset=ISO-8859-1
> 
> On Tue, Jan 13, 2009 at 3:57 PM, Christian Rund
> <Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > Working in all feedback I received so far below now find the new 
version of
> > the
> > Cell/B.E. binding DRAFT including disclaimers etc. You'll find the 
core
> > contents right below. Thanks.
> 
> Thanks Christian; I'll take a read through.  BTW, would it be possible
> to get a sample device tree dump that corresponds to this binding?  It
> would help with the review.

Yes, sure. Here are the Cell/B.E. processor parts of the device tree
from an IBM BladeCenter QS22 product.
--- First Cell/B.E. processor ---
be@20000000000:
name             "be"
linux,phandle    0eae17a0 (246290336)
device_type      "be"
model            "IBM,CBEA"
ibm,dt-version   "1.1"
#address-cells   00000001
#size-cells      00000001
reg              00000200 00000000 00000000 00800000
ranges           00000000 00000200 00000000 00800000
ibm,associativity 00000004 00000000 00000000 00000000 00000000
interrupt-parent 0eae1fb0 (246292400)
cpus             0eb05910 (246438160)

be@20000000000/bic1@513000:
name             "bic1"
linux,phandle    0eae3ae0 (246299360)
device_type      "bic1"
reg              00513000 00001000

be@20000000000/bic0@512000:
name             "bic0"
linux,phandle    0eae39a0 (246299040)
device_type      "bic0"
reg              00512000 00001000

be@20000000000/ioc@510000:
name             "ioc"
linux,phandle    0eae3810 (246298640)
device_type      "ioc"
reg              00510000 00001000 00511000 00001000
interrupts       003d010e (3997966)

be@20000000000/mic-tm@50a000:
name             "mic-tm"
linux,phandle    0eae36d0 (246298320)
device_type      "mic-tm"
reg              0050a000 00001000

be@20000000000/pervasive@509000:
name             "pervasive"
linux,phandle    0eae33a0 (246297504)
device_type      "pervasive"
reg              00509000 00001000
ppe-throttle-temp 00000065 (101)
ppe-end-throttle-temp 0000005b (91)
ppe-full-throttle-temp 0000007f (127)
spe-throttle-temp 00000065 (101)
spe-end-throttle-temp 0000005b (91)
spe-full-throttle-temp 0000006f (111)

be@20000000000/ppe-mmio@500000:
name             "ppe-mmio"
linux,phandle    0eae3250 (246297168)
device_type      "ppe-mmio"
reg              00500000 00001000

be@20000000000/spe@380000:
name             "spe"
linux,phandle    0eae3060 (246296672)
device_type      "spe"
reg              00380000 00040000 003c0000 00020000
                 003e0000 00020000 0040e000 00002000
physical-id      00000007
interrupts       0000000a 0000010a 0000020a
vicinity         0eae2c80 0eae39a0

be@20000000000/spe@300000:
name             "spe"
linux,phandle    0eae2e70 (246296176)
device_type      "spe"
reg              00300000 00040000 00340000 00020000
                 00360000 00020000 0040c000 00002000
physical-id      00000006
interrupts       00000001 00000101 00000201
vicinity         0eae2a90 0eae39a0

be@20000000000/spe@280000:
name             "spe"
linux,phandle    0eae2c80 (246295680)
device_type      "spe"
reg              00280000 00040000 002c0000 00020000
                 002e0000 00020000 0040a000 00002000
physical-id      00000005
interrupts       00000009 00000109 00000209
vicinity         0eae28a0 0eae3060

be@20000000000/spe@200000:
name             "spe"
linux,phandle    0eae2a90 (246295184)
device_type      "spe"
reg              00200000 00040000 00240000 00020000
                 00260000 00020000 00408000 00002000
physical-id      00000004
interrupts       00000002 00000102 00000202
vicinity         0eae26b0 0eae2e70

be@20000000000/spe@180000:
name             "spe"
linux,phandle    0eae28a0 (246294688)
device_type      "spe"
reg              00180000 00040000 001c0000 00020000
                 001e0000 00020000 00406000 00002000
physical-id      00000003
interrupts       00000008 00000108 00000208
vicinity         0eae24c0 0eae2c80

be@20000000000/spe@100000:
name             "spe"
linux,phandle    0eae26b0 (246294192)
device_type      "spe"
reg              00100000 00040000 00140000 00020000
                 00160000 00020000 00404000 00002000
physical-id      00000002
interrupts       00000003 00000103 00000203
vicinity         0eae22d0 0eae2a90

be@20000000000/spe@80000:
name             "spe"
linux,phandle    0eae24c0 (246293696)
device_type      "spe"
reg              00080000 00040000 000c0000 00020000
                 000e0000 00020000 00402000 00002000
physical-id      00000001
interrupts       00000007 00000107 00000207
vicinity         0eae28a0 0eae36d0

be@20000000000/spe@0:
name             "spe"
linux,phandle    0eae22d0 (246293200)
device_type      "spe"
reg              00000000 00040000 00040000 00020000
                 00060000 00020000 00400000 00002000
physical-id      00000000
interrupts       00000004 00000104 00000204
vicinity         0eae26b0 0eae36d0

be@20000000000/interrupt-controller@508400:
name             "interrupt-controller"
linux,phandle    0eae1fb0 (246292400)
interrupt-controller
#interrupt-cells 00000001
device_type      "CBEA-Internal-Interrupt-Controller"
compatible       "IBM,CBEA-Internal-Interrupt-Controller"
ibm,interrupt-server-ranges 00000000 00000001
reg              00508400 00000020 00508420 00000020 00508000 00001000
--- Second Cell/B.E. processor ---
be@20100000000:
name             "be"
linux,phandle    0eaf3e48 (246365768)
device_type      "be"
model            "IBM,CBEA"
ibm,dt-version   "1.1"
#address-cells   00000001
#size-cells      00000001
reg              00000201 00000000 00000000 00800000
ranges           00000000 00000201 00000000 00800000
ibm,associativity 00000004 00000000 00000000 00000001 00000001
interrupt-parent 0eaf4658 (246367832)
cpus             0eb065c0 (246441408)

be@20100000000/bic1@513000:
name             "bic1"
linux,phandle    0eaf6188 (246374792)
device_type      "bic1"
reg              00513000 00001000

be@20100000000/bic0@512000:
name             "bic0"
linux,phandle    0eaf6048 (246374472)
device_type      "bic0"
reg              00512000 00001000

be@20100000000/ioc@510000:
name             "ioc"
linux,phandle    0eaf5eb8 (246374072)
device_type      "ioc"
reg              00510000 00001000 00511000 00001000
interrupts       013d010e (20775182)

be@20100000000/mic-tm@50a000:
name             "mic-tm"
linux,phandle    0eaf5d78 (246373752)
device_type      "mic-tm"
reg              0050a000 00001000

be@20100000000/pervasive@509000:
name             "pervasive"
linux,phandle    0eaf5a48 (246372936)
device_type      "pervasive"
reg              00509000 00001000
ppe-throttle-temp 00000065 (101)
ppe-end-throttle-temp 0000005b (91)
ppe-full-throttle-temp 0000007f (127)
spe-throttle-temp 00000065 (101)
spe-end-throttle-temp 0000005b (91)
spe-full-throttle-temp 0000006f (111)

be@20100000000/ppe-mmio@500000:
name             "ppe-mmio"
linux,phandle    0eaf58f8 (246372600)
device_type      "ppe-mmio"
reg              00500000 00001000

be@20100000000/spe@380000:
name             "spe"
linux,phandle    0eaf5708 (246372104)
device_type      "spe"
reg              00380000 00040000 003c0000 00020000
                 003e0000 00020000 0040e000 00002000
physical-id      00000007
interrupts       0100000a 0100010a 0100020a
vicinity         0eaf5328 0eaf6048

be@20100000000/spe@300000:
name             "spe"
linux,phandle    0eaf5518 (246371608)
device_type      "spe"
reg              00300000 00040000 00340000 00020000
                 00360000 00020000 0040c000 00002000
physical-id      00000006
interrupts       01000001 01000101 01000201
vicinity         0eaf5138 0eaf6048

be@20100000000/spe@280000:
name             "spe"
linux,phandle    0eaf5328 (246371112)
device_type      "spe"
reg              00280000 00040000 002c0000 00020000
                 002e0000 00020000 0040a000 00002000
physical-id      00000005
interrupts       01000009 01000109 01000209
vicinity         0eaf4f48 0eaf5708

be@20100000000/spe@200000:
name             "spe"
linux,phandle    0eaf5138 (246370616)
device_type      "spe"
reg              00200000 00040000 00240000 00020000
                 00260000 00020000 00408000 00002000
physical-id      00000004
interrupts       01000002 01000102 01000202
vicinity         0eaf4d58 0eaf5518

be@20100000000/spe@180000:
name             "spe"
linux,phandle    0eaf4f48 (246370120)
device_type      "spe"
reg              00180000 00040000 001c0000 00020000
                 001e0000 00020000 00406000 00002000
physical-id      00000003
interrupts       01000008 01000108 01000208
vicinity         0eaf4b68 0eaf5328

be@20100000000/spe@100000:
name             "spe"
linux,phandle    0eaf4d58 (246369624)
device_type      "spe"
reg              00100000 00040000 00140000 00020000
                 00160000 00020000 00404000 00002000
physical-id      00000002
interrupts       01000003 01000103 01000203
vicinity         0eaf4978 0eaf5138

be@20100000000/spe@80000:
name             "spe"
linux,phandle    0eaf4b68 (246369128)
device_type      "spe"
reg              00080000 00040000 000c0000 00020000
                 000e0000 00020000 00402000 00002000
physical-id      00000001
interrupts       01000007 01000107 01000207
vicinity         0eaf4f48 0eaf5d78

be@20100000000/spe@0:
name             "spe"
linux,phandle    0eaf4978 (246368632)
device_type      "spe"
reg              00000000 00040000 00040000 00020000
                 00060000 00020000 00400000 00002000
physical-id      00000000
interrupts       01000004 01000104 01000204
vicinity         0eaf4d58 0eaf5d78

be@20100000000/interrupt-controller@508400:
name             "interrupt-controller"
linux,phandle    0eaf4658 (246367832)
interrupt-controller
#interrupt-cells 00000001
device_type      "CBEA-Internal-Interrupt-Controller"
compatible       "IBM,CBEA-Internal-Interrupt-Controller"
ibm,interrupt-server-ranges 00000002 00000003
reg              00508400 00000020 00508420 00000020 00508000 00001000

------------------------------------------------------------------------------------------------

For reason of DT completeness for the Cell/B.E. processor I'm
adding the cpus/ subtree which is based on the PowerPC binding 
documentation
which is *not part of the current discussions*.
(see http://playground.sun.com/1275/bindings/ppc/release/ppc-2_0.html)

cpus:
name             "cpus"
linux,phandle    0eb056f8 (246437624)
#address-cells   00000001
#size-cells      00000000

cpus/PowerPC,BE@1:
name             "PowerPC,BE"
linux,phandle    0eb065c0 (246441408)
device_type      "cpu"
reg              00000002
status           "okay"
ibm,bpa 
64-bit 
cpu-version      00703000 (7352320)
d-cache-size     00008000 (32768)
d-cache-sets     00000002
d-cache-block-size 00000080 (128)
d-cache-line-size 00000080 (128)
i-cache-size     00008000 (32768)
i-cache-sets     00000002
i-cache-block-size 00000080 (128)
i-cache-line-size 00000080 (128)
clock-frequency  bebc2000
timebase-frequency 0196dd73 (26664307)
ibm,associativity 00000004 00000000 00000000 00000001 00000001
ibm,ppc-interrupt-server#s 00000002 00000003
node-id          00000001
ioid             0000000e (14)
iic              00000201 00508000 00001000
ibm,segment-page-sizes 0000000c 00000000 00000001 0000000c 00000000
                 00000010 00000110 00000001 00000010 00000001
                 00000018 00000100 00000001 00000018 00000000
tlb-size         00000400 (1024)
tlb-sets         00000004
d-tlb-size       00000400 (1024)
d-tlb-sets       00000004
i-tlb-size       00000400 (1024)
i-tlb-sets       00000004

cpus/PowerPC,BE@1/l2-cache:
name             "l2-cache"
linux,phandle    0eb06f00 (246443776)
device_type      "cache"
d-cache-size     00080000 (524288)
d-cache-sets     00000008
d-cache-line-size 00000080 (128)
i-cache-size     00080000 (524288)
i-cache-sets     00000008
i-cache-line-size 00000080 (128)
cache-unified 

cpus/PowerPC,BE@0:
name             "PowerPC,BE"
linux,phandle    0eb05910 (246438160)
device_type      "cpu"
reg              00000000
status           "okay"
ibm,bpa 
64-bit 
cpu-version      00703000 (7352320)
d-cache-size     00008000 (32768)
d-cache-sets     00000002
d-cache-block-size 00000080 (128)
d-cache-line-size 00000080 (128)
i-cache-size     00008000 (32768)
i-cache-sets     00000002
i-cache-block-size 00000080 (128)
i-cache-line-size 00000080 (128)
clock-frequency  bebc2000
timebase-frequency 0196dd73 (26664307)
ibm,associativity 00000004 00000000 00000000 00000000 00000000
ibm,ppc-interrupt-server#s 00000000 00000001
node-id          00000000
ioid             0000000e (14)
iic              00000200 00508000 00001000
ibm,segment-page-sizes 0000000c 00000000 00000001 0000000c 00000000
                 00000010 00000110 00000001 00000010 00000001
                 00000018 00000100 00000001 00000018 00000000
tlb-size         00000400 (1024)
tlb-sets         00000004
d-tlb-size       00000400 (1024)
d-tlb-sets       00000004
i-tlb-size       00000400 (1024)
i-tlb-sets       00000004

cpus/PowerPC,BE@0/l2-cache:
name             "l2-cache"
linux,phandle    0eb06250 (246440528)
device_type      "cache"
d-cache-size     00080000 (524288)
d-cache-sets     00000008
d-cache-line-size 00000080 (128)
i-cache-size     00080000 (524288)
i-cache-sets     00000008
i-cache-line-size 00000080 (128)
cache-unified 



> 
> Thanks,
> g.
> 
> -- 
> Grant Likely, B.Sc., P.Eng.
> Secret Lab Technologies Ltd.
> 
> 
> ------------------------------
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
> https://ozlabs.org/mailman/listinfo/devicetree-discuss
> 
> 
> End of devicetree-discuss Digest, Vol 7, Issue 7
> ************************************************

--=_alternative 00305879C125753E_=
Content-Type: text/html; charset="US-ASCII"


<br><tt><font size=2>devicetree-discuss-bounces+christian.rund=de.ibm.com-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
wrote on 14.01.2009 02:00:07:<br>
<br>
&gt; ----------------------------------------------------------------------<br>
&gt; <br>
&gt; Message: 1<br>
&gt; Date: Tue, 13 Jan 2009 16:24:11 -0700<br>
&gt; From: &quot;Grant Likely&quot; &lt;grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org&gt;<br>
&gt; Subject: Re: Device Tree documentation discussion for Cell/B.E.<br>
&gt; &nbsp; &nbsp;binding DRAFT &nbsp; - see Digest, Vol 6, Issues 1, 7,
9, 10, 11<br>
&gt; To: &quot;Christian Rund&quot; &lt;Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org&gt;<br>
&gt; Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org<br>
&gt; Message-ID:<br>
&gt; &nbsp; &nbsp;&lt;fa686aa40901131524r1df29b32ybfb355ed039b2f86-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org&gt;<br>
&gt; Content-Type: text/plain; charset=ISO-8859-1<br>
&gt; <br>
&gt; On Tue, Jan 13, 2009 at 3:57 PM, Christian Rund<br>
&gt; &lt;Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Working in all feedback I received so far below now find the
new version of<br>
&gt; &gt; the<br>
&gt; &gt; Cell/B.E. binding DRAFT including disclaimers etc. You'll find
the core<br>
&gt; &gt; contents right below. Thanks.<br>
&gt; <br>
&gt; Thanks Christian; I'll take a read through. &nbsp;BTW, would it be
possible<br>
&gt; to get a sample device tree dump that corresponds to this binding?
&nbsp;It<br>
&gt; would help with the review.</font></tt>
<br>
<br><tt><font size=2>Yes, sure. Here are the Cell/B.E. processor parts
of the device tree</font></tt>
<br><tt><font size=2>from an IBM BladeCenter QS22 product.</font></tt>
<br><tt><font size=2>--- First Cell/B.E. processor ---</font></tt>
<br><tt><font size=2>be@20000000000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;be&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae17a0 (246290336)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;be&quot;</font></tt>
<br><tt><font size=2>model &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;IBM,CBEA&quot;</font></tt>
<br><tt><font size=2>ibm,dt-version &nbsp; &quot;1.1&quot;</font></tt>
<br><tt><font size=2>#address-cells &nbsp; 00000001</font></tt>
<br><tt><font size=2>#size-cells &nbsp; &nbsp; &nbsp;00000001</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00000200
00000000 00000000 00800000</font></tt>
<br><tt><font size=2>ranges &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 00000000
00000200 00000000 00800000</font></tt>
<br><tt><font size=2>ibm,associativity 00000004 00000000 00000000 00000000
00000000</font></tt>
<br><tt><font size=2>interrupt-parent 0eae1fb0 (246292400)</font></tt>
<br><tt><font size=2>cpus &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0eb05910
(246438160)</font></tt>
<br>
<br><tt><font size=2>be@20000000000/bic1@513000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;bic1&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae3ae0 (246299360)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;bic1&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00513000
00001000</font></tt>
<br>
<br><tt><font size=2>be@20000000000/bic0@512000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;bic0&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae39a0 (246299040)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;bic0&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00512000
00001000</font></tt>
<br>
<br><tt><font size=2>be@20000000000/ioc@510000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;ioc&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae3810 (246298640)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;ioc&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00510000
00001000 00511000 00001000</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 003d010e (3997966)</font></tt>
<br>
<br><tt><font size=2>be@20000000000/mic-tm@50a000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;mic-tm&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae36d0 (246298320)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;mic-tm&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0050a000
00001000</font></tt>
<br>
<br><tt><font size=2>be@20000000000/pervasive@509000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;pervasive&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae33a0 (246297504)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;pervasive&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00509000
00001000</font></tt>
<br><tt><font size=2>ppe-throttle-temp 00000065 (101)</font></tt>
<br><tt><font size=2>ppe-end-throttle-temp 0000005b (91)</font></tt>
<br><tt><font size=2>ppe-full-throttle-temp 0000007f (127)</font></tt>
<br><tt><font size=2>spe-throttle-temp 00000065 (101)</font></tt>
<br><tt><font size=2>spe-end-throttle-temp 0000005b (91)</font></tt>
<br><tt><font size=2>spe-full-throttle-temp 0000006f (111)</font></tt>
<br>
<br><tt><font size=2>be@20000000000/ppe-mmio@500000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;ppe-mmio&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae3250 (246297168)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;ppe-mmio&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00500000
00001000</font></tt>
<br>
<br><tt><font size=2>be@20000000000/spe@380000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae3060 (246296672)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00380000
00040000 003c0000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;003e0000 00020000 0040e000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000007</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 0000000a 0000010a
0000020a</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eae2c80 0eae39a0</font></tt>
<br>
<br><tt><font size=2>be@20000000000/spe@300000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae2e70 (246296176)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00300000
00040000 00340000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;00360000 00020000 0040c000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000006</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 00000001 00000101
00000201</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eae2a90 0eae39a0</font></tt>
<br>
<br><tt><font size=2>be@20000000000/spe@280000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae2c80 (246295680)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00280000
00040000 002c0000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;002e0000 00020000 0040a000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000005</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 00000009 00000109
00000209</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eae28a0 0eae3060</font></tt>
<br>
<br><tt><font size=2>be@20000000000/spe@200000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae2a90 (246295184)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00200000
00040000 00240000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;00260000 00020000 00408000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000004</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 00000002 00000102
00000202</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eae26b0 0eae2e70</font></tt>
<br>
<br><tt><font size=2>be@20000000000/spe@180000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae28a0 (246294688)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00180000
00040000 001c0000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;001e0000 00020000 00406000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000003</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 00000008 00000108
00000208</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eae24c0 0eae2c80</font></tt>
<br>
<br><tt><font size=2>be@20000000000/spe@100000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae26b0 (246294192)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00100000
00040000 00140000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;00160000 00020000 00404000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000002</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 00000003 00000103
00000203</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eae22d0 0eae2a90</font></tt>
<br>
<br><tt><font size=2>be@20000000000/spe@80000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae24c0 (246293696)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00080000
00040000 000c0000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;000e0000 00020000 00402000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000001</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 00000007 00000107
00000207</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eae28a0 0eae36d0</font></tt>
<br>
<br><tt><font size=2>be@20000000000/spe@0:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae22d0 (246293200)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00000000
00040000 00040000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;00060000 00020000 00400000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000000</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 00000004 00000104
00000204</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eae26b0 0eae36d0</font></tt>
<br>
<br><tt><font size=2>be@20000000000/interrupt-controller@508400:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;interrupt-controller&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eae1fb0 (246292400)</font></tt>
<br><tt><font size=2>interrupt-controller</font></tt>
<br><tt><font size=2>#interrupt-cells 00000001</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;CBEA-Internal-Interrupt-Controller&quot;</font></tt>
<br><tt><font size=2>compatible &nbsp; &nbsp; &nbsp; &quot;IBM,CBEA-Internal-Interrupt-Controller&quot;</font></tt>
<br><tt><font size=2>ibm,interrupt-server-ranges 00000000 00000001</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00508400
00000020 00508420 00000020 00508000 00001000</font></tt>
<br><tt><font size=2>--- Second Cell/B.E. processor ---</font></tt>
<br><tt><font size=2>be@20100000000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;be&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf3e48 (246365768)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;be&quot;</font></tt>
<br><tt><font size=2>model &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;IBM,CBEA&quot;</font></tt>
<br><tt><font size=2>ibm,dt-version &nbsp; &quot;1.1&quot;</font></tt>
<br><tt><font size=2>#address-cells &nbsp; 00000001</font></tt>
<br><tt><font size=2>#size-cells &nbsp; &nbsp; &nbsp;00000001</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00000201
00000000 00000000 00800000</font></tt>
<br><tt><font size=2>ranges &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 00000000
00000201 00000000 00800000</font></tt>
<br><tt><font size=2>ibm,associativity 00000004 00000000 00000000 00000001
00000001</font></tt>
<br><tt><font size=2>interrupt-parent 0eaf4658 (246367832)</font></tt>
<br><tt><font size=2>cpus &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0eb065c0
(246441408)</font></tt>
<br>
<br><tt><font size=2>be@20100000000/bic1@513000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;bic1&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf6188 (246374792)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;bic1&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00513000
00001000</font></tt>
<br>
<br><tt><font size=2>be@20100000000/bic0@512000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;bic0&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf6048 (246374472)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;bic0&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00512000
00001000</font></tt>
<br>
<br><tt><font size=2>be@20100000000/ioc@510000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;ioc&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf5eb8 (246374072)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;ioc&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00510000
00001000 00511000 00001000</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 013d010e (20775182)</font></tt>
<br>
<br><tt><font size=2>be@20100000000/mic-tm@50a000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;mic-tm&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf5d78 (246373752)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;mic-tm&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0050a000
00001000</font></tt>
<br>
<br><tt><font size=2>be@20100000000/pervasive@509000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;pervasive&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf5a48 (246372936)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;pervasive&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00509000
00001000</font></tt>
<br><tt><font size=2>ppe-throttle-temp 00000065 (101)</font></tt>
<br><tt><font size=2>ppe-end-throttle-temp 0000005b (91)</font></tt>
<br><tt><font size=2>ppe-full-throttle-temp 0000007f (127)</font></tt>
<br><tt><font size=2>spe-throttle-temp 00000065 (101)</font></tt>
<br><tt><font size=2>spe-end-throttle-temp 0000005b (91)</font></tt>
<br><tt><font size=2>spe-full-throttle-temp 0000006f (111)</font></tt>
<br>
<br><tt><font size=2>be@20100000000/ppe-mmio@500000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;ppe-mmio&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf58f8 (246372600)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;ppe-mmio&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00500000
00001000</font></tt>
<br>
<br><tt><font size=2>be@20100000000/spe@380000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf5708 (246372104)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00380000
00040000 003c0000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;003e0000 00020000 0040e000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000007</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 0100000a 0100010a
0100020a</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eaf5328 0eaf6048</font></tt>
<br>
<br><tt><font size=2>be@20100000000/spe@300000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf5518 (246371608)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00300000
00040000 00340000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;00360000 00020000 0040c000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000006</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 01000001 01000101
01000201</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eaf5138 0eaf6048</font></tt>
<br>
<br><tt><font size=2>be@20100000000/spe@280000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf5328 (246371112)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00280000
00040000 002c0000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;002e0000 00020000 0040a000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000005</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 01000009 01000109
01000209</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eaf4f48 0eaf5708</font></tt>
<br>
<br><tt><font size=2>be@20100000000/spe@200000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf5138 (246370616)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00200000
00040000 00240000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;00260000 00020000 00408000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000004</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 01000002 01000102
01000202</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eaf4d58 0eaf5518</font></tt>
<br>
<br><tt><font size=2>be@20100000000/spe@180000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf4f48 (246370120)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00180000
00040000 001c0000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;001e0000 00020000 00406000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000003</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 01000008 01000108
01000208</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eaf4b68 0eaf5328</font></tt>
<br>
<br><tt><font size=2>be@20100000000/spe@100000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf4d58 (246369624)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00100000
00040000 00140000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;00160000 00020000 00404000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000002</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 01000003 01000103
01000203</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eaf4978 0eaf5138</font></tt>
<br>
<br><tt><font size=2>be@20100000000/spe@80000:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf4b68 (246369128)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00080000
00040000 000c0000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;000e0000 00020000 00402000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000001</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 01000007 01000107
01000207</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eaf4f48 0eaf5d78</font></tt>
<br>
<br><tt><font size=2>be@20100000000/spe@0:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;spe&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf4978 (246368632)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;spe&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00000000
00040000 00040000 00020000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;00060000 00020000 00400000 00002000</font></tt>
<br><tt><font size=2>physical-id &nbsp; &nbsp; &nbsp;00000000</font></tt>
<br><tt><font size=2>interrupts &nbsp; &nbsp; &nbsp; 01000004 01000104
01000204</font></tt>
<br><tt><font size=2>vicinity &nbsp; &nbsp; &nbsp; &nbsp; 0eaf4d58 0eaf5d78</font></tt>
<br>
<br><tt><font size=2>be@20100000000/interrupt-controller@508400:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;interrupt-controller&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eaf4658 (246367832)</font></tt>
<br><tt><font size=2>interrupt-controller</font></tt>
<br><tt><font size=2>#interrupt-cells 00000001</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;CBEA-Internal-Interrupt-Controller&quot;</font></tt>
<br><tt><font size=2>compatible &nbsp; &nbsp; &nbsp; &quot;IBM,CBEA-Internal-Interrupt-Controller&quot;</font></tt>
<br><tt><font size=2>ibm,interrupt-server-ranges 00000002 00000003</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00508400
00000020 00508420 00000020 00508000 00001000</font></tt>
<br>
<br><tt><font size=2>------------------------------------------------------------------------------------------------</font></tt>
<br>
<br><tt><font size=2>For reason of DT completeness for the Cell/B.E. processor
I'm</font></tt>
<br><tt><font size=2>adding the cpus/ subtree which is based on the PowerPC
binding documentation</font></tt>
<br><tt><font size=2>which is *not part of the current discussions*.</font></tt>
<br><tt><font size=2>(see http://playground.sun.com/1275/bindings/ppc/release/ppc-2_0.html)</font></tt>
<br>
<br><tt><font size=2>cpus:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;cpus&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eb056f8 (246437624)</font></tt>
<br><tt><font size=2>#address-cells &nbsp; 00000001</font></tt>
<br><tt><font size=2>#size-cells &nbsp; &nbsp; &nbsp;00000000</font></tt>
<br>
<br><tt><font size=2>cpus/PowerPC,BE@1:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;PowerPC,BE&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eb065c0 (246441408)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;cpu&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00000002</font></tt>
<br><tt><font size=2>status &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;okay&quot;</font></tt>
<br><tt><font size=2>ibm,bpa &nbsp; &nbsp; &nbsp; &nbsp; </font></tt>
<br><tt><font size=2>64-bit &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</font></tt>
<br><tt><font size=2>cpu-version &nbsp; &nbsp; &nbsp;00703000 (7352320)</font></tt>
<br><tt><font size=2>d-cache-size &nbsp; &nbsp; 00008000 (32768)</font></tt>
<br><tt><font size=2>d-cache-sets &nbsp; &nbsp; 00000002</font></tt>
<br><tt><font size=2>d-cache-block-size 00000080 (128)</font></tt>
<br><tt><font size=2>d-cache-line-size 00000080 (128)</font></tt>
<br><tt><font size=2>i-cache-size &nbsp; &nbsp; 00008000 (32768)</font></tt>
<br><tt><font size=2>i-cache-sets &nbsp; &nbsp; 00000002</font></tt>
<br><tt><font size=2>i-cache-block-size 00000080 (128)</font></tt>
<br><tt><font size=2>i-cache-line-size 00000080 (128)</font></tt>
<br><tt><font size=2>clock-frequency &nbsp;bebc2000</font></tt>
<br><tt><font size=2>timebase-frequency 0196dd73 (26664307)</font></tt>
<br><tt><font size=2>ibm,associativity 00000004 00000000 00000000 00000001
00000001</font></tt>
<br><tt><font size=2>ibm,ppc-interrupt-server#s 00000002 00000003</font></tt>
<br><tt><font size=2>node-id &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00000001</font></tt>
<br><tt><font size=2>ioid &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0000000e
(14)</font></tt>
<br><tt><font size=2>iic &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00000201
00508000 00001000</font></tt>
<br><tt><font size=2>ibm,segment-page-sizes 0000000c 00000000 00000001
0000000c 00000000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;00000010 00000110 00000001 00000010 00000001</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;00000018 00000100 00000001 00000018 00000000</font></tt>
<br><tt><font size=2>tlb-size &nbsp; &nbsp; &nbsp; &nbsp; 00000400 (1024)</font></tt>
<br><tt><font size=2>tlb-sets &nbsp; &nbsp; &nbsp; &nbsp; 00000004</font></tt>
<br><tt><font size=2>d-tlb-size &nbsp; &nbsp; &nbsp; 00000400 (1024)</font></tt>
<br><tt><font size=2>d-tlb-sets &nbsp; &nbsp; &nbsp; 00000004</font></tt>
<br><tt><font size=2>i-tlb-size &nbsp; &nbsp; &nbsp; 00000400 (1024)</font></tt>
<br><tt><font size=2>i-tlb-sets &nbsp; &nbsp; &nbsp; 00000004</font></tt>
<br>
<br><tt><font size=2>cpus/PowerPC,BE@1/l2-cache:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;l2-cache&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eb06f00 (246443776)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;cache&quot;</font></tt>
<br><tt><font size=2>d-cache-size &nbsp; &nbsp; 00080000 (524288)</font></tt>
<br><tt><font size=2>d-cache-sets &nbsp; &nbsp; 00000008</font></tt>
<br><tt><font size=2>d-cache-line-size 00000080 (128)</font></tt>
<br><tt><font size=2>i-cache-size &nbsp; &nbsp; 00080000 (524288)</font></tt>
<br><tt><font size=2>i-cache-sets &nbsp; &nbsp; 00000008</font></tt>
<br><tt><font size=2>i-cache-line-size 00000080 (128)</font></tt>
<br><tt><font size=2>cache-unified &nbsp; </font></tt>
<br>
<br><tt><font size=2>cpus/PowerPC,BE@0:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;PowerPC,BE&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eb05910 (246438160)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;cpu&quot;</font></tt>
<br><tt><font size=2>reg &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00000000</font></tt>
<br><tt><font size=2>status &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;okay&quot;</font></tt>
<br><tt><font size=2>ibm,bpa &nbsp; &nbsp; &nbsp; &nbsp; </font></tt>
<br><tt><font size=2>64-bit &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</font></tt>
<br><tt><font size=2>cpu-version &nbsp; &nbsp; &nbsp;00703000 (7352320)</font></tt>
<br><tt><font size=2>d-cache-size &nbsp; &nbsp; 00008000 (32768)</font></tt>
<br><tt><font size=2>d-cache-sets &nbsp; &nbsp; 00000002</font></tt>
<br><tt><font size=2>d-cache-block-size 00000080 (128)</font></tt>
<br><tt><font size=2>d-cache-line-size 00000080 (128)</font></tt>
<br><tt><font size=2>i-cache-size &nbsp; &nbsp; 00008000 (32768)</font></tt>
<br><tt><font size=2>i-cache-sets &nbsp; &nbsp; 00000002</font></tt>
<br><tt><font size=2>i-cache-block-size 00000080 (128)</font></tt>
<br><tt><font size=2>i-cache-line-size 00000080 (128)</font></tt>
<br><tt><font size=2>clock-frequency &nbsp;bebc2000</font></tt>
<br><tt><font size=2>timebase-frequency 0196dd73 (26664307)</font></tt>
<br><tt><font size=2>ibm,associativity 00000004 00000000 00000000 00000000
00000000</font></tt>
<br><tt><font size=2>ibm,ppc-interrupt-server#s 00000000 00000001</font></tt>
<br><tt><font size=2>node-id &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00000000</font></tt>
<br><tt><font size=2>ioid &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0000000e
(14)</font></tt>
<br><tt><font size=2>iic &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;00000200
00508000 00001000</font></tt>
<br><tt><font size=2>ibm,segment-page-sizes 0000000c 00000000 00000001
0000000c 00000000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;00000010 00000110 00000001 00000010 00000001</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;00000018 00000100 00000001 00000018 00000000</font></tt>
<br><tt><font size=2>tlb-size &nbsp; &nbsp; &nbsp; &nbsp; 00000400 (1024)</font></tt>
<br><tt><font size=2>tlb-sets &nbsp; &nbsp; &nbsp; &nbsp; 00000004</font></tt>
<br><tt><font size=2>d-tlb-size &nbsp; &nbsp; &nbsp; 00000400 (1024)</font></tt>
<br><tt><font size=2>d-tlb-sets &nbsp; &nbsp; &nbsp; 00000004</font></tt>
<br><tt><font size=2>i-tlb-size &nbsp; &nbsp; &nbsp; 00000400 (1024)</font></tt>
<br><tt><font size=2>i-tlb-sets &nbsp; &nbsp; &nbsp; 00000004</font></tt>
<br>
<br><tt><font size=2>cpus/PowerPC,BE@0/l2-cache:</font></tt>
<br><tt><font size=2>name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;l2-cache&quot;</font></tt>
<br><tt><font size=2>linux,phandle &nbsp; &nbsp;0eb06250 (246440528)</font></tt>
<br><tt><font size=2>device_type &nbsp; &nbsp; &nbsp;&quot;cache&quot;</font></tt>
<br><tt><font size=2>d-cache-size &nbsp; &nbsp; 00080000 (524288)</font></tt>
<br><tt><font size=2>d-cache-sets &nbsp; &nbsp; 00000008</font></tt>
<br><tt><font size=2>d-cache-line-size 00000080 (128)</font></tt>
<br><tt><font size=2>i-cache-size &nbsp; &nbsp; 00080000 (524288)</font></tt>
<br><tt><font size=2>i-cache-sets &nbsp; &nbsp; 00000008</font></tt>
<br><tt><font size=2>i-cache-line-size 00000080 (128)</font></tt>
<br><tt><font size=2>cache-unified &nbsp; </font></tt>
<br>
<br>
<br><tt><font size=2><br>
&gt; <br>
&gt; Thanks,<br>
&gt; g.<br>
&gt; <br>
&gt; -- <br>
&gt; Grant Likely, B.Sc., P.Eng.<br>
&gt; Secret Lab Technologies Ltd.<br>
&gt; <br>
&gt; <br>
&gt; ------------------------------<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; devicetree-discuss mailing list<br>
&gt; devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org<br>
&gt; https://ozlabs.org/mailman/listinfo/devicetree-discuss<br>
&gt; <br>
&gt; <br>
&gt; End of devicetree-discuss Digest, Vol 7, Issue 7<br>
&gt; ************************************************<br>
</font></tt>
--=_alternative 00305879C125753E_=--

--===============1417898718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============1417898718==--
