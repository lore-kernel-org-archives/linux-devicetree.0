From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] dmaengine: xgene-dma: Add ACPI support for X-Gene DMA engine driver
Date: Wed, 29 Jul 2015 16:34:21 +0200
Message-ID: <2384915.JHlOHWBXHy@wuerfel>
References: <1437484479-2822-1-git-send-email-rsahu@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437484479-2822-1-git-send-email-rsahu@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rameshwar Prasad Sahu <rsahu@apm.com>
Cc: vinod.koul@intel.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jcm@redhat.com, patches@apm.com
List-Id: devicetree@vger.kernel.org

On Tuesday 21 July 2015 18:44:39 Rameshwar Prasad Sahu wrote:
> This patch adds ACPI support for the APM X-Gene DMA engine driver.
> 
> Signed-off-by: Rameshwar Prasad Sahu <rsahu@apm.com>
> 

How does a slave driver refer to a channel in case of ACPI?

	Arnd
