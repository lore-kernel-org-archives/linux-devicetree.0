From: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Subject: Re: Forcing PIO mode instead of DMA via DT property
Date: Tue, 24 Jul 2012 16:35:32 +0200
Message-ID: <20120724143533.080F5200247@gemini.denx.de>
References: <201207222328.27008.marex@denx.de>
 <201207241319.45101.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <201207241319.45101.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, pavel-ynQEQJNshbs@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Arnd,

In message <201207241319.45101.arnd-r2nGTMty4D4@public.gmane.org> you wrote:
>
> > I'm trying to implement a driver that can do both DMA and PIO, and it would be 
> > nice if the user was able to select the mode (on a per-bus basis) using the DT. 
> > The PIO mode can reduce the overhead in some cases and therefore be better 
> > choice than the DMA (for example when most transfers move only very few data, or 
> > when board-specific hardware properties kick in).
> > 
> > I was thinking about using some "manf,use-pio" DT property, but I haven't found 
> > any such example yet, so I wonder if this is a good idea.
> > 
> 
> What kind of device is this? We are currently working on the dmaengine
> binding, so an easy way to do this would be (one that binding is complete)
> to either provide or not provide the channel description depending on
> what you want to do with the device. This is clearly a hack but might
> fit your use case without adding any ugly code to the kernel.
> 
> Another option would be to make it a runtime configuration option,
> e.g. through sysfs, but that again depends a lot on what device you
> are talking about.

At least in my example of the x86 system a sysfs interface would not
help, as the kernel would crash during bootup before I can run user
space code.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org
Mirrors should reflect a little before throwing back images.
- Jean Cocteau
