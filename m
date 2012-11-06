From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH Resend V2] dt: add helper function to read u8 & u16
	variables & arrays
Date: Tue, 6 Nov 2012 16:38:24 +0530
Message-ID: <CAKohpom-hdS3d=eM45tRAk1C7MS14xgqpu4k1SmoH4s4TV4L8A@mail.gmail.com>
References: <64c5278ebdec503f83e9b7002bf13affb7f3260f.1351225085.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3752040894211887862=="
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <64c5278ebdec503f83e9b7002bf13affb7f3260f.1351225085.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============3752040894211887862==
Content-Type: multipart/alternative; boundary=14dae9340ddfe9ee0e04cdd19e2c

--14dae9340ddfe9ee0e04cdd19e2c
Content-Type: text/plain; charset=ISO-8859-1

On 26 October 2012 09:50, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> This adds following helper routines:
> - of_property_read_u8_array()
> - of_property_read_u16_array()
> - of_property_read_u8()
> - of_property_read_u16()
>
> First two actually share most of the code with
> of_property_read_u32_array(), so
> the common part is taken out into a macro, which can be used by all three
> *_array() routines.
>
> Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>

Ping!!

--14dae9340ddfe9ee0e04cdd19e2c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 26 October 2012 09:50, Viresh Kumar <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" target=3D"_blank">viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&=
gt;</span> wrote:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<div class=3D"im">This adds following helper routines:<br>
- of_property_read_u8_array()<br>
- of_property_read_u16_array()<br>
- of_property_read_u8()<br>
- of_property_read_u16()<br>
<br>
First two actually share most of the code with of_property_read_u32_array()=
, so<br>
the common part is taken out into a macro, which can be used by all three<b=
r>
*_array() routines.<br>
<br>
</div><div class=3D"im">Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:v=
iresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;</div></blockquote><=
div><br></div><div>Ping!!=A0</div></div><br>

--14dae9340ddfe9ee0e04cdd19e2c--


--===============3752040894211887862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linaro-dev mailing list
linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
http://lists.linaro.org/mailman/listinfo/linaro-dev

--===============3752040894211887862==--
