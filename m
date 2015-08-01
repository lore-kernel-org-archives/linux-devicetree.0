From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] dmaengine: xgene-dma: Add ACPI support for X-Gene DMA engine driver
Date: Sat, 01 Aug 2015 23:28:19 +0200
Message-ID: <2216844.XmXxxWVjii@wuerfel>
References: <1437484479-2822-1-git-send-email-rsahu@apm.com> <2384915.JHlOHWBXHy@wuerfel> <CAFd313xntHx7JhfTWSsJo+bTm-DuEcbAzqXt9in1s0irL3g7sw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFd313xntHx7JhfTWSsJo+bTm-DuEcbAzqXt9in1s0irL3g7sw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rameshwar Sahu <rsahu@apm.com>
Cc: Vinod Koul <vinod.koul@intel.com>, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jcm@redhat.com, patches@apm.com
List-Id: devicetree@vger.kernel.org

On Thursday 30 July 2015 14:21:07 Rameshwar Sahu wrote:
> Hi Arnd,
> 
> On Wed, Jul 29, 2015 at 8:04 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tuesday 21 July 2015 18:44:39 Rameshwar Prasad Sahu wrote:
> >> This patch adds ACPI support for the APM X-Gene DMA engine driver.
> >>
> >> Signed-off-by: Rameshwar Prasad Sahu <rsahu@apm.com>
> >>
> >
> > How does a slave driver refer to a channel in case of ACPI?
> 
> We don't support slave dma here. This driver supports only memcp, xor,
> pq, scatter-gather offloading, so,
> client driver can use linux dmaengine APIs like dma_request_channel()
> etc to request channel.

Ok, makes sense. Thanks!

	Arnd
