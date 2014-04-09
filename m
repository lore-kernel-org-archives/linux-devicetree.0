From: Borislav Petkov <bp@alien8.de>
Subject: Re: [RFC PATCH v2] edac: synopsys: Added EDAC support for zynq ddr
 ecc controller
Date: Wed, 9 Apr 2014 19:48:59 +0200
Message-ID: <20140409174859.GP6529@pd.tnic>
References: <1220b715-6fc2-42ed-8393-b9859fc0deb9@TX2EHSMHS021.ehs.local>
 <20140408204047.GQ30077@pd.tnic>
 <CAGnW=BYJxEkhAitCGi-i6+260-i-+GPrg0yPcY=M+7YmDF6ZRw@mail.gmail.com>
 <20140409110339.GF6529@pd.tnic>
 <CAGnW=BYay7fDeqgUDM4L8WqjEm66f5HVjht+RtbL+SPGOR1Xag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGnW=BYay7fDeqgUDM4L8WqjEm66f5HVjht+RtbL+SPGOR1Xag@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: punnaiah choudary kalluri <punnaia@xilinx.com>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, dougthompson@xmission.com, linux-edac@vger.kernel.org, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, sorenb@xilinx.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Punnaiah Choudary <kpc528@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 09, 2014 at 11:15:00PM +0530, punnaiah choudary kalluri wrote:
> OK. I just checked at highbank_mc_edac and other drivers found
> no documentation for static functions. So, is it ok if i remove
> documentation completely for these static functions?

Yes. Didn't I already suggested that, like, twice already?

Just drop them.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
