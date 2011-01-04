From: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Subject: Re: [RFC][PATCH] add FDT address translation
Date: Tue, 04 Jan 2011 22:47:57 +0100
Message-ID: <4D23958D.6000206@home.nl>
References: <4D1BC658.4040608@home.nl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8408878163775124275=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D1BC658.4040608-CmkmPbn3yAE@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--===============8408878163775124275==
Content-Type: multipart/alternative;
 boundary="------------030703070302090603070109"

This is a multi-part message in MIME format.
--------------030703070302090603070109
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Nobody interested in this stuff?

I'm working on devicetree support for the NiosII processor and there 
bridges are quite commonly used so this is a must to get early printk 
going without dirty hacks. I thought at least Microblaze would need this 
as well as that's also a synthesizable core but maybe I'm mistaking.

On 12/30/10 12:38 AM, Walter Goossens wrote:
> This patch adds address translations to fdt. Needed when the early 
> console is connected to a simple-bus that has address translation 
> enabled.
>
> To be honest, I'm not too happy about this solution but it works and 
> most code is stolen from other parts of the fdt code, so I'm probably 
> not doing too weird stuff :)
> What do you guys think of this?
>
> Greetz Walter
>
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss


--------------030703070302090603070109
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#ffffff" text="#000000">
    Nobody interested in this stuff?<br>
    <br>
    I'm working on devicetree support for the NiosII processor and there
    bridges are quite commonly used so this is a must to get early
    printk going without dirty hacks. I thought at least Microblaze
    would need this as well as that's also a synthesizable core but
    maybe I'm mistaking.<br>
    <br>
    On 12/30/10 12:38 AM, Walter Goossens wrote:
    <blockquote cite="mid:4D1BC658.4040608-CmkmPbn3yAE@public.gmane.org" type="cite">This
      patch adds address translations to fdt. Needed when the early
      console is connected to a simple-bus that has address translation
      enabled.
      <br>
      <br>
      To be honest, I'm not too happy about this solution but it works
      and most code is stolen from other parts of the fdt code, so I'm
      probably not doing too weird stuff :)
      <br>
      What do you guys think of this?
      <br>
      <br>
      Greetz Walter
      <br>
      <pre wrap="">
<fieldset class="mimeAttachmentHeader"></fieldset>
_______________________________________________
devicetree-discuss mailing list
<a class="moz-txt-link-abbreviated" href="mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org">devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="https://lists.ozlabs.org/listinfo/devicetree-discuss">https://lists.ozlabs.org/listinfo/devicetree-discuss</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------030703070302090603070109--

--===============8408878163775124275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8408878163775124275==--
