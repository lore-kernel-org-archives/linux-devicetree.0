From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 08/12] dtc: be more quiet with "make -s"
Date: Sat, 29 Sep 2012 07:27:41 +0000
Message-ID: <201209290727.41798.arnd@arndb.de>
References: <1348868177-21205-1-git-send-email-arnd@arndb.de> <1348868177-21205-9-git-send-email-arnd@arndb.de> <50661CC6.2010007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50661CC6.2010007@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-arm-kernel@lists.infradead.org, Michal Marek <mmarek@suse.cz>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, David Gibson <dwg@au1.ibm.com>, arm@kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 28 September 2012, Stephen Warren wrote:
> On 09/28/2012 03:36 PM, Arnd Bergmann wrote:
> > This patch makes dtc not output the message when the "-q" flag is passed,
> > and ensures that we pass it in both cases.
> 
> Just as an FYI, the upstream dtc no longer prints this message, and I
> just posted a patch to pull that whole upstream dtc into the kernel.

Ok, excellent!

Michal, please ignore my patch then.

	Arnd
