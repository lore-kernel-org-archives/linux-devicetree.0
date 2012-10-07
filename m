From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Subject: Re: sata_highbank: mismatch in reference
Date: Sun, 07 Oct 2012 12:36:54 -0500
Message-ID: <4857fbc5-e72e-43cb-b498-1f2f36019f5a@email.android.com>
References: <CAG27Bk2kP7TvCG2m4Q_ke-RauNUufZ4H6yQqXdNom-V0BTNpxA@mail.gmail.com>
 <CACxGe6uho2BJR=xjR7SOadpHyCPiCoTVc=Z+XzK85NsT1mpkvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0711878455460176591=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6uho2BJR=xjR7SOadpHyCPiCoTVc=Z+XzK85NsT1mpkvQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, kerolasa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Langsdorf <mark.langsdorf-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============0711878455460176591==
Content-Type: multipart/alternative; boundary="----0Z8NV77WVSIS1NXGNU9EOIFPWL7XGU"

------0Z8NV77WVSIS1NXGNU9EOIFPWL7XGU
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

There's already a fix in flight for this.

Rob

Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:

>On Oct 7, 2012 3:05 PM, "Sami Kerola" <kerolasa-X3B1VOXEql0@public.gmane.org> wrote:
>>
>> FYI maintainers,
>>
>> I tried to compile linus git kernel (v3.6-7996-g0b8e74c) and got
>> mismatch warning. I am not sure, but the warning might have something
>> to do config option CONFIG_OPTIMIZE_INLINING=3Dy. Here are the
>> interesting lines from compilation attempt.
>>
>> WARNING: drivers/ata/sata_highbank.o(.data+0x0): Section mismatch in
>> reference from the variable ahci_highbank_driver to the function
>> .init.text:ahci_highbank_probe()
>> The variable ahci_highbank_driver references
>> the function __init ahci_highbank_probe()
>> If the reference is valid then annotate the
>> variable with __init* or __refdata (see linux/init.h) or name the
>variable:
>> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
>
>This error means that the _probe and _release hooks need to be changed
>from __init to __devinit and __exit to __devexit.
>
>g.

------0Z8NV77WVSIS1NXGNU9EOIFPWL7XGU
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head/><body><html><head></head><body>There&#39;s already a fix in =
flight for this.<br>
<br>
Rob<br><br><div class=3D"gmail_quote">Grant Likely &lt;grant.likely@secre=
tlab.ca&gt; wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0pt =
0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1=
ex;">
<pre style=3D"white-space: pre-wrap; word-wrap:break-word; font-family: m=
onospace; margin-top: 0px">On Oct 7, 2012 3:05 PM, "Sami Kerola" &lt;kero=
lasa-X3B1VOXEql0@public.gmane.org&gt; wrote:<br /><br /><blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding-le=
ft: 1ex;">FYI maintainers,<br /><br />I tried to compile linus git kernel=
 (v3.6-7996-g0b8e74c) and got<br />mismatch warning. I am not sure, but t=
he warning might have something<br />to do config option CONFIG_OPTIMIZE_=
INLINING=3Dy. Here are the<br />interesting lines from compilation attemp=
t.<br /><br />WARNING: drivers/ata/sata_highbank.o(.data+0x0): Section mi=
smatch in<br />reference from the variable ahci_highbank_driver to the fu=
nction<br />.init.text:ahci_highbank_probe()<br />The variable ahci_highb=
ank_driver references<br />the function __init ahci_highbank_probe()<br /=
>If the reference is valid then annotate the<br />variable with __init* o=
r __refdata (see linux/init.h) or name the variab
 le:<br
/>*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console</blo=
ckquote><br />This error means that the _probe and _release hooks need to=
 be changed<br />from __init to __devinit and __exit to __devexit.<br /><=
br />g.<br /></pre></blockquote></div></body></html></body></html>
------0Z8NV77WVSIS1NXGNU9EOIFPWL7XGU--


--===============0711878455460176591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0711878455460176591==--
