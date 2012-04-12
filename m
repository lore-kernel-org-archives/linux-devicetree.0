From: "Dennis.Yxun" <dennis.yxun-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Booting DT support without U-Boot supporting it
Date: Thu, 12 Apr 2012 16:43:31 +0800
Message-ID: <CAF1ZMEc5ctwktcWxKaaWh46Py_p30noTA7RZLw7ftrN1XnwpLA@mail.gmail.com>
References: <4F865817.3000802@st.com>
 <20120412051947.GG2445@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0033352797843271842=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120412051947.GG2445-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============0033352797843271842==
Content-Type: multipart/alternative; boundary=14dae93b590ec24e2804bd7759dc

--14dae93b590ec24e2804bd7759dc
Content-Type: text/plain; charset=UTF-8

hi Guo:
  I guess CONFIG_ARM_APPENDED_DTB and CONFIG_ARM_ATAG_DTB_COMPAT are ARM
soc specific?
  So, what if I want to boot MIPS kernel, but without bootloader support DT?
  Thanks

Dennis

On Thu, Apr 12, 2012 at 1:19 PM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> On Thu, Apr 12, 2012 at 09:50:39AM +0530, Viresh Kumar wrote:
> > Hi,
> >
> > My U-boot is on an older version and that doesn't have DT support for
> ARM.
> > Now, is there any way of booting Linux with DT, without U-Boot
> supporting DT?
> >
> This is how I responded to Fabio on the same query a few hours ago :)
>
> - Turn on CONFIG_ARM_APPENDED_DTB and CONFIG_ARM_ATAG_DTB_COMPAT
> - cat zImage mx27pdk.dtb > zImage_dtb
> - Boot zImage_dtb as you do with zImage
>
> Regards,
> Shawn
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>

--14dae93b590ec24e2804bd7759dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hi Guo:<br>=C2=A0 I guess CONFIG_ARM_APPENDED_DTB and CONFIG_ARM_ATAG_DTB_C=
OMPAT are ARM soc specific?<br>=C2=A0 So, what if I want to boot MIPS kerne=
l, but without bootloader support DT?<br>=C2=A0 Thanks<br><br>Dennis<br><br=
><div class=3D"gmail_quote">
On Thu, Apr 12, 2012 at 1:19 PM, Shawn Guo <span dir=3D"ltr">&lt;<a href=3D=
"mailto:shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<div class=3D"im">On Thu, Apr 12, 2012 at 09:50:39AM +0530, Viresh Kumar wr=
ote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; My U-boot is on an older version and that doesn&#39;t have DT support =
for ARM.<br>
&gt; Now, is there any way of booting Linux with DT, without U-Boot support=
ing DT?<br>
&gt;<br>
</div>This is how I responded to Fabio on the same query a few hours ago :)=
<br>
<br>
- Turn on CONFIG_ARM_APPENDED_DTB and CONFIG_ARM_ATAG_DTB_COMPAT<br>
- cat zImage mx27pdk.dtb &gt; zImage_dtb<br>
- Boot zImage_dtb as you do with zImage<br>
<br>
Regards,<br>
Shawn<br>
<div class=3D"HOEnZb"><div class=3D"h5">___________________________________=
____________<br>
devicetree-discuss mailing list<br>
<a href=3D"mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org">devicetree-discuss@l=
ists.ozlabs.org</a><br>
<a href=3D"https://lists.ozlabs.org/listinfo/devicetree-discuss" target=3D"=
_blank">https://lists.ozlabs.org/listinfo/devicetree-discuss</a><br>
</div></div></blockquote></div><br>

--14dae93b590ec24e2804bd7759dc--

--===============0033352797843271842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0033352797843271842==--
