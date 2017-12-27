From: Aleksandar Markovic <Aleksandar.Markovic@mips.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: Document mti,mips-cpc binding
Date: Wed, 27 Dec 2017 13:56:12 +0000
Message-ID: <BD3A5F1946F2E540A31AF2CE969BAEEEC28299@MIPSMAIL01.mipstec.com>
References: <1513869627-15391-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1513869627-15391-2-git-send-email-aleksandar.markovic@rt-rk.com>,<20171226214810.su23px4ue7q5t3xg@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171226214810.su23px4ue7q5t3xg@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Paul Burton <Paul.Burton@mips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Douglas Leung <Douglas.Leung@mips.com>, Goran Ferenc <Goran.Ferenc@mips.com>, James Hogan <James.Hogan@mips.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miodrag Dinic <Miodrag.Dinic@mips.com>, Petar Jovanovic <Petar.Jovanovic@mips.com>, Raghu Gandham <Raghu.Gandham@mips.com>
List-Id: devicetree@vger.kernel.org

Hi, Rob.

Thanks for the review.

> From: Rob Herring [robh@kernel.org]
> Sent: Tuesday, December 26, 2017 10:48 PM
> To: Aleksandar Markovic
> > On Thu, Dec 21, 2017 at 04:20:23PM +0100, Aleksandar Markovic wrote:
> > From: Paul Burton <paul.burton@mips.com>
> >
> > Document a binding for the MIPS Cluster Power Controller (CPC) which
> > simply allows the device tree to specify where the CPC registers are
> > located.
> >
> > Signed-off-by: Paul Burton <paul.burton@mips.com>
> > Signed-off-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
> > ---
> >  Documentation/devicetree/bindings/misc/mti,mips-cpc.txt | 8 ++++++++
> 
> power controllers are usually documented under bindings/power/

I am going to change the file location to Documentation/devicetree/bindings/power
in v3, unless someone objects.

Regards,
Aleksandar
