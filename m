From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [Patch v3 2/2] dmaengine: qcom_bam_dma: Add device tree binding
Date: Tue, 28 Jan 2014 13:01:54 +0000
Message-ID: <20140128130153.GI15937@n2100.arm.linux.org.uk>
References: <1390890471-14882-1-git-send-email-agross@codeaurora.org> <20140128111756.GE15937@n2100.arm.linux.org.uk> <20140128113242.GJ10628@intel.com> <4916428.f0GtxdkWKj@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4916428.f0GtxdkWKj@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vinod Koul <vinod.koul@intel.com>, Lars-Peter Clausen <lars@metafoo.de>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <agross@codeaurora.org>, dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 28, 2014 at 01:05:10PM +0100, Arnd Bergmann wrote:
> Ok, thanks for clearing up my mistake. However, the argument remains:
> the direction doesn't need to be in the DT DMA descriptor since it
> gets set by software anyway.

Yes - for full-duplex, it's implied, since you have one DMA request
(and therefore virtual channel) for memory-to-device and another for
device-to-memory.

-- 
FTTC broadband for 0.8mile line: 5.8Mbps down 500kbps up.  Estimation
in database were 13.1 to 19Mbit for a good line, about 7.5+ for a bad.
Estimate before purchase was "up to 13.2Mbit".
