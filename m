From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 2/4] meson-rtc: add device-tree binding
Date: Wed, 13 Jul 2016 12:25:26 +0100
Message-ID: <20160713112525.GI14522@leverpostej>
References: <1467748122-14833-1-git-send-email-ben.dooks@codethink.co.uk>
 <1467748122-14833-4-git-send-email-ben.dooks@codethink.co.uk>
 <5785D83C.2000809@gmail.com>
 <51411c13-8cb4-3623-f70e-03b4190655f2@codethink.co.uk>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDRMFBMIXEGBBMWKTC6AKGQE4GNYFMA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <51411c13-8cb4-3623-f70e-03b4190655f2-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 13, 2016 at 10:09:44AM +0100, Ben Dooks wrote:
> On 13/07/16 06:57, Frank Rowand wrote:
> > On 07/05/16 12:48, Ben Dooks wrote:
> >> Add documentation for the AMLogic Meson RTC.
> >>
> >> Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> >> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> ---
> >>  .../devicetree/bindings/rtc/rtc-amlogic.txt         | 21 +++++++++++++++++++++
> >>  1 file changed, 21 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-amlogic.txt
> > 
> > Hi Ben,
> > 
> > I suspect you already know this since you have Rob's ack, but you need to
> > send bindings to
> > 
> >   Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >   Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> 
> Sorry, missed copying the email when sending.
> 
> I hope he's seen them from being on the devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> list? I've added him as an CC: on this one to check.

>From my perspective, having devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org alone is fine. I
appreciate tastes vary across maintainers, either way is fine by me. :)

You already have Rob's ack, which is sufficient, but FWIW the patch
looks fine, so feel free to add mine:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Thanks,
Mark.

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
