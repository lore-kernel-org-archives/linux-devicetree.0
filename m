From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: of_irq_init() stopped working in 3.2-rc3
Date: Sat, 26 Nov 2011 10:05:21 -0600
Message-ID: <CAL_JsqLs3WAod3nuPV7cqYN-PmmbUwQzJHoMe6cXLMeg1XPGYA@mail.gmail.com>
References: <1322244534.22757.7.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8483456670863466768=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322244534.22757.7.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============8483456670863466768==
Content-Type: multipart/alternative; boundary=e89a8f64738dcaa11504b2a56f9e

--e89a8f64738dcaa11504b2a56f9e
Content-Type: text/plain; charset=ISO-8859-1

On Nov 25, 2011 12:08 PM, "Pawel Moll" <pawel.moll-5wv7dgnIgG8@public.gmane.org> wrote:
>
> Hi Rob,
>
> Because your dc9372808412edbc653a675a526c2ee6c0c14a91 "of/irq:
> of_irq_find_parent: check for parent equal to child" got reverted in
> 3.2-rc3, the of_irq_init() doesn't work, as...
>

Snip...

> ... the desc->interrupt_parent is not NULL for the root interrupt
controller
> any more...
>
> I've temporarily worked the problem around by re-applying the
> of_irq_find_parent() change.
>
You can also add "interrupt-parent;" to your gic DT node. I plan to send a
fix soon.

Rob

--e89a8f64738dcaa11504b2a56f9e
Content-Type: text/html; charset=ISO-8859-1

<p><br>
On Nov 25, 2011 12:08 PM, &quot;Pawel Moll&quot; &lt;<a href="mailto:pawel.moll-5wv7dgnIgG8@public.gmane.org">pawel.moll-5wv7dgnIgG8@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Rob,<br>
&gt;<br>
&gt; Because your dc9372808412edbc653a675a526c2ee6c0c14a91 &quot;of/irq:<br>
&gt; of_irq_find_parent: check for parent equal to child&quot; got reverted in<br>
&gt; 3.2-rc3, the of_irq_init() doesn&#39;t work, as...<br>
&gt;</p>
<p>Snip...</p>
<p>&gt; ... the desc-&gt;interrupt_parent is not NULL for the root interrupt controller<br>
&gt; any more...<br>
&gt;<br>
&gt; I&#39;ve temporarily worked the problem around by re-applying the<br>
&gt; of_irq_find_parent() change.<br>
&gt;<br>
You can also add &quot;interrupt-parent;&quot; to your gic DT node. I plan to send a fix soon.</p>
<p>Rob<br>
</p>

--e89a8f64738dcaa11504b2a56f9e--

--===============8483456670863466768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8483456670863466768==--
