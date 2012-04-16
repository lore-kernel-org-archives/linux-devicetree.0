From: viresh kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 1/5] of: Implement managed of_iomap()
Date: Mon, 16 Apr 2012 22:40:11 +0530
Message-ID: <CAOh2x=mog2GL9xYUpGJdZSJ4KStKo6kOrKtTEMp4V-Rv7nc5OA@mail.gmail.com>
References: <cover.1334548272.git.viresh.kumar@st.com>
 <6a0872f9d8959bc9d66d179e4911d6f09a219b42.1334548272.git.viresh.kumar@st.com>
 <201204161442.38725.arnd@arndb.de>
 <CACxGe6tec7y-9VNb9vNiPZhN6bt5MuMV0J18P_7Gk_pDwk-V=Q@mail.gmail.com>
 <CAOh2x=n0NfovyfCpcdoMo2a7yLtb=imm1U+R-1L-2ihZ52FUhw@mail.gmail.com>
 <CACxGe6tZhdvoJ60N8g5-P4UHWxB=699_bA2omEQa77u1hEEPrg@mail.gmail.com>
 <CAOh2x=mptNGkRB-+930Uim=Op9erOxreeTL=3+qfoFeVpWNEYQ@mail.gmail.com>
 <CACxGe6t9+M5jQKkRduup7_wk4SKYu1SuTz7wzf0MEvo0poojRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2276279881590672469=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6t9+M5jQKkRduup7_wk4SKYu1SuTz7wzf0MEvo0poojRw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2276279881590672469==
Content-Type: multipart/alternative; boundary=f46d0443066c2284c104bdcee59f

--f46d0443066c2284c104bdcee59f
Content-Type: text/plain; charset=ISO-8859-1

On Apr 16, 2012 10:36 PM, "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>

> Cool, thanks.
>
> Now what you *could* do is something like devm_platform_ioremap() that
> gets the resource, does request_region() and ioremap().  That would
> cut a lot of boilerplate out of drivers.  :-)

I wanted to, but i wasn't using request_region()
so skipped it.
Will do that in a separate patch and send it to you.

Viresh

--f46d0443066c2284c104bdcee59f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On Apr 16, 2012 10:36 PM, &quot;Grant Likely&quot; &lt;<a href=3D"mailto:gr=
ant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org">grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt; wrote:<br>
&gt;</p>
<p>&gt; Cool, thanks.<br>
&gt;<br>
&gt; Now what you *could* do is something like devm_platform_ioremap() that=
<br>
&gt; gets the resource, does request_region() and ioremap(). =A0That would<=
br>
&gt; cut a lot of boilerplate out of drivers. =A0:-)</p>
<p>I wanted to, but i wasn&#39;t using request_region()<br>
so skipped it.<br>
Will do that in a separate patch and send it to you.</p>
<p>Viresh</p>

--f46d0443066c2284c104bdcee59f--

--===============2276279881590672469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2276279881590672469==--
