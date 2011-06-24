From: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/2] Character literal parsing
Date: Fri, 24 Jun 2011 13:22:13 -0700
Message-ID: <BANLkTi=iUqMwag-A6t1ubDgSAN9xqWuTMwLG32EKKWuwVbigyg@mail.gmail.com>
References: <1308871239-32683-1-git-send-email-robotboy@chromium.org>
	<8yawrgb3smr.fsf@huya.qualcomm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2171265756866020859=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <8yawrgb3smr.fsf-AOX6H5vLt3Uj8izMo0bVsAC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2171265756866020859==
Content-Type: multipart/alternative; boundary=00504502e3b907a32d04a67af586

--00504502e3b907a32d04a67af586
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 24, 2011 at 1:02 PM, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:

>
> Does this mean that the dtc inside the kernel is going to be the
> required tool to use to build device trees?  This change doesn't change
> the DTB format, so it's as much of a concern, but was wondering if we're
> intending to keep things compatible.
>

To be honest, I don't know enough to say either way.  I am using the
character
literals in a device tree that is used to configure a single firmware image
for
multiple boards.  That device tree is not currently passed on to the kernel.

Your question makes me think that there are two device tree compilers that I
should be paying attention to, is that the case?  Or was it a more general
comment about diverging from a historic syntax for device tree source files?

Thanks,
    Anton

--00504502e3b907a32d04a67af586
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div><div class=3D"gmail_quote">On Fri, Jun 24, 2011 at 1:02 PM, David Brow=
n <span dir=3D"ltr">&lt;<a href=3D"mailto:davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org">davidb@cod=
eaurora.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"im"><br>
</div>Does this mean that the dtc inside the kernel is going to be the<br>
required tool to use to build device trees? =A0This change doesn&#39;t chan=
ge<br>
the DTB format, so it&#39;s as much of a concern, but was wondering if we&#=
39;re<br>
intending to keep things compatible.<br></blockquote><div><br></div><div><m=
eta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-8">To b=
e honest, I don&#39;t know enough to say either way. =A0I am using the char=
acter<div>
literals in a device tree that is used to configure a single firmware image=
 for</div><div>multiple boards. =A0That device tree is not currently passed=
 on to the kernel.</div><div><br></div><div>Your question makes me think th=
at there are two device tree compilers that I</div>
<div>should be paying attention to, is that the case? =A0Or was it a more g=
eneral</div><div>comment about diverging from a historic syntax for device =
tree source files?</div><div><br></div><div>Thanks,</div><div>=A0 =A0 Anton=
<br>
</div></div><div><br></div></div></div>

--00504502e3b907a32d04a67af586--

--===============2171265756866020859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2171265756866020859==--
