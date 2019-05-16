From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC PATCH V1 1/6] dt-bindings: mt8183: Add binding for DIP
 shared memory
Date: Thu, 16 May 2019 15:12:30 +0900
Message-ID: <CAAFQd5BVWjcxp9Tia9Pmgn_54bc9n5Vs1s__G7YWHiezfVVYpA@mail.gmail.com>
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
 <20190417104511.21514-2-frederic.chen@mediatek.com>
 <20190430011506.GA8514@bogus>
 <1557238925.11663.21.camel@mtksdccf07>
 <CAL_JsqKGW9WqyNgqKD0MxsqxYHKZ+VNV5A2p+neGqwmKmiODOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAL_JsqKGW9WqyNgqKD0MxsqxYHKZ+VNV5A2p+neGqwmKmiODOQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Shik Chen <shik-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Frederic Chen <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= <holmes.chiou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, suleiman-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Jerry-ch Chen <Jerry-ch.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, yuzhao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sj Huang <sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, zwisler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mauro
List-Id: devicetree@vger.kernel.org

On Wed, May 15, 2019 at 1:19 AM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> On Tue, May 7, 2019 at 9:22 AM Frederic Chen <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> >
> > Dear Rob,
> >
> > I appreciate your comments.
> >
> > On Mon, 2019-04-29 at 20:15 -0500, Rob Herring wrote:
> > > On Wed, Apr 17, 2019 at 06:45:06PM +0800, Frederic Chen wrote:
> > > > This patch adds the binding for describing the shared memory
> > > > used to exchange configuration and tuning data between the
> > > > co-processor and Digital Image Processing (DIP) unit of the
> > > > camera ISP system on Mediatek SoCs.
> > > >
> > > > Signed-off-by: Frederic Chen <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > > ---
> > > >  .../mediatek,reserve-memory-dip_smem.txt      | 45 +++++++++++++++++++
> > > >  1 file changed, 45 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > > > new file mode 100644
> > > > index 000000000000..64c001b476b9
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-dip_smem.txt
> > > > @@ -0,0 +1,45 @@
> > > > +Mediatek DIP Shared Memory binding
> > > > +
> > > > +This binding describes the shared memory, which serves the purpose of
> > > > +describing the shared memory region used to exchange data between Digital
> > > > +Image Processing (DIP) and co-processor in Mediatek SoCs.
> > > > +
> > > > +The co-processor doesn't have the iommu so we need to use the physical
> > > > +address to access the shared buffer in the firmware.
> > > > +
> > > > +The Digital Image Processing (DIP) can access memory through mt8183 IOMMU so
> > > > +it can use dma address to access the memory region.
> > > > +(See iommu/mediatek,iommu.txt for the detailed description of Mediatek IOMMU)
> > > > +
> > > > +
> > > > +Required properties:
> > > > +
> > > > +- compatible: must be "mediatek,reserve-memory-dip_smem"
> > >
> > > Don't use '_'.
> >
> > I got it. I will use "mediatek,reserve-memory-dip-smem" instead in next
> > version of the patch
> >
> > >
> > > > +
> > > > +- reg: required for static allocation (see reserved-memory.txt for
> > > > +  the detailed usage)
> > > > +
> > > > +- alloc-range: required for dynamic allocation. The range must
> > > > +  between 0x00000400 and 0x100000000 due to the co-processer's
> > > > +  addressing limitation
> > >
> > > Generally, you should pick either static or dynamic allocation for a
> > > given binding. Static if there's some address restriction or sharing,
> > > dynamic if not.
> > >
> > > Sounds like static in this case.
> > >
> >
> > DIP reserved memory has address restriction so it is the static case. I
> > would like to remove the dynamic allocation part and modify the
> > description as following:
> >
> > - reg: required for DIP. The range must be between 0x00000400 and
> >   0x100000000 due to the co-processor's addressing limitation.
> >   The size must be 26MB. Please see reserved-memory.txt for the
> >   detailed usage.
>
> You can use dma-ranges to define addressing translations and
> restrictions like this. That will in turn set the device's dma-mask to
> ensure allocations are done in a region that is addressable.
>
> But if you have a known, fixed size, then a carve out with
> reserved-memory is fine.

There is also another aspect here. The coprocessor that we're
allocating the memory for is behind an MPU that must be programmed
completely in one go and locked for security reasons to ensure that
the coprocessor itself doesn't rewrite the MPU settings. That means
that we need to have all the allocations completed before booting that
coprocessor.

To be honest, I'd adopt a completely different design here.

We're going to have a driver for that coprocessor (SCP) and IMHO any
shared memory areas should belong to it. Then, any specific drivers
talking to the firmware running on SCP should ask the SCP driver to
allocate some memory from its fixed pool. WDYT?

Best regards,
Tomasz
