From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v2 1/2] EDAC: add EDAC driver for DMC520
Date: Mon, 25 Mar 2019 23:01:29 +0100
Message-ID: <20190325220129.GV12016@zn.tnic>
References: <BN7PR08MB5572D3A5217C4749AC4E7DC4AE4C0@BN7PR08MB5572.namprd08.prod.outlook.com>
 <20190323092342.GD23698@zn.tnic>
 <c1a16ab4-72d9-f736-065c-b80858f85b7b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c1a16ab4-72d9-f736-065c-b80858f85b7b@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Morse <james.morse@arm.com>
Cc: Rui Zhao <ruizhao@outlook.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "okaya@kernel.org" <okaya@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "will.deacon@arm.com" <will.deacon@arm.com>, "sashal@kernel.org" <sashal@kernel.org>, "hangl@microsoft.com" <hangl@microsoft.com>, "lewan@microsoft.com" <lewan@microsoft.com>, Rui Zhao <ruizhao@microsoft.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 25, 2019 at 06:27:52PM +0000, James Morse wrote:
> or even:
> | compatible = "microsoft,product-name-dmc520", "arm,dmc-520";
> if there is some firmware/board configuration that means vendor/soc isn't precise enough.

Yap, makes sense to me. If dmc-520 is a memory controller IP, then it
should be a generic, library-like compilation unit which the platform
driver, i.e., <microsoft-platform-name>_edac.c or so links with.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
