From: Mikael Pettersson <mikpe@it.uu.se>
Subject: Re: RFC: Host-endian device tree format
Date: Wed, 19 Jan 2011 21:10:58 +0100
Message-ID: <19767.17746.895925.532946@pilspetsen.it.uu.se>
References: <AANLkTi=AdwaW5vvm1TzNxcNrjYiJ3dOEjwoZrm-koxuw@mail.gmail.com>
	<20110119121925.2680afd1@udp111988uds.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110119121925.2680afd1@udp111988uds.am.freescale.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Scott Wood <scottwood@freescale.com>
Cc: Dave Martin <dave.martin@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Scott Wood writes:
 > What about bi-endian hardware?  Is it possible you might ever want to
 > boot a kernel in one endianness when the device tree was generated
 > assuming the opposite choice?

There are ARMs out there, for instance IXP4XXs, that
are bi-endian, and people can and do switch endianess
when booting their kernels.
