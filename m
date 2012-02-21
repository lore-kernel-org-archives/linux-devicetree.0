From: Mark Salter <msalter@redhat.com>
Subject: Re: [PATCH v5 20/27] irq_domain/c6x: constify irq_domain structures
Date: Tue, 21 Feb 2012 10:47:55 -0500
Message-ID: <1329839277.17322.4.camel@deneb.redhat.com>
References: <1329383368-12122-1-git-send-email-grant.likely@secretlab.ca>
	 <1329383368-12122-21-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1329383368-12122-21-git-send-email-grant.likely@secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Milton Miller <miltonm@bga.com>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2012-02-16 at 02:09 -0700, Grant Likely wrote:
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> Cc: Mark Salter <msalter@redhat.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> ---
>  arch/arm/common/gic.c            |    2 +-
>  arch/c6x/kernel/irq.c            |    2 +-
>  arch/c6x/platforms/megamod-pic.c |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

For c6x part:

Acked-by: Mark Salter <msalter@redhat.com>
