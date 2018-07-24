From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v3 00/18] JZ4780 DMA patchset v3
Date: Tue, 24 Jul 2018 18:41:21 +0530
Message-ID: <20180724131121.GE3661@vkoul-mobl>
References: <20180721110643.19624-1-paul@crapouillou.net>
 <20180723175846.udmjtkx7fsaf52wa@pburton-laptop>
 <1532430574.2610.0@smtp.crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532430574.2610.0@smtp.crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Paul Burton <paul.burton@mips.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 24-07-18, 13:09, Paul Cercueil wrote:
> Hi,
> 
> Le lun. 23 juil. 2018 à 19:58, Paul Burton <paul.burton@mips.com> a écrit :
> > Hi Paul & Vinod,
> > 
> > On Sat, Jul 21, 2018 at 01:06:25PM +0200, Paul Cercueil wrote:
> > >  This is the version 3 of my jz4780-dma driver update patchset.
> > > 
> > >  Apologies to the DMA people, the v2 of this patchset did not make
> > > it to
> > >  their mailing-list; see the bottom of this email for a description
> > > of
> > >  what happened in v2.
> > > 
> > >  Changelog from v2 to v3:
> > > 
> > >  - Modified the devicetree bindings to comply with the specification
> > > 
> > >  - New patch [06/18] allows the JZ4780 DMA driver to be compiled
> > > within a
> > >    generic MIPS kernel.
> > 
> > Would you prefer to take the MIPS .dts changes in patches 16-18 through
> > the DMA tree with the rest of the series?
> 
> I think it would make sense yes.

okay will do so when the series is merged

-- 
~Vinod
