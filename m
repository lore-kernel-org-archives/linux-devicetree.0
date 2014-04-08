From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 3/3] edac: altera: Add SDRAM EDAC support for
 CycloneV/ArriaV
Date: Tue, 8 Apr 2014 17:24:06 +0200
Message-ID: <20140408152406.GI30077@pd.tnic>
References: <1396907649-20212-1-git-send-email-tthayer@altera.com>
 <1396907649-20212-4-git-send-email-tthayer@altera.com>
 <20140408100851.GF30077@pd.tnic>
 <1396965459.23349.4.camel@dinh-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1396965459.23349.4.camel@dinh-ubuntu>
Sender: linux-kernel-owner@vger.kernel.org
To: Thor Thayer <tthayer@altera.com>
Cc: robherring2@gmail.com, dougthompson@xmission.com, grant.likely@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, dinguyen@altera.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 08, 2014 at 08:57:39AM -0500, Thor Thayer wrote:
> Yes, Altera has a group specifically supporting Linux drivers on the
> Altera SoCs.

Then please add MAINTAINERS file entry for this EDAC driver so that
people can send issues/reports to that group.

> I was told that the device tree additions should be separate patches
> in a series since the device tree additions go to a separate group for
> approval.

Well, the EDAC driver depends on the devicetree stuff, right? If so,
they should go together.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
