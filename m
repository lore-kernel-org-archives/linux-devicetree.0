From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCHv4 10/13] ARM: versatile: convert to MULTI_IRQ_HANDLER
Date: Wed, 09 Nov 2011 10:25:01 +0000
Message-ID: <4EBA54FD.2010403@arm.com>
References: <1320369010-23428-1-git-send-email-jamie@jamieiles.com>
 <1320369010-23428-11-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1320369010-23428-11-git-send-email-jamie@jamieiles.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rmallon@gmail.com" <rmallon@gmail.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "hsweeten@visionengravers.com" <hsweeten@visionengravers.com>, "rajeev-dlh.kumar@st.com" <rajeev-dlh.kumar@st.com>, "ben-linux@fluff.org" <ben-linux@fluff.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rubini@unipv.it" <rubini@unipv.it>
List-Id: devicetree@vger.kernel.org

On 04/11/11 01:10, Jamie Iles wrote:
> Now that there is a generic IRQ handler for multiple VIC devices use it
> for versatile to help building multi platform kernels.
> 
> Cc: Russell King <linux@arm.linux.org.uk>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>

Tested-by: Marc Zyngier <marc.zyngier@arm.com>
-- 
Jazz is not dead. It just smells funny...
