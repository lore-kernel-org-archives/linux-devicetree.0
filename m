From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH v3 01/25] irq_domain: add documentation and MAINTAINERS
 entry.
Date: Sat, 28 Jan 2012 10:23:40 -0800
Message-ID: <4F243D2C.7040709@xenotime.net>
References: <1327700179-17454-1-git-send-email-grant.likely@secretlab.ca>
 <1327700179-17454-2-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1327700179-17454-2-git-send-email-grant.likely@secretlab.ca>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Milton Miller <miltonm@bga.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01/27/2012 01:35 PM, Grant Likely wrote:
> Documentation for irq_domain library which will be created in subsequent
> patches.

I posted a lot of comments to v2 on Jan. 24.
Looks like they were ignored.

Please see  http://marc.info/?l=linuxppc-embedded&m=132742951211808&w=2


> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Milton Miller <miltonm@bga.com>
> ---
>  Documentation/IRQ-domain.txt |  113 ++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                  |    9 +++
>  2 files changed, 122 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/IRQ-domain.txt


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
