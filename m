From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [dtc] Remove another bashism from run_tests.sh
Date: Sun, 29 Aug 2010 21:22:46 -0600
Message-ID: <AANLkTimXoGXPZTuqFDRHb4gS9KuufQDzjHS6QLLanWW-@mail.gmail.com>
References: <20100830025303.GA5210@yookeroo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3586086677403090413=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100830025303.GA5210@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============3586086677403090413==
Content-Type: multipart/alternative; boundary=00151750d9ca7302e1048f01fa69

--00151750d9ca7302e1048f01fa69
Content-Type: text/plain; charset=ISO-8859-1

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

On Aug 29, 2010 8:53 PM, "David Gibson" <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> Current we check for various error codes with [ $x == "NN" ]. However
> '==' is not actually a correct operator for the [ (test) command. It
> should be either '=' for string comparison or '-eq' for integer
> comparison. It appears that the bash builtin version of test
> implements '==' though, so we were getting away with it, as long as
> /bin/sh was bash - or the testsuite generated no errors.
>
> This patch fixes the usage of test so that it should work on non-bash
> shells.
>
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>
> Index: dtc/tests/run_tests.sh
> ===================================================================
> --- dtc.orig/tests/run_tests.sh 2010-08-30 12:43:03.133784380 +1000
> +++ dtc/tests/run_tests.sh 2010-08-30 12:43:34.741770203 +1000
> @@ -24,11 +24,11 @@ base_run_test() {
> tot_pass=$((tot_pass + 1))
> else
> ret="$?"
> - if [ "$ret" == "1" ]; then
> + if [ "$ret" -eq 1 ]; then
> tot_config=$((tot_config + 1))
> - elif [ "$ret" == "2" ]; then
> + elif [ "$ret" -eq 2 ]; then
> tot_fail=$((tot_fail + 1))
> - elif [ "$ret" == "$VGCODE" ]; then
> + elif [ "$ret" -eq $VGCODE ]; then
> tot_vg=$((tot_vg + 1))
> else
> tot_strange=$((tot_strange + 1))
>
> --
> David Gibson | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au | minimalist, thank you. NOT _the_ _other_
> | _way_ _around_!
> http://www.ozlabs.org/~dgibson
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss

--00151750d9ca7302e1048f01fa69
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>Acked-by: Grant Likely &lt;<a href=3D"mailto:grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org">=
grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;</p>
<p>On Aug 29, 2010 8:53 PM, &quot;David Gibson&quot; &lt;<a href=3D"mailto:=
david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org">david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org</a>&gt; wrote:<br =
type=3D"attribution">&gt; Current we check for various error codes with [ $=
x =3D=3D &quot;NN&quot; ].  However<br>
&gt; &#39;=3D=3D&#39; is not actually a correct operator for the [ (test) c=
ommand.  It<br>&gt; should be either &#39;=3D&#39; for string comparison or=
 &#39;-eq&#39; for integer<br>&gt; comparison.  It appears that the bash bu=
iltin version of test<br>
&gt; implements &#39;=3D=3D&#39; though, so we were getting away with it, a=
s long as<br>&gt; /bin/sh was bash - or the testsuite generated no errors.<=
br>&gt; <br>&gt; This patch fixes the usage of test so that it should work =
on non-bash<br>
&gt; shells.<br>&gt; <br>&gt; Signed-off-by: David Gibson &lt;<a href=3D"ma=
ilto:david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org">david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org</a>&gt;<br>&g=
t; <br>&gt; Index: dtc/tests/run_tests.sh<br>&gt; =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; --- dtc.orig/tests/run_tests.sh	2010-08-30 12:43:03.133784380 +1000<br=
>&gt; +++ dtc/tests/run_tests.sh	2010-08-30 12:43:34.741770203 +1000<br>&gt=
; @@ -24,11 +24,11 @@ base_run_test() {<br>&gt;  	tot_pass=3D$((tot_pass + =
1))<br>
&gt;      else<br>&gt;  	ret=3D&quot;$?&quot;<br>&gt; -	if [ &quot;$ret&quo=
t; =3D=3D &quot;1&quot; ]; then<br>&gt; +	if [ &quot;$ret&quot; -eq 1 ]; th=
en<br>&gt;  	    tot_config=3D$((tot_config + 1))<br>&gt; -	elif [ &quot;$r=
et&quot; =3D=3D &quot;2&quot; ]; then<br>
&gt; +	elif [ &quot;$ret&quot; -eq 2 ]; then<br>&gt;  	    tot_fail=3D$((to=
t_fail + 1))<br>&gt; -	elif [ &quot;$ret&quot; =3D=3D &quot;$VGCODE&quot; ]=
; then<br>&gt; +	elif [ &quot;$ret&quot; -eq $VGCODE ]; then<br>&gt;  	    =
tot_vg=3D$((tot_vg + 1))<br>
&gt;  	else<br>&gt;  	    tot_strange=3D$((tot_strange + 1))<br>&gt; <br>&g=
t; -- <br>&gt; David Gibson			| I&#39;ll have my music baroque, and my code=
<br>&gt; david AT <a href=3D"http://gibson.dropbear.id.au">gibson.dropbear.=
id.au</a>	| minimalist, thank you.  NOT _the_ _other_<br>
&gt; 				| _way_ _around_!<br>&gt; <a href=3D"http://www.ozlabs.org/~dgibso=
n">http://www.ozlabs.org/~dgibson</a><br>&gt; _____________________________=
__________________<br>&gt; devicetree-discuss mailing list<br>&gt; <a href=
=3D"mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org">devicetree-discuss-uLR06cmDAlY@public.gmane.org=
labs.org</a><br>
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/devicetree-discuss">https=
://lists.ozlabs.org/listinfo/devicetree-discuss</a><br></p>

--00151750d9ca7302e1048f01fa69--

--===============3586086677403090413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3586086677403090413==--
