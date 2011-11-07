From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] distclean: Remove generated .dtb files
Date: Mon, 7 Nov 2011 06:42:22 -0700
Message-ID: <CACxGe6u9SLcduC7j_wSK2dbpT6VZQ6mrbZ=AcWNs2SRExNTm7w@mail.gmail.com>
References: <1320473955-4500-1-git-send-email-dirk.behme@de.bosch.com>
 <20111106183802.GB2546@ponder.secretlab.ca>
 <CACxGe6vK24j=L_WQWf5eqmdKXf0gCD=waAbJj4eq9d63O8mbvA@mail.gmail.com>
 <4EB779CF.4040007@googlemail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4890152307057103665=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EB779CF.4040007-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dirk Behme <dirk.behme-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============4890152307057103665==
Content-Type: multipart/alternative; boundary=0016e648a93491762204b125391d

--0016e648a93491762204b125391d
Content-Type: text/plain; charset=ISO-8859-1

On Nov 6, 2011 11:25 PM, "Dirk Behme" <dirk.behme-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>
> On 06.11.2011 19:42, Grant Likely wrote:
>>
>> On Sun, Nov 6, 2011 at 11:38 AM, Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
 wrote:
>>>
>>> On Sat, Nov 05, 2011 at 07:19:15AM +0100, Dirk Behme wrote:
>>>>
>>>> The patch 'arm/dt: Add dtb make rule' adds support to
>>>> create a .dtb file. But this is never removed afterwards.
>>>> Remove the generated .dtb file if 'distclean' is called.
>>>>
>>>> Signed-off-by: Dirk Behme<dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
>>>> CC: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>>> CC: Shawn Guo<shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>>> CC: Jason Liu<jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> CC: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>>
>>>
>>> Acked-by: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>
>>
>> ... although why are only the .dtb files needed in the clean list?
>> How are the other built files cleaned?  'make clean' does remove the
>> other images, but I don't know what the mechanism is.
>
>
> A lot of stuff is removed by the top level Makefile [1]. But as the patch
"arm/dt: Add dtb make rule" adds the .dtb generation to
arch/arm/boot/Makefile, we thought it would be a good place to add the
removal of that file there, too.
>
> Hmm, not sure if this answers your question, though ;)

Okay. Good enough for me.

g.

--0016e648a93491762204b125391d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On Nov 6, 2011 11:25 PM, &quot;Dirk Behme&quot; &lt;<a href=3D"mailto:dirk.=
behme-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org">dirk.behme-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 06.11.2011 19:42, Grant Likely wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Sun, Nov 6, 2011 at 11:38 AM, Grant Likely&lt;<a href=3D"mailto=
:grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org">grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt; =A0wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Sat, Nov 05, 2011 at 07:19:15AM +0100, Dirk Behme wrote:<br=
>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The patch &#39;arm/dt: Add dtb make rule&#39; adds support=
 to<br>
&gt;&gt;&gt;&gt; create a .dtb file. But this is never removed afterwards.<=
br>
&gt;&gt;&gt;&gt; Remove the generated .dtb file if &#39;distclean&#39; is c=
alled.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Dirk Behme&lt;<a href=3D"mailto:dirk.behme@=
de.bosch.com">dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org</a>&gt;<br>
&gt;&gt;&gt;&gt; CC: Rob Herring&lt;<a href=3D"mailto:rob.herring@calxeda.c=
om">rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org</a>&gt;<br>
&gt;&gt;&gt;&gt; CC: Shawn Guo&lt;<a href=3D"mailto:shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org=
">shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org</a>&gt;<br>
&gt;&gt;&gt;&gt; CC: Jason Liu&lt;<a href=3D"mailto:jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">j=
ason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt;&gt;&gt;&gt; CC: Grant Likely&lt;<a href=3D"mailto:grant.likely@secretl=
ab.ca">grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Acked-by: Grant Likely&lt;<a href=3D"mailto:grant.likely@secre=
tlab.ca">grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ... although why are only the .dtb files needed in the clean list?=
<br>
&gt;&gt; How are the other built files cleaned? =A0&#39;make clean&#39; doe=
s remove the<br>
&gt;&gt; other images, but I don&#39;t know what the mechanism is.<br>
&gt;<br>
&gt;<br>
&gt; A lot of stuff is removed by the top level Makefile [1]. But as the pa=
tch &quot;arm/dt: Add dtb make rule&quot; adds the .dtb generation to arch/=
arm/boot/Makefile, we thought it would be a good place to add the removal o=
f that file there, too.<br>

&gt;<br>
&gt; Hmm, not sure if this answers your question, though ;)</p>
<p>Okay. Good enough for me.</p>
<p>g.</p>

--0016e648a93491762204b125391d--

--===============4890152307057103665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4890152307057103665==--
