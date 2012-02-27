From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] devicetree: Add empty of_platform_populate() for
 !CONFIG_OF_ADDRESS (sparc)
Date: Mon, 27 Feb 2012 06:56:16 -0700
Message-ID: <CACxGe6tsq7Tyvj45rnES5nLTdWiPomg_QJyPoYPZ+GFdkXT=9Q@mail.gmail.com>
References: <1330121218-10442-1-git-send-email-grant.likely@secretlab.ca>
 <20120227103958.GJ27687@sortiz-mobl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1693185540963021158=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120227103958.GJ27687@sortiz-mobl>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============1693185540963021158==
Content-Type: multipart/alternative; boundary=e89a8fb1f6006490e704b9f27971

--e89a8fb1f6006490e704b9f27971
Content-Type: text/plain; charset=ISO-8859-1

On Feb 27, 2012 3:32 AM, "Samuel Ortiz" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>
> Hi Grant,
>
> On Fri, Feb 24, 2012 at 03:06:58PM -0700, Grant Likely wrote:
> > Sparc has its own helpers for translating address ranges when the device
> > tree is parsed at boot time, and it isn't able to use
of_platform_populate().
> > However, there are some device drivers that want to use that function on
> > other DT enabled platforms (ie. TWL4030).  This patch adds an empty
> > of_platform_populate() implementation that returns an error when
> > CONFIG_OF_ADDRESS is not selected.
> Applied as well. Please let me know if you'd prefer to see this one going
> through your irqdomain/next branch.

Yes, it must go via my tree. I've already applied it and pushed it out.

g.

>
> Cheers,
> Samuel.
>
> --
> Intel Open Source Technology Centre
> http://oss.intel.com/

--e89a8fb1f6006490e704b9f27971
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On Feb 27, 2012 3:32 AM, &quot;Samuel Ortiz&quot; &lt;<a href=3D"mailto:sam=
eo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org">sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Grant,<br>
&gt;<br>
&gt; On Fri, Feb 24, 2012 at 03:06:58PM -0700, Grant Likely wrote:<br>
&gt; &gt; Sparc has its own helpers for translating address ranges when the=
 device<br>
&gt; &gt; tree is parsed at boot time, and it isn&#39;t able to use of_plat=
form_populate().<br>
&gt; &gt; However, there are some device drivers that want to use that func=
tion on<br>
&gt; &gt; other DT enabled platforms (ie. TWL4030). =A0This patch adds an e=
mpty<br>
&gt; &gt; of_platform_populate() implementation that returns an error when<=
br>
&gt; &gt; CONFIG_OF_ADDRESS is not selected.<br>
&gt; Applied as well. Please let me know if you&#39;d prefer to see this on=
e going<br>
&gt; through your irqdomain/next branch.</p>
<p>Yes, it must go via my tree. I&#39;ve already applied it and pushed it o=
ut.</p>
<p>g.</p>
<p>&gt;<br>
&gt; Cheers,<br>
&gt; Samuel.<br>
&gt;<br>
&gt; --<br>
&gt; Intel Open Source Technology Centre<br>
&gt; <a href=3D"http://oss.intel.com/">http://oss.intel.com/</a><br>
</p>

--e89a8fb1f6006490e704b9f27971--

--===============1693185540963021158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1693185540963021158==--
