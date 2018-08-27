From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v4 00/18] JZ47xx DMA patchset v4
Date: Mon, 27 Aug 2018 10:44:50 +0530
Message-ID: <20180827051450.GS2388@vkoul-mobl>
References: <20180807114218.20091-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180807114218.20091-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 07-08-18, 13:42, Paul Cercueil wrote:
> Hi,
> 
> This is the V4 of my Ingenic JZ47xx DMA patchset.

This does not apply for me. Please rebase on rc1, fix Rob's and my
comment and send

Also I noticed checkpatch gave warns on some style issues (--strict
option) please see if they make sense and fix if it does.

Thanks
-- 
~Vinod
