From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] dmaengine: Add support for APM X-Gene SoC DMA engine driver
Date: Mon, 12 Jan 2015 19:55:02 +0100
Message-ID: <1701652.4qUlzcU1j2@wuerfel>
References: <1420628981-22774-1-git-send-email-rsahu@apm.com> <1420628981-22774-2-git-send-email-rsahu@apm.com> <CAFd313xp5rZZZSSKk-DDTC4ccY9ZucGgmWrc9oG-TiK2FMBS1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFd313xp5rZZZSSKk-DDTC4ccY9ZucGgmWrc9oG-TiK2FMBS1g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rameshwar Sahu <rsahu@apm.com>
Cc: vinod.koul@intel.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ddutile@redhat.com, jcm@redhat.com, patches@apm.com, Loc Ho <lho@apm.com>
List-Id: devicetree@vger.kernel.org

On Monday 12 January 2015 14:40:09 Rameshwar Sahu wrote:
> > +
> > +       dma_set_mask_and_coherent(&pdev->dev,
> > +                                 (sizeof(dma_addr_t) == sizeof(u64)) ?
> > +                                 DMA_BIT_MASK(64) : DMA_BIT_MASK(32));
> > +
> 

I commented on this on v1 already: always set the device specific mask here,
it's independent of the CPU architecture, but do check the return value.

Also add the correct dma-ranges property in the parent, or else this will
fail in the future once we add proper checks to dma_set_mask.

	Arnd
