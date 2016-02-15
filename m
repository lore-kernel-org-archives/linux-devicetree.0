From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH 1/1] MIPS: DTS: cavium-octeon: provide model attribute
Date: Mon, 15 Feb 2016 20:38:39 +0200
Message-ID: <20160215183838.GD1640@darkstar.musicnaut.iki.fi>
References: <1455513977-934-1-git-send-email-xypron.glpk@gmx.de>
 <56C1B3A0.4090301@cogentembedded.com>
 <56C21054.4070702@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56C21054.4070702@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Feb 15, 2016 at 06:52:20PM +0100, Heinrich Schuchardt wrote:
> On 02/15/2016 12:16 PM, Sergei Shtylyov wrote:
> > On 2/15/2016 8:26 AM, Heinrich Schuchardt wrote:
> >> Downstream packages like Debian flash-kernel rely on
> >> /proc/device-tree/model
> >> to determine how to install an updated kernel image.
> 
> Would you support a patch having the following strings?
> 
> model = "CAVM, Octeon 3860";
> model = "CAVM, Octeon 6880";

The built-in DTBs are shared by multiple completely different boards
(from multiple different manufacturers). How would those strings help
for cases like flash-kernel?

A.
