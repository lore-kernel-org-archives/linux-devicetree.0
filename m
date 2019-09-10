From: Gabriel Francisco <frc.gabriel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 0/7] qcom: add OCMEM support
Date: Tue, 10 Sep 2019 20:13:39 +0200
Message-ID: <d3eb4c40-67ad-c318-84be-f701b8ae6abe@gmail.com>
References: <20190823121637.5861-1-masneyb@onstation.org>
 <20190901214045.GA14321@onstation.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1158952219=="
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190901214045.GA14321-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathan-eSc4qw6YbEQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--===============1158952219==
Content-Type: multipart/alternative;
 boundary="------------E9414BE935F490A0BC8CA132"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E9414BE935F490A0BC8CA132
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Tested-by: Gabriel Francisco <frc.gabrielgmail.com>

On 9/1/19 11:40 PM, Brian Masney wrote:
> Hi Rob C / Sean P,
>
> On Fri, Aug 23, 2019 at 05:16:30AM -0700, Brian Masney wrote:
>> This patch series adds support for Qualcomm's On Chip MEMory (OCMEM)
>> that is needed in order to support some a3xx and a4xx-based GPUs
>> upstream. This is based on Rob Clark's patch series that he submitted
>> in October 2015 and I am resubmitting updated patches with his
>> permission. See the individual patches for the changelog.
> I talked to Bjorn in person at the Embedded Linux Conference over a
> week ago about this series. He thinks that this series should go through
> your tree. I assume it's too late for the upcoming merge window, which
> is fine. I just want to make sure that this series gets picked up for
> the following merge window.
>
> I just sent out a fix for a compiler error on MIPS as a separate patch:
> https://lore.kernel.org/lkml/20190901213037.25889-1-masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org/
>
> Brian
>

--------------E9414BE935F490A0BC8CA132
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre class="content"><span class="tested-by">Tested-by: Gabriel Francisco &lt;frc.gabrielgmail.com&gt;</span></pre>
    <div class="moz-cite-prefix">On 9/1/19 11:40 PM, Brian Masney wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:%3C20190901214045.GA14321-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org%3E">
      <pre class="moz-quote-pre" wrap="">Hi Rob C / Sean P,

On Fri, Aug 23, 2019 at 05:16:30AM -0700, Brian Masney wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This patch series adds support for Qualcomm's On Chip MEMory (OCMEM)
that is needed in order to support some a3xx and a4xx-based GPUs
upstream. This is based on Rob Clark's patch series that he submitted
in October 2015 and I am resubmitting updated patches with his
permission. See the individual patches for the changelog.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I talked to Bjorn in person at the Embedded Linux Conference over a
week ago about this series. He thinks that this series should go through
your tree. I assume it's too late for the upcoming merge window, which
is fine. I just want to make sure that this series gets picked up for
the following merge window.

I just sent out a fix for a compiler error on MIPS as a separate patch:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/lkml/20190901213037.25889-1-masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org/">https://lore.kernel.org/lkml/20190901213037.25889-1-masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org/</a>

Brian

</pre>
    </blockquote>
  </body>
</html>

--------------E9414BE935F490A0BC8CA132--

--===============1158952219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5v
IG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

--===============1158952219==--
