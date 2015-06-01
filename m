From: Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Subject: Re: [PATCH v4 0/2] Remaining sunxi musb patches
Date: Mon, 1 Jun 2015 11:30:45 -0700 (PDT)
Message-ID: <79fc4306-a621-43b8-b347-e42a27beb134@googlegroups.com>
References: <1433088626-8858-1-git-send-email-hdegoede@redhat.com>
Reply-To: jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_3260_1458521206.1433183445027"
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBVOJWKVQKGQED67HFXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1433088626-8858-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: balbi-l0cyMroinI0@public.gmane.org, rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_3260_1458521206.1433183445027
Content-Type: multipart/alternative;
	boundary="----=_Part_3261_1987562384.1433183445027"

------=_Part_3261_1987562384.1433183445027
Content-Type: text/plain; charset=UTF-8

Hi,

On Sunday, May 31, 2015 at 6:10:32 PM UTC+2, Hans de Goede wrote:
>
> Hi Kishon & Felipe, 
>
> Here is an updated version of the remaining (not yet merged in Felipe's 
> tree) 
> sunxi musb patches. 
>
> The "phy-sun4i-usb: Add full support for usb0 phy / OTG" patch has been 
> updated with a small bug-fix and is ready for merging. 
>
> The "musb: Add support for the Allwinner sunxi musb" patch has been 
> updated 
> to use the latest version of Maxime's sunxi sram controller driver. This 
> one has a compile-time dependency on Maxime's sunxi sram controller 
> driver, 
> so it cannot be merged until that is merged. 
>


Arnd has just merged the updated sram controller into the next branch
of the soc-drivers repo, so both these patches are now ready to merge.

Regards,

Hans

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_3261_1987562384.1433183445027
Content-Type: text/html; charset=UTF-8

<div dir="ltr">Hi,<br><br>On Sunday, May 31, 2015 at 6:10:32 PM UTC+2, Hans de Goede wrote:<blockquote class="gmail_quote" style="margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Hi Kishon &amp; Felipe,
<br>
<br>Here is an updated version of the remaining (not yet merged in Felipe's tree)
<br>sunxi musb patches.
<br>
<br>The "phy-sun4i-usb: Add full support for usb0 phy / OTG" patch has been
<br>updated with a small bug-fix and is ready for merging.
<br>
<br>The "musb: Add support for the Allwinner sunxi musb" patch has been updated
<br>to use the latest version of Maxime's sunxi sram controller driver. This
<br>one has a compile-time dependency on Maxime's sunxi sram controller driver,
<br>so it cannot be merged until that is merged.
<br></blockquote><div><br><br>Arnd has just merged the updated sram controller into the next branch<br>of the soc-drivers repo, so both these patches are now ready to merge.<br><br>Regards,<br><br>Hans<br><br> </div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an email to <a href="mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href="https://groups.google.com/d/optout">https://groups.google.com/d/optout</a>.<br />

------=_Part_3261_1987562384.1433183445027--

------=_Part_3260_1458521206.1433183445027--
