From: Aleksandar Markovic <Aleksandar.Markovic-8NJIiSa5LzA@public.gmane.org>
Subject: RE: [PATCH v3 1/2] dt-bindings: Document mti,mips-cpc binding
Date: Fri, 19 Jan 2018 15:07:48 +0000
Message-ID: <BD3A5F1946F2E540A31AF2CE969BAEEE12393C77@MIPSMAIL01.mipstec.com>
References: <1514385475-23921-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1514385475-23921-2-git-send-email-aleksandar.markovic@rt-rk.com>,<20180118222603.GG27409@jhogan-linux.mipstec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180118222603.GG27409-4bYivNCBEGSP4qXr0kR+DFHK5/nzsB32@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <James.Hogan-8NJIiSa5LzA@public.gmane.org>, Aleksandar Markovic <aleksandar.markovic-FblTVreYubkAvxtiuMwx3w@public.gmane.org>
Cc: "linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Paul Burton <Paul.Burton-8NJIiSa5LzA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Douglas Leung <Douglas.Leung-8NJIiSa5LzA@public.gmane.org>, Goran Ferenc <Goran.Ferenc-8NJIiSa5LzA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Miodrag Dinic <Miodrag.Dinic-8NJIiSa5LzA@public.gmane.org>, Petar Jovanovic <Petar.Jovanovic-8NJIiSa5LzA@public.gmane.org>, Raghu Gandham <Raghu.Gandham-8NJIiSa5LzA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> On Wed, Dec 27, 2017 at 03:37:51PM +0100, Aleksandar Markovic wrote:
> > From: Paul Burton <paul.burton-8NJIiSa5LzA@public.gmane.org>
> >
> > Document a binding for the MIPS Cluster Power Controller (CPC) that
> > allows the device tree to specify where the CPC registers are located.
> >
> > Signed-off-by: Paul Burton <paul.burton-8NJIiSa5LzA@public.gmane.org>
> > Signed-off-by: Aleksandar Markovic <aleksandar.markovic-8NJIiSa5LzA@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/power/mti,mips-cpc.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/power/mti,mips-cpc.txt
> >
> > diff --git a/Documentation/devicetree/bindings/power/mti,mips-cpc.txt b/Documentation/devicetree/bindings/power/mti,mips-cpc.txt
> > new file mode 100644
> 
> Is it worth adding to the MIPS GENERIC PLATFORM entry of MAINTAINERS,
> given that it directly benefits it?
> 
> Cheers
> James

If nobody objects, in the v4 of this series, as a part of this particular patch, I am going to add the line:

F:       Documentation/devicetree/bindings/power/mti,mips-cpc.txt

to the following segment in MAINTAINERS file:

MIPS GENERIC PLATFORM
M:      Paul Burton <paul.burton-8NJIiSa5LzA@public.gmane.org>
L:      linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
S:      Supported
F:      arch/mips/generic/
F:      arch/mips/tools/generic-board-config.sh

v4 is planned to be sent by the end of the day.

Thanks,
Aleksandar--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
