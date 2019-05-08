From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: RE: [PATCH] ARC: [plat-hsdk]: Add missing multicast filter bins
 number to GMAC node
Date: Wed, 8 May 2019 10:46:36 +0000
Message-ID: <CY4PR1201MB01206801C1C2B8272ABE9B17A1320@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <7f36bbadc0df4c93c396690dab59f34775de3874.1556788240.git.joabreu@synopsys.com>
 <56933076-879c-78a0-4bae-2613203b93b1@synopsys.com>
 <1557166759.17021.9.camel@synopsys.com>
 <78EB27739596EE489E55E81C33FEC33A0B478870@DE02WEMBXB.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <78EB27739596EE489E55E81C33FEC33A0B478870@DE02WEMBXB.internal.synopsys.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Jose Abreu <Jose.Abreu@synopsys.com>"Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "Eugeniy.Paltsev@synopsys.com" <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

Hi Jose,

> -----Original Message-----
> From: Jose Abreu <joabreu@synopsys.com>
> Sent: Wednesday, May 8, 2019 10:29 AM
> To: Eugeniy Paltsev <paltsev@synopsys.com>; Jose.Abreu@synopsys.com; linux-kernel@vger.kernel.org;
> Vineet Gupta <vgupta@synopsys.com>; devicetree@vger.kernel.org; linux-snps-arc@lists.infradead.org
> Cc: Joao.Pinto@synopsys.com; Vineet.Gupta1@synopsys.com; Eugeniy.Paltsev@synopsys.com; Alexey Brodkin
> <abrodkin@synopsys.com>
> Subject: RE: [PATCH] ARC: [plat-hsdk]: Add missing multicast filter bins number to GMAC node
> 
> From: Eugeniy Paltsev <paltsev@synopsys.com>
> Date: Mon, May 06, 2019 at 19:19:20
> 
> > Hi,
> >
> > I'll check this in the next few days.
> >
> 
> I also noticed that FIFO size entry is missing. DWMAC1000 does not
> support automatic FIFO size detection so this entry needs to be added.

Could you please propose a patch?

-Alexey
