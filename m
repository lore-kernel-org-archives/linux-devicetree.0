From: viresh kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 1/5] of: Implement managed of_iomap()
Date: Mon, 16 Apr 2012 20:42:51 +0530
Message-ID: <CAOh2x=n0NfovyfCpcdoMo2a7yLtb=imm1U+R-1L-2ihZ52FUhw@mail.gmail.com>
References: <cover.1334548272.git.viresh.kumar@st.com>
 <6a0872f9d8959bc9d66d179e4911d6f09a219b42.1334548272.git.viresh.kumar@st.com>
 <201204161442.38725.arnd@arndb.de>
 <CACxGe6tec7y-9VNb9vNiPZhN6bt5MuMV0J18P_7Gk_pDwk-V=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8597948088554144965=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6tec7y-9VNb9vNiPZhN6bt5MuMV0J18P_7Gk_pDwk-V=Q@mail.gmail.com>
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

--===============8597948088554144965==
Content-Type: multipart/alternative; boundary=f46d0444044c7ee9f504bdcd4143

--f46d0444044c7ee9f504bdcd4143
Content-Type: text/plain; charset=ISO-8859-1

On Apr 16, 2012 8:37 PM, "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>
> Why is this function needed?  I'm directing drivers away from using
> of_iomap now since the resource table is populated with the address
> ranges at device registration time now.  New code should be using
> platform_get_resource() if it is a platform device.
>

I thought we must call of_iomap for
DT only drivers.
Isn't that the case?

--
Viresh

--f46d0444044c7ee9f504bdcd4143
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On Apr 16, 2012 8:37 PM, &quot;Grant Likely&quot; &lt;<a href=3D"mailto:gra=
nt.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org">grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Why is this function needed? =A0I&#39;m directing drivers away from us=
ing<br>
&gt; of_iomap now since the resource table is populated with the address<br=
>
&gt; ranges at device registration time now. =A0New code should be using<br=
>
&gt; platform_get_resource() if it is a platform device.<br>
&gt;</p>
<p>I thought we must call of_iomap for<br>
DT only drivers.<br>
Isn&#39;t that the case?</p>
<p>--<br>
Viresh</p>

--f46d0444044c7ee9f504bdcd4143--

--===============8597948088554144965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8597948088554144965==--
