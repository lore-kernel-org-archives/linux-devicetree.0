From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 08/12] dtb: amd: Add PERF CCN-504 device tree node
Date: Tue, 09 Feb 2016 15:58:03 +0100
Message-ID: <3090961.S0JY5ma2pB@wuerfel>
References: <1454954357-8395-1-git-send-email-Suravee.Suthikulpanit@amd.com> <1454954357-8395-9-git-send-email-Suravee.Suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454954357-8395-9-git-send-email-Suravee.Suthikulpanit@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org, brijeshkumar.singh@amd.com, thomas.lendacky@amd.com, leo.duran@amd.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: devicetree@vger.kernel.org

On Monday 08 February 2016 11:59:13 Suravee Suthikulpanit wrote:
> +               /* Perf CCN504 PMU */
> +               ccn: ccn@0xe8000000 {
> 

The address is wrong, please remove the '0x'.

	Arnd
