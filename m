From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2 1/2] arm64: dts: apm: Use lowercase consistently for
 hex constants
Date: Thu, 16 Jun 2016 17:28:29 -0500
Message-ID: <20160616222829.GA25357@rob-hp-laptop>
References: <20160614125756.22169.50783.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <20160614130020.22169.51495.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160614130020.22169.51495.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Duc Dang <dhdang@apm.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 14, 2016 at 08:00:20AM -0500, Bjorn Helgaas wrote:
> The convention in these files is to use lowercase for "0x" prefixes and for
> the hex constants themselves, but a few changes didn't follow that
> convention, which makes the file annoying to read.
> 
> Use lowercase consistently for the hex constants.  No functional change
> intended.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  .../devicetree/bindings/net/apm-xgene-enet.txt     |    4 +-
>  arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |   40 ++++++++++----------
>  arch/arm64/boot/dts/apm/apm-storm.dtsi             |   36 +++++++++---------
>  3 files changed, 40 insertions(+), 40 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
