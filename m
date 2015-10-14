From: bayi.cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 3/3] arm64: dts: mt8173: Add nor flash node
Date: Wed, 14 Oct 2015 21:59:29 +0800
Message-ID: <1444831169.4832.3.camel@mhfsdcap03>
References: <1444729160-26433-1-git-send-email-bayi.cheng@mediatek.com>
 <1444729160-26433-4-git-send-email-bayi.cheng@mediatek.com>
 <561D1642.3070105@cogentembedded.com>
 <CAGS+omDm=74d6cw7kXwkZ_Jy-faBz7z4-vJQX9ZFVNskQqSS-w@mail.gmail.com>
 <561E36ED.7090103@cogentembedded.com>
 <CAGS+omDQQ8UDM2pOtU-koz9tfag4SG3Sgf_LrtzsUxeutrTThA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAGS+omDQQ8UDM2pOtU-koz9tfag4SG3Sgf_LrtzsUxeutrTThA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-10-14 at 19:26 +0800, Daniel Kurtz wrote:
> Sergei,
> 
> On Wed, Oct 14, 2015 at 7:05 PM, Sergei Shtylyov
> <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> > Hello.
> >
> > On 10/14/2015 4:07 AM, Daniel Kurtz wrote:
> >
> >>>> Add Mediatek nor flash node
> >>>>
> >>>> Signed-off-by: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >>>> ---
> >>>>    arch/arm64/boot/dts/mediatek/mt8173.dtsi | 15 +++++++++++++++
> >>>>    1 file changed, 15 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> >>>> b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> >>>> index d18ee42..385c2e4 100644
> >>>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> >>>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> >>>> @@ -365,6 +365,21 @@
> >>>>                          status = "disabled";
> >>>>                  };
> >>>>
> >>>> +               nor_flash: spi@1100d000 {
> >>>
> >>>
> >>>     I don't think this is a good label name for a SPI controller.
> >>
> >>
> >> You think "spi" is not a good name for SPI controller?
> >> Or you mean the label "nor_flash"?
> >
> >
> >    I think I said clearly: "label". :-)
> >
> >> Would you prefer:
> >>
> >>    spi_nor_flash: spi@1100d000
> >
> >
> >    I'd prefer the "_nor_flash" part to be dropped, to be used for the real
> > flash device (if needed) which is a sub-node of this node.
> 
> The dedicated nor_flash spi bus cannot just be labeled 'spi', as that
> would conflict with the general purpose 'spi' bus.  Instead, it is
> given a unique label that can be used as a phandle elsewhere (e.g., in
> a board file, to enable the bus).  The name "spi_nor_flash" makes it
> clear that this spi bus is only for use for accessing the nor_flash.
> 
> Bayi: Actually, this reminds me.  I'd prefer if the bus node was
> disabled by default, and only enabled by boards as required.  So, the
> node should include:
>    status = "disabled";
> 
> -Dan

Hi, Dan & Sergei, Thanks for your advice, and I will add "status =
"disable"" to the node in the next patch.Thanks~

Bayi
