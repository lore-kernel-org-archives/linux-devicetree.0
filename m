From: Emil Medve <Emilian.Medve@Freescale.com>
Subject: Re: [PATCH 1/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan
Date: Wed, 29 Oct 2014 16:40:27 -0500
Message-ID: <54515ECB.70404@Freescale.com>
References: <1413986972-621-1-git-send-email-Emilian.Medve@Freescale.com>
 <EA33D307-CCDA-4A30-9386-46FA832FE0CA@codeaurora.org>
 <1414519738.23458.84.camel__4795.38602890006$1414521743$gmane$org@snotra.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1414519738.23458.84.camel__4795.38602890006$1414521743$gmane$org@snotra.buserror.net>
Sender: linux-doc-owner@vger.kernel.org
To: Scott Wood <scottwood@Freescale.com>, Kumar Gala <galak@codeaurora.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Geoff.Thorpe@Freescale.com, corbet@lwn.net, linux-doc@vger.kernel.org, linuxppc-dev@ozlabs.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

Hello Scott,


On 10/28/2014 01:08 PM, Scott Wood wrote:
> On Tue, 2014-10-28 at 09:36 -0500, Kumar Gala wrote:
>> On Oct 22, 2014, at 9:09 AM, Emil Medve <Emilian.Medve@freescale.com=
> wrote:
>>
>>> The Buffer Manager is part of the Data-Path Acceleration Architectu=
re (DPAA).
>>> BMan supports hardware allocation and deallocation of buffers belon=
ging to
>>> pools originally created by software with configurable depletion th=
resholds.
>>> This binding covers the CCSR space programming model
>>>
>>> Signed-off-by: Emil Medve <Emilian.Medve@Freescale.com>
>>> Change-Id: I3ec479bfb3c91951e96902f091f5d7d2adbef3b2
>>> ---
>>> .../devicetree/bindings/powerpc/fsl/bman.txt       | 98 +++++++++++=
+++++++++++
>>> 1 file changed, 98 insertions(+)
>>> create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/bm=
an.txt
>>
>> Should these really be in bindings/powerpc/fsl, aren=E2=80=99t you g=
uys using this on ARM SoCs as well?
>=20
> The hardware on the ARM SoCs is different enough that I'm not sure th=
e
> same binding will cover it.  That said, putting things under <arch>
> should be a last resort if nowhere else fits.

OTC started ported the driver to the the ARM SoC and the feedback has
been that the driver needed minimal changes. The IOMMU has been the onl=
y
area of concern, and a small change to the binding has been suggested


Cheers,
