From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 09/10] watchdog: xilinx: Add missing binding
Date: Wed, 5 Feb 2014 15:00:02 +0100
Message-ID: <201402051500.02408.arnd@arndb.de>
References: <ed4cb31c9a549343e6b492cf62fc962d39034bd0.1391177880.git.michal.simek@xilinx.com>
 <201402051036.19428.arnd@arndb.de> <52F20732.6070209@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <52F20732.6070209@monstr.eu>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: monstr@monstr.eu
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, linux-doc@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 05 February 2014, Michal Simek wrote:
> On 02/05/2014 10:36 AM, Arnd Bergmann wrote:
> > On Wednesday 05 February 2014, Michal Simek wrote:
> > Still, the choice of putting the timeout into DT in terms of
> > cycles rather than miliseconds wasn't ideal from an interface
> > perspective and we should change that if/when we do a generic
> > binding. I can definitely see where it's coming from for your
> > case, as the cycle count totally makes sense from an FPGA
> > tool perspective...
> 
> Thanks. I take this like ACK for this current binding description.
> 

Yes, please add my 'Acked-by'.

	Arnd
