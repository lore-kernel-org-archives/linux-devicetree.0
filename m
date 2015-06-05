From: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v7 2/3] ARM: bcm2835: Add the Raspberry Pi firmware driver
Date: Fri, 5 Jun 2015 20:21:35 +0100
Message-ID: <20150605192135.GA3301@x1>
References: <1433448707-18104-1-git-send-email-eric@anholt.net>
 <1433448707-18104-2-git-send-email-eric@anholt.net>
 <55711428.4080506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55711428.4080506@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Eric Anholt <eric@anholt.net>, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 04 Jun 2015, Stephen Warren wrote:

> On 06/04/2015 02:11 PM, Eric Anholt wrote:
> > This gives us a function for making mailbox property channel requests
> > of the firmware, which is most notable in that it will let us get and
> > set clock rates.
> 
> Acked-by: Stephen Warren <swarren@wwwdotorg.org>

Does anyone know how drivers/firmware/ is managed?  I don't seem to be
able to find a maintainer/supporter listed in MAINTAINERS.
