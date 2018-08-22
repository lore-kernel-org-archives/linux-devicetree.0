From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v4 3/4] edac: synopsys: Add EDAC ECC support for ZynqMP
 DDRC
Date: Wed, 22 Aug 2018 15:34:57 +0200
Message-ID: <20180822133457.GA6462@nazgul.tnic>
References: <1533374735-16662-1-git-send-email-manish.narani@xilinx.com>
 <1533374735-16662-4-git-send-email-manish.narani@xilinx.com>
 <20180821130946.GD30528@nazgul.tnic>
 <DM6PR02MB522788F1286F18FBC6458E0EC1300@DM6PR02MB5227.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DM6PR02MB522788F1286F18FBC6458E0EC1300@DM6PR02MB5227.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Manish Narani <MNARANI@xilinx.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Michal Simek <michals@xilinx.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mdf@kernel.org" <mdf@kernel.org>, Edgar Iglesias <edgari@xilinx.com>, Shubhrajyoti Datta <shubhraj@xilinx.com>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Bharat Kumar Gogada <bharatku@xilinx.com>, "stefan.krsmanovic@aggios.com" <stefan.krsmanovic@aggios.com>, Srinivas Goud <sgoud@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 22, 2018 at 01:02:40PM +0000, Manish Narani wrote:
>  I could remove 'synps_enh' from the prefix and keep 'zynq' and
> 'zynqmp' to differentiate. Please suggest.

Makes sense and it is shorter, sure.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
