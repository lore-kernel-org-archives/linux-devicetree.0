From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] powerpc: Removing support for 'protected-sources'
Date: Thu, 3 Feb 2011 16:56:38 +0100
Message-ID: <201102031656.38222.arnd@arndb.de>
References: <1296697900-14004-1-git-send-email-meador_inge@mentor.com>
	<1296697900-14004-2-git-send-email-meador_inge@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1296697900-14004-2-git-send-email-meador_inge@mentor.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: devicetree-discuss@lists.ozlabs.org
Cc: Meador Inge <meador_inge@mentor.com>, Hollis Blanchard <hollis_blanchard@mentor.com>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thursday 03 February 2011, Meador Inge wrote:
> In a recent discussion [1, 2] concerning device trees for AMP systems, the
> question of whether we really need 'protected-sources' arose.  The general
> consensus was that if you don't want a source to be used, then it should *not*
> be mentioned in an 'interrupts' property.  If a source really needs to be
> mentioned, then it should be put in a property other than 'interrupts' with
> a specific binding for that use case.
> 
> [1] http://lists.ozlabs.org/pipermail/devicetree-discuss/2011-January/004038.html
> [2] http://lists.ozlabs.org/pipermail/devicetree-discuss/2011-January/003991.html

That doesn't work in the case that this code was written for:

http://www.mail-archive.com/linuxppc-dev@lists.ozlabs.org/msg01394.html

The problem is that you don't want the mpic to initialize the interrupt
line to the default, but instead leave it at whatever the boot firmware
has set up. Note that interrupt is not listed in any "interrupts"
property of any of the devices on the CPU interpreting the device
tree, but it may be mentioned in the device tree that another CPU
uses to access the same MPIC.

	Arnd
