From: Borislav Petkov <bp@alien8.de>
Subject: Re: [Patch v4 9/9] arm64: Update device tree for Layerscape SoCs
Date: Mon, 29 Aug 2016 10:05:30 +0200
Message-ID: <20160829080530.GA25468@nazgul.tnic>
References: <1470780000-16750-1-git-send-email-york.sun@nxp.com>
 <20160812091354.GB333@nazgul.tnic>
 <20160829063448.GA32489@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160829063448.GA32489@tiger>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: York Sun <york.sun@nxp.com>, Mark Rutland <mark.rutland@arm.com>, yangbo lu <yangbo.lu@freescale.com>, Liu Gang <Gang.Liu@nxp.com>, morbidrsa@gmail.com, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Bhupesh Sharma <bhupesh.sharma@freescale.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, stuart.yoder@nxp.com, linux-kernel@vger.kernel.org, oss@buserror.net, Rob Herring <robh+dt@kernel.org>, Rajesh Bhagat <rajesh.bhagat@freescale.com>, Olof Johansson <olof@lixom.net>, Mingkai Hu <Mingkai.Hu@freescale.com>, Li Yang <leoli@freescale.com>, Yuan Yao <yao.yuan@nxp.com>, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 29, 2016 at 02:34:48PM +0800, Shawn Guo wrote:
> Is it mandatory to have DTS changes go with driver part altogether?

Yes, because the EDAC driver needs them to even load properly.

> Otherwise, I prefer to have them go through separate tree.

Any particular reason why you prefer that?

We've been doing this for other ARM EDAC drivers already and there were
no issues whatsoever.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
