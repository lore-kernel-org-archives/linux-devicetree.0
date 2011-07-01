From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] ARM: CSR: Adding CSR SiRFprimaII board support
Date: Fri, 1 Jul 2011 18:26:57 +0200
Message-ID: <201107011826.57660.arnd@arndb.de>
References: <1309231954-23260-1-git-send-email-bs14@csr.com>
	<201106301236.25822.arnd@arndb.de>
	<BANLkTinkHcuXuWpCxq3tnU_10trPTjDucg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <BANLkTinkHcuXuWpCxq3tnU_10trPTjDucg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Barry Song <21cnbao@gmail.com>
Cc: linux@arm.linux.org.uk, devicetree-discuss@lists.ozlabs.org, workgroup.linux@csr.com, Grant Likely <grant.likely@secretlab.ca>, weizeng.he@csr.com, Olof Johansson <olof@lixom.net>, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Friday 01 July 2011, Barry Song wrote:
> except Wall St and stock, i really didn't realize CSR is something
> related with 'China Security & Surveillance Tech. Inc' . it seems CSR
> is much more extensively known as a company in Wireless Technology,
> Audio, Connectivity and GPS.
> if we lost this name, people might not know it came from that CSR
> focusing on Wireless/Audio/Connectivity/GPS. people will ask, what is
> CSRXF? if we really use stock sticker symbols, CSR.L is the more
> normal symbol in UK market. if we move to stock sticker symbol, could
> we use CSR.L?

CSR.L sounds ok to me, but I don't know if there are limitations on the
character set used here, can we have dots?

Maybe the best solution after all is to go with 'sirf,...': it is
actually a company name, and you own the .com address, and there is
no other company listed on wallstreet with that shortcut.

	Arnd
